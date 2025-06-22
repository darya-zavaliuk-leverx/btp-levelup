using {sap.capire.incidents as my} from '../db';

/**
 * Service used by support personell, i.e. the incidents' 'processors'.
 */
service ProcessorService {
    @cds.redirection.target
    entity Incidents       as
        projection on my.Incidents {
            *,
            virtual null as statusImageUrl : String
        };

    @readonly
    entity ListOfIncidents as
        projection on my.Incidents {
            ID,
            title,
            customer
        };

    @readonly
    entity Customers       as projection on my.Customers;

    entity Comments        as projection on my.Comments;

    @readonly
    entity Status  as projection on my.Status;

    @readonly
    entity Urgency as projection on my.Urgency;
}
