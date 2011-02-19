
/**
 * Campaign/Cetegory and Idea are the foundation classes of this 
 * application - most others require reference to Idea in order to 
 * make any sense  @see VoteEvent, Comment, IdeaNote
 *
 */
class Campaign implements Serializable, Comparable {
    Long id                     // required
    Long version
    String name                 // required - kindof a nickname see UrlMappings.groovy for more
    String summary              // this is the text of the question/post
    Boolean isPrivate           // coming soon
    Boolean isQuestionnaire     // show a question icon - instead of the schoolhouse rock the vote
    String ownerInternetAddress // optional contact
    Boolean emailNotify         // notify owner when there are posts - configurable on demand or daily digest
    Date openUntilDate          // close the votes after this date
    Date dateCreated

    static hasMany = [ ideas : Idea ]

    static fetchMode = [ ideas : "eager" ]

    static constraints = {
        name( nullable: false, blank: false, maxSize: 100 )
        summary( nullable: false, blank: false, maxSize: 4000 )
        isPrivate( nullable: true )
        isQuestionnaire( nullable: true )
        openUntilDate( nullable: true )
        ownerInternetAddress(nullable: true, blank: true, email: true)
        emailNotify( nullable: true, blank: true )
    }

    static searchable = true

    public Campaign() {
        isPrivate = false
        isQuestionnaire = true
        openUntilDate = new Date() + (2*365)
        emailNotify = false
    }

    String toString() {
        "${name}"
    }

    int compareTo( Object obj ) {
        return this.name.compareTo( ((Campaign)obj).name )
    }
}
