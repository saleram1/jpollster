import org.codehaus.groovy.grails.commons.GrailsApplication
import grails.util.GrailsUtil

 
class BootStrap {

    def init = { servletContext ->
        if (GrailsUtil.environment.equals( GrailsApplication.ENV_DEVELOPMENT )) {
            log.info( "Loading sample Campaigns..." );            

            new Campaign( name: "innovations", summary: "How can the IT Developers be more innovative?", isPrivate: false, isQuestionnaire: true ).save( flush: true )
            new Campaign( name: "agileTeams", summary: "Making IT Development Teams More AGILE", isPrivate: true ).save( flush: true )
            new Campaign( name: "DefaultCampaign", summary: "Default Summary here" ).save( flush: true )

            def aCampaign = Campaign.findByName( "agileTeams" ) // subtle - this is redirected in index.gsp for now
            new Idea( theCampaign: aCampaign,
                      topic: "Establish On-site Customer and train PM's how to be Scrummaster", description: "On-site customer will drive the reqts and user stories -  once we train up PMs we can setup a train-the-trainer approach. What's the core of Lean/Agile/XP is having solid understanding of the real requirements *first*.", ownerInternetAddress: "nospam@nospam.net", referredBy: "localhost" ).save()

            new Idea( theCampaign: aCampaign, topic: "Build a better dynamic workspace for pairing", description: "Goto IKEA shopping for benches... Build a workspace where two groups can pair up", ownerInternetAddress: "nospam@nospam.net", referredBy: "localhost" ).save()
            
            new Idea( theCampaign: aCampaign, topic:"Hire Talented Programmers, feed them, give them some office space ...", description: "Hire Talented Programmers, feed them, give them some office space ... and let us talk about fair and balanced salary and bonus", ownerInternetAddress: "nospam@nospam.net", referredBy: "localhost" ).save()
            
            new Idea( theCampaign: aCampaign,
topic: "Agile testing in large team on large code base, sharing the experience", description: "Agile testing in large team on large code base, sharing the experience - has anyone done this before ?", ownerInternetAddress: "arco@willnot.com", referredBy: "localhost" ).save(flush: true)


            aCampaign = Campaign.findByName( "innovations" )
            new Idea( theCampaign: aCampaign,
                      topic: "Allow FlexTime and TeleCommute options", description: "Providing better hours and more ways to spark creativity", ownerInternetAddress: "nospam@nospam.net", referredBy: "localhost" ).save()
            def myIdea = new Idea( theCampaign: aCampaign,
                      topic: "Forget Foosball", description: "How 'bout catered lunches every Thursday?", ownerInternetAddress: "nospam@nospam.net", referredBy: "localhost" )
myIdea.save( flush: true)

            new Comment( author: "anonymous", referredBy: "http://localhost/pollster/dash/innovations/", theIdea: myIdea, description: "Please don't knock team sports - how about we install not a full rec room, but a regulation ping-pong table?" ).save()


            // log can be stubborn called from controllers and BootStrap
            println( "Campaigns:         " + Campaign.list().size() )
            println( "Ideas:             " + Idea.list().size() )
            println( "Constant Comments: " + Comment.list().size() )
        }
     }
     def destroy = {
     }
} 
