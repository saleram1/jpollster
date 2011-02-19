
class CampaignController {

    static allowedMethods = [save: "POST", update: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [campaignInstanceList: Campaign.list(params), campaignInstanceTotal: Campaign.count()]
    }

    def create = {
        def campaignInstance = new Campaign()
        campaignInstance.properties = params
        return [campaignInstance: campaignInstance]
    }

    def create2 = {
        return [campaignInstance: new Campaign()]
    }

    def save = {
        withForm {
            def campaignInstance = new Campaign(params)
            if ( !campaignInstance.hasErrors() ) 
            {
                campaignInstance.save()
                flash.message =
                    "${message(code: 'default.created.message', args: [message(code: 'campaign.label', default: 'Campaign'), campaignInstance.id])}"
                redirect(uri: "/dashboard/" + campaignInstance.name)
            }
            else {
                render(view: "create", model: [campaignInstance: campaignInstance])
            }
        }
    }

    def saveEx = {
        def campaignInstance = new Campaign(params)
        if ( !campaignInstance.hasErrors() ) 
	{
	    campaignInstance.save()
        	render( contentType:'text/plain', text: 'save successfull...')
        }
        else {
	  render( contentType:'text/plain', text: campaignInstance.errors )
	}
    }

    def show = {
        def campaignInstance = Campaign.get(params.id)
        if (!campaignInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'campaign.label', default: 'Campaign'), params.id])}"
            redirect(action: "list")
        }
        else {
            [campaignInstance: campaignInstance]
        }
    }

    def edit = {
        def campaignInstance = Campaign.get(params.id)
        if (!campaignInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'campaign.label', default: 'Campaign'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [campaignInstance: campaignInstance]
        }
    }

    def update = {
        def campaignInstance = Campaign.get(params.id)
        if (campaignInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (campaignInstance.version > version) {
                    
                    campaignInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'campaign.label', default: 'Campaign')] as Object[], "Another user has updated this Campaign while you were editing")
                    render(view: "edit", model: [campaignInstance: campaignInstance])
                    return
                }
            }
            campaignInstance.properties = params
            if (!campaignInstance.hasErrors() && campaignInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'campaign.label', default: 'Campaign'), campaignInstance.id])}"
                redirect(action: "show", id: campaignInstance.id)
            }
            else {
                render(view: "edit", model: [campaignInstance: campaignInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'campaign.label', default: 'Campaign'), params.id])}"
            redirect(action: "list")
        }
    }
}
