using {sap.capire.incidents as my} from '../db/schema';

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
}

/**
 * Service used by administrators to manage customers and incidents.
 */
service AdminService {
    entity Customers as projection on my.Customers;

    @cds.redirection.target
    entity Incidents as
        projection on my.Incidents {
            *,
            virtual null as statusImageUrl : String
        };

    entity Comments  as projection on my.Comments;
}

annotate ProcessorService.Incidents with @odata.draft.enabled;
annotate ProcessorService with @(requires: 'support');
annotate AdminService with @(requires: 'admin');
