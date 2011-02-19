
class IdeaController {

    static allowedMethods = [save: "POST", update: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [ideaInstanceList: Idea.list(params), ideaInstanceTotal: Idea.count()]
    }

    def create = {
        return [ideaInstance: new Idea()]
    }

    def pad = {
        return [ideaNoteInstance: new IdeaNote()]
    }

    def create_for = {
        int campaignId = 0
        if ( params.campaignId &&  params.int( "campaignId" ) >= 1 ) {
            campaignId = params.int( "campaignId" )
        }

        //we need to build a reference to one of the two in order to associate with some parent
        if ( campaignId == 0 ) {
            redirect(action: "create", params: params)
        }

        def ideaInstance = new Idea()
        ideaInstance.theCampaign = Campaign.get(campaignId)
        ideaInstance.referredBy  = request.getHeader("referer")
        return [ideaInstance: ideaInstance]
    }

    def save = {
        withForm {
            def ideaInstance = new Idea()
            bindData(ideaInstance, params, [include: [ "theCampaign.id", "topic", "description", "ownerInternetAddress", "referredBy", "wikiPage" ]])
            ideaInstance.validate()
            
            if ( !ideaInstance.hasErrors() && ideaInstance.save(flush: true)) {
                flash.message =
                    "Thank YOU for your feedback!  Recorded Idea #A0000000000${ideaInstance.id}, added to parent ..."
                redirect(url: ideaInstance.referredBy)
            }
            else {
                render(view: "create", model: [ideaInstance: ideaInstance])
            }
        }
    }

    def show = {
        def ideaInstance = Idea.get(params.id)
        if (!ideaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'idea.label', default: 'Idea'), params.id])}"
            redirect(action: "list")
        }
        else {
            [ideaInstance: ideaInstance]
        }
    }

    def edit = {
        def ideaInstance = Idea.get(params.id)
        if (!ideaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'idea.label', default: 'Idea'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [ideaInstance: ideaInstance]
        }
    }

    def update = {
        def ideaInstance = Idea.get(params.id)
        if (ideaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (ideaInstance.version > version) {
                    
                    ideaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'idea.label', default: 'Idea')] as Object[], "Another user has updated this Idea while you were editing")
                    render(view: "edit", model: [ideaInstance: ideaInstance])
                    return
                }
            }
            ideaInstance.properties = params
            if (!ideaInstance.hasErrors() && ideaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'idea.label', default: 'Idea'), ideaInstance.id])}"
                redirect(action: "show", id: ideaInstance.id)
            }
            else {
                render(view: "edit", model: [ideaInstance: ideaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'idea.label', default: 'Idea'), params.id])}"
            redirect(action: "list")
        }
    }
}
