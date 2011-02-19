
class CommentController {

    static allowedMethods = [save: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [commentInstanceList: Comment.list(params), commentInstanceTotal: Comment.count()]
    }

    def create = {
        return [commentInstance: new Comment()]
    }

    def create_for = {
        int ideaId = 0
        if ( params.ideaId && params.int( "ideaId" ) >= 1 ) {
            ideaId = params.int( "ideaId" )
        }
        else {
            redirect(controller: "dashboard", action: "show", params: "DefaultCampaign")
        }

        def commentInstance = new Comment()
        commentInstance.theIdea = Idea.get(ideaId)
        commentInstance.referredBy  = request.getHeader("Referer")
        commentInstance.author = InetAddress.getByName( request.getRemoteHost() ).canonicalHostName
        return [commentInstance: commentInstance]
    }

    def save = {
        withForm {
            def commentInstance = new Comment()
            bindData(commentInstance, params, [include: [ "theIdea.id", "author", "status", "description", "referredBy" ]])

            commentInstance = commentInstance.merge()
            if ( ! commentInstance.hasErrors() ) {
                commentInstance.save(flush: true)
                flash.message = "'That's my rant', as they say. Thanks for sharing!"
                redirect(url: commentInstance.referredBy)
            }
            else {
                render(view: "create", model: [commentInstance: commentInstance])
            }
        }
    }
    
    def show = {
        def commentInstance = Comment.get(params.id)
        if (!commentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'comment.label', default: 'Comment'), params.id])}"
            redirect(action: "list")
        }
        else {
            [commentInstance: commentInstance]
        }
    }
}
