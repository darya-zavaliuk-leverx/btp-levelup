sap.ui.define([
  "sap/ui/core/mvc/XMLView",
  "sap/ui/model/odata/v4/ODataModel"
], function(XMLView, ODataModel) {
  "use strict";

  var oModel = new ODataModel({
    serviceUrl: "/odata/v4/processor/"
  });

  XMLView.create({
    viewName: "freestyle.view.MainView"
  }).then(function(oView) {
    oView.setModel(oModel);
    oView.placeAt("content");
  });
});
