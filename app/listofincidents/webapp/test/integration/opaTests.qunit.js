sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ns/listofincidents/listofincidents/test/integration/FirstJourney',
		'ns/listofincidents/listofincidents/test/integration/pages/ListOfIncidentsList',
		'ns/listofincidents/listofincidents/test/integration/pages/ListOfIncidentsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ListOfIncidentsList, ListOfIncidentsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ns/listofincidents/listofincidents') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheListOfIncidentsList: ListOfIncidentsList,
					onTheListOfIncidentsObjectPage: ListOfIncidentsObjectPage
                }
            },
            opaJourney.run
        );
    }
);