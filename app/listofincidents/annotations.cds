using ProcessorService as service from '../../srv/cat-service';

annotate service.ListOfIncidents with @(
    UI.LineItem: [
        { $Type: 'UI.DataField', Value: title, Label: '{i18n>Title}' },
        { $Type: 'UI.DataField', Value: customer.name, Label: '{i18n>CustomerName}' }
    ],
    UI.SelectionFields: [ title ]
);
