
/**
 * Each post expands the description2 field of the Idea
 *
 */
class IdeaNote implements Serializable {
    Long id                     // cannot be changed so no need for version
    Long version
    Campaign theCampaign        // simply used to initialise the List of Ideas
    Idea theIdea                // cannot be null
    String author               // implicit from the session
    String referredBy           // return to this page after voting
    String title
    String abstractTxt          // tell me more...
    String urlName              // URL reference to pdf or OpenOffice doc
    Date dateCreated

    static belongsTo = Idea

    static transients = ["theCampaign"]

    static constraints = {
        theIdea()
        title( nullable: true, blank: true )
        urlName( nullable: true, blank: true, url: true )
        abstractTxt( nullable: true, blank: true, largeObject: true, maxSize:1000000 )
    }

    String toString() {
        "${title} - [${author}] on ${dateCreated.getDateTimeString()}"
    }
}
