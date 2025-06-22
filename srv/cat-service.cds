using {sap.capire.incidents as my} from '../db/schema';

/**
 * Service used by support personell, i.e. the incidents' 'processors'.
 */
service ProcessorService {
    @cds.redirection.target
    entity Incidents       as projection on my.Incidents {
        *,
        statusImageUrl : String;
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
    entity Incidents as projection on my.Incidents {
        *,
        statusImageUrl : String;
    };

    entity Comments  as projection on my.Comments;
}

annotate ProcessorService.Incidents with @odata.draft.enabled;

annotate ProcessorService.Incidents with {
    ID @UI.Hidden;
    customer @UI.Hidden;
};
