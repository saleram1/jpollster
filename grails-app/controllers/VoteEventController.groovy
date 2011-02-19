
class VoteEventController {
    def voteMonitorService

    static allowedMethods = [save: "POST"]

    def create = {
        return [voteEventInstance: new VoteEvent()]
    }

    def create_for = {
        int campaignId = 0
        if ( params.campaignId && params.int( "campaignId" ) >= 1 ) {
            campaignId = params.int( "campaignId" )
        }
        else {
            redirect(controller: "idea", action: "list", params: params)
        }

        def voteEventInstance = new VoteEvent()
        voteEventInstance.theCampaign = Campaign.get(campaignId)
        voteEventInstance.referredBy  = request.getHeader("Referer")
        voteEventInstance.author = InetAddress.getByName( request.getRemoteHost() ).canonicalHostName
        return [voteEventInstance: voteEventInstance]
    }

    def create_for_idea = {
        int ideaId = 0
        if ( params.ideaId && params.int( "ideaId" ) >= 1 ) {
            ideaId = params.int( "ideaId" )
        }
        else {
            redirect(controller: "idea", action: "list", params: params)
        }

        def voteEventInstance = new VoteEvent()
        voteEventInstance.theCampaign = null
        voteEventInstance.theIdea = Idea.get(ideaId)
        voteEventInstance.referredBy  = request.getHeader("Referer")
        voteEventInstance.author = InetAddress.getByName( request.getRemoteHost() ).canonicalHostName
        return [voteEventInstance: voteEventInstance]
    }
    
    def save = {
        withForm {
            def voteEventInstance = new VoteEvent()
            bindData(voteEventInstance, params, [include: [ "theIdea.id", "author", "votesToSpend", "ownerInternetAddress", "referredBy" ]])
            voteEventInstance.validate()

            int currentVotes = voteMonitorService.getUserActivity( voteEventInstance.author )
            int additionalVotes =          
                Integer.valueOf( voteEventInstance.votesToSpend.substring(0, voteEventInstance.votesToSpend.indexOf(" -") ) )

            if ( currentVotes + additionalVotes > VoteEvent.MAX_VOTES_PER_DAY ) {
                flash.message = "Houston we have a problem!  Exhausted Vote counter - please visit us again tomorrow."
            }            
            else if ( !voteEventInstance.hasErrors() && voteEventInstance.save(flush: true)) {
                flash.message = "Your vote counts!  Thank you for supporting - ${voteEventInstance.theIdea}"
            }
            redirect(url: voteEventInstance.referredBy)
        }
    }

}
