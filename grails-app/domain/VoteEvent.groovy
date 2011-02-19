
class VoteEvent implements Serializable {
    Long id                     // cannot be changed so no need for version
    Idea theIdea                // cannot be null - pay attention Votes can be cast for Idea or IdeaResponse in future
    String author               // implicit from the session
    String referredBy           // return to this page after voting
    Integer numVotes            // actual number of Votes
    String votesToSpend         // make it nice
    Date dateCreated
    Campaign theCampaign        // simply used to initialise the List of Ideas

    static transients = ["theCampaign", "votesToSpend"]

    static belongsTo = Idea

    static constraints = {
        theCampaign( nullable: true )
        theIdea()
        author(nullable: true, blank: true) // defaults to current username
        votesToSpend( inList: [ "1 - like this one", "2 - want it badly", "3 - need this yesterday, or ASAP!" ] )
        numVotes( nullable: true, blank: true, readonly: true )
    }

    static int MAX_VOTES_PER_DAY = 5

    def beforeInsert = {
        numVotes = Integer.valueOf( votesToSpend.substring(0, votesToSpend.indexOf(" -")) )
    }

    def beforeUpdate = {
        numVotes = Integer.valueOf( votesToSpend.substring(0, votesToSpend.indexOf(" -")) )
    }

    String toString() {
        if ( numVotes > 0 && dateCreated != null ) {
            return "${author} awards ${numVotes} votes at ${dateCreated}"
        }
        else {
            return "No rockin' the vote."
        }
    }
}
