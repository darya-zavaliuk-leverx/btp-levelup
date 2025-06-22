const cds = require('@sap/cds')

module.exports = cds.service.impl(function () {
  const { Incidents } = this.entities

  this.after('READ', Incidents, (each) => {
    const rows = Array.isArray(each) ? each : [each]
    for (const row of rows) setImage(row)
  })

  function setImage (row) {
    if (!row) return
    switch (row.status_code) {
      case 'N':
        row.statusImageUrl = 'sap-icon://status-inactive'
        break
      case 'A':
        row.statusImageUrl = 'sap-icon://status-in-process'
        break
      case 'I':
        row.statusImageUrl = 'sap-icon://activate'
        break
      case 'H':
        row.statusImageUrl = 'sap-icon://pending'
        break
      case 'R':
        row.statusImageUrl = 'sap-icon://accept'
        break
      case 'C':
        row.statusImageUrl = 'sap-icon://decline'
        break
      default:
        row.statusImageUrl = 'sap-icon://question-mark'
    }
  }
})
