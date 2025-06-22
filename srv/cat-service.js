const cds = require('@sap/cds')

module.exports = cds.service.impl(function () {
  const { Incidents } = this.entities

  const ICONS = {
    N: 'sap-icon://status-inactive',
    A: 'sap-icon://status-in-process',
    I: 'sap-icon://activate',
    H: 'sap-icon://pending',
    R: 'sap-icon://accept',
    C: 'sap-icon://decline'
  }

  this.after('READ', Incidents, (each) => {
    const rows = Array.isArray(each) ? each : [each]
    for (const row of rows) setImage(row)
  })

  function setImage (row) {
    if (!row) return
    row.statusImageUrl = ICONS[row.status?.code]
  }
})