using { ProcessorService } from './processor-service';

annotate ProcessorService.Incidents with @odata.draft.enabled;

annotate ProcessorService.Incidents with {
    ID       @UI.Hidden;
    customer @UI.Hidden;
};
