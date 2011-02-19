
class Comment implements Serializable {
    Idea theIdea                // all based around a parent
    Long id
    String author               // anon. allowed
    String status               // optional - maybe used by admins to indicate started
    String description          // needs to be required
    String referredBy
    Date dateCreated

    static belongsTo = Idea

    static searchable = true

    static constraints = {
        theIdea()
        author(  nullable: true, blank: true )
        status( nullable: true, blank: true, inList: [ "review board", "planned", "started", "completed", "(Politely) declined" ] )
        description( nullable: false, blank: false, widget: "textarea" )
    }

    // reserved word in ORACLE,PostgreSQL and likely some other database softwares
    static mapping = {
        table 'comment_tbl'
    }

    public Comment() {
        dateCreated = new Date()
        description = "Please enter your comment here..."
    }

    String toString() {
        if ( author != null ) 
            "${description} - [${author}] on ${dateCreated.getDateTimeString()}"
        else 
            "Anon.: ${description}"
    }
}
