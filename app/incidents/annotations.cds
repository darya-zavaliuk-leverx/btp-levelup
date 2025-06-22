using ProcessorService as service from '../../srv/cat-service';
using from '../../db/schema';

annotate service.Incidents with @(
    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: '{i18n>CustomerId}',
                Value: customer.ID
            },
            {
                $Type: 'UI.DataField',
                Value: title,
                Label: '{i18n>Title}',
            },
        ],
    },
    UI.Facets                    : [
        {
            $Type : 'UI.CollectionFacet',
            Label : '{i18n>Overview}',
            ID    : 'i18nOverview',
            Facets: [
                {
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'GeneratedFacet1',
                    Label : '{i18n>GeneralInformation}',
                    Target: '@UI.FieldGroup#GeneratedGroup',
                },
                {
                    $Type               : 'UI.ReferenceFacet',
                    Label               : '{i18n>Details}',
                    ID                  : 'i18nDetails',
                    Target              : '@UI.FieldGroup#i18nDetails',
                    ![@UI.PartOfPreview]: false,
                },
            ],
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Conversation}',
            ID    : 'Conversation',
            Target: 'conversation/@UI.LineItem#Conversation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Comments}',
            ID    : 'Comments',
            Target: 'comments/@UI.LineItem#Comments',
        },
    ],
    UI.LineItem                  : [
        {
            $Type: 'UI.DataField',
            Value: title,
            Label: '{i18n>Title}',
        },
        {
            $Type: 'UI.DataField',
            Value: customer.name,
            Label: '{i18n>CustomerName}',
        },
        {
            $Type      : 'UI.DataField',
            Value      : status.descr,
            Criticality: status.criticality,
            Label      : '{i18n>StatusCode}',
        },
        {
            $Type: 'UI.DataField',
            Value: status_code,
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: statusImageUrl,
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: urgency.descr,
            Label: '{i18n>Urgency}',
        },
        {
            $Type: 'UI.DataField',
            Value: urgency_code,
            ![@UI.Hidden],
        },
    ],
    UI.SelectionFields           : [
        status_code,
        urgency_code,
        title
    ],
    UI.HeaderInfo                : {
        Title         : {
            $Type: 'UI.DataField',
            Value: title,
        },
        TypeName      : '',
        TypeNamePlural: '',
        Description   : {
            $Type: 'UI.DataField',
            Value: customer.name,
        },
        TypeImageUrl  : statusImageUrl,
    },
    UI.FieldGroup #i18nDetails   : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: status_code,
            },
            {
                $Type: 'UI.DataField',
                Value: urgency_code,
            },
        ],
    },
);

annotate service.Incidents with {
    customer @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Customers',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: customer_ID,
                    ValueListProperty: 'ID',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'name',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'email',
                },
            ],
        },
        Common.Text                    : {
            $value                : customer.name,
            ![@UI.TextArrangement]: #TextOnly
        },
        Common.ValueListWithFixedValues: true,
    )
};

annotate service.Incidents with {
    status @(
        Common.Label                   : '{i18n>StatusCode}',
        Common.ValueListWithFixedValues: true,
        Common.Text                    : status.descr
    )
};

annotate service.Incidents with {
    statusImageUrl @(UI.HiddenFilter: true);
}

annotate service.Incidents with {
    urgency @(
        Common.Label                   : '{i18n>UrgencyCode}',
        Common.ValueListWithFixedValues: true,
        Common.Text                    : urgency.descr
    )
};

annotate service.Status with {
    code @Common.Text: descr
};

annotate service.Urgency with {
    code @Common.Text: descr
};

annotate service.Incidents.conversation with @(UI.LineItem #Conversation: [
    {
        $Type: 'UI.DataField',
        Value: message,
        Label: '{i18n>Message}',
    },
    {
        $Type: 'UI.DataField',
        Value: author,
    },
    {
        $Type: 'UI.DataField',
        Value: timestamp,
    },
    {
        $Type: 'UI.DataField',
        Value: ID,
        ![@UI.Hidden],
    },
    {
        $Type: 'UI.DataField',
        Value: up__ID,
        ![@UI.Hidden],
    },
]);

annotate service.Comments with @(UI.LineItem #Comments: [
    {
        $Type: 'UI.DataField',
        Value: comment,
        Label: '{i18n>Comment}'
    },
    {
        $Type: 'UI.DataField',
        Value: createdBy,
        Label: '{i18n>Author}'
    },
    {
        $Type: 'UI.DataField',
        Value: createdAt,
        Label: '{i18n>CreatedAt}'
    },
    {
        $Type: 'UI.DataField',
        Value: ID,
        ![@UI.Hidden],
    },
    {
        $Type: 'UI.DataField',
        Value: incident_ID,
        ![@UI.Hidden],
    },
]);

annotate service.Incidents with {
    ID @(UI.HiddenFilter)
};

annotate service.Incidents with {
    title @(
        Common.Text : customer.name,
        Common.Label: '{i18n>Title}',
    )
};
