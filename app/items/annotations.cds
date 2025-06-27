using ItemsService as service from '../../srv/items-service';

annotate service.Items with @(
    UI.LineItem : [
        { $Type: 'UI.DataField', Value: title, Label: 'Title' },
        { $Type: 'UI.DataField', Value: descr, Label: 'Description' },
        { $Type: 'UI.DataField', Value: quantity, Label: 'Quantity' }
    ]
);
