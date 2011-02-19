class VoteMonitorService {

    boolean transactional = true

    /* do not allow more than ten votes in a 24-hour period */
    def getUserActivity( String username ) {
        def now = new Date();
        def yesterday = now - 1;

        int tally = 0
        VoteEvent.findAllByDateCreatedBetween( yesterday, now ).each { it -> 
            if ( it.author.equalsIgnoreCase( username ) ) { 
                tally += it.numVotes
            }
        }
        return tally
    }
}
