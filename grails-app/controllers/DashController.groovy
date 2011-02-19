
/**
  This class is mapped from UrlMappings to give campaigns a friendlyName

*/
class DashController {

    def show = { 
        def campaignInstance = Campaign.findByName(params.id)
        if (!campaignInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'campaign.label', default: 'Campaign'), params.id])}"
            redirect(controller: "campaign", action: "list")
        }
        else {
	    [campaignInstance: campaignInstance]
        }
    }

    def show_idea = { 
        def ideaInstance = Idea.get(params.id)
        if (!ideaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'idea.label', default: 'Idea'), params.id])}"
            redirect(controller: "idea", action: "list")
        }
        else {
	    [ideaInstance: ideaInstance]
        }
    }
}
