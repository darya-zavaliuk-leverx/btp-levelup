using ProcessorService as service from '../../srv/cat-service';

annotate service.ListOfIncidents with @(UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Value: title,
        Label: '{i18n>Title}',
    },
    {
        $Type: 'UI.DataField',
        Label: '{i18n>CustomerId}',
        Value: customer_ID,
    },
    {
        $Type: 'UI.DataField',
        Value: ID,
        ![@UI.Hidden],
    },
    {
        $Type: 'UI.DataField',
        Value: customer.name,
        Label: '{i18n>CustomerName}',
    },
], );
