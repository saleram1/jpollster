
class IdeaNoteController {

    static allowedMethods = [save: "POST"]

    def create_for = {
        int campaignId = 0
        if ( params.campaignId && params.int( "campaignId" ) >= 1 ) {
            campaignId = params.int( "campaignId" )
        }
        else {
            redirect(controller: "idea", action: "list", params: params) // gotta send 404 or error page here
        }

        def ideaNoteInstance = new IdeaNote()
        ideaNoteInstance.theCampaign = Campaign.get(campaignId)
        ideaNoteInstance.referredBy  = request.getHeader("Referer")
        ideaNoteInstance.author = InetAddress.getByName( request.getRemoteHost() ).canonicalHostName
        return [ideaNoteInstance: ideaNoteInstance]
    }

    def save = {
        def ideaToBeSaved = 
          ( params.int( "theIdea.id" ) > 0  &&  params.abstractTxt != null  &&  !("".equals(params.abstractTxt.trim())) )

        // Okay, onwards
        def ideaNoteInstance = new IdeaNote(params)
        bindData( ideaNoteInstance, params,  [include: [ "theIdea.id", "author", "referredBy", "title", "abstractTxt", "urlName" ]])
        ideaNoteInstance.validate()

        if ( !ideaNoteInstance.hasErrors() ) {
            // call out to my brother the orig Idea
            if ( ideaToBeSaved ) {
                def oldeIdea = Idea.get( params.int( "theIdea.id" ) )
                oldeIdea.wikiPage = ideaNoteInstance.urlName
                oldeIdea.description2 = ("".equals(oldeIdea.description2) ? ideaNoteInstance.abstractTxt :
                    oldeIdea.description2 + "<BR>" + ideaNoteInstance.abstractTxt )

                if ( ! oldeIdea.hasErrors() )  {
                    oldeIdea.save()
                }
            }
            ideaNoteInstance.save(flush: true)
        }
    }
}
