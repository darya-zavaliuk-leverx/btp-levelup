using {sap.capire.incidents as my} from '../db';

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
