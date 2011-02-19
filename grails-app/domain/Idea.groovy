
/**
 * Campaign/Cetegory and Idea are the foundation classes of this 
 * application - most others require reference to Idea in order to 
 * make any sense  @see VoteEvent, Comment, IdeaNote
 *
 */
class Idea 
 implements Serializable, Comparable {

    Long id                     // primary key - standard
    Long version
    String topic                // basic synopsis
    String description          // tell me more about it
    String referredBy           // url
    String ownerInternetAddress // optional contact
    String wikiPage             // more info or attachment pdf or other document rtf
    Date dateCreated
    Date lastUpdated
    String description2         // RichText version - only supported in parent
    Integer initialVotes = 0    // this could default to something neutral like 'just record it'
    Campaign theCampaign

    static hasMany = [ votes: VoteEvent, comments: Comment, notes: IdeaNote ]

    static searchable = true

    static constraints = {
        topic( nullable: false, blank: false )
        ownerInternetAddress( nullable: true, email: true )
        wikiPage( nullable: true, blank: true, url: true )
        theCampaign()
        description( nullable: true, blank: true, widget: "textarea" )
        description2( nullable: true, blank: true, largeObject: true, maxSize: 2000000 )
    }    

    int compareTo(Object obj) {
        return (obj.dateCreated <=> dateCreated)
    }
    
    String toString() {
        "${topic}"
    }

    String descriptionDotTrim() {
        if ( description != null && !"".equals( description.trim() ) ) {
            int len = description.length()
            description.substring(0, ((len>400 ? 400 : len))) + (len>400 ? "..." : "")
        }
        else {
            ""
        }
    }

    Integer voteCount() {
        int totalVotes = 0

        def myList = []
        myList.addAll( votes )
        myList.each {
            totalVotes += it.numVotes
        }
        return new Integer( totalVotes )
    }
}
