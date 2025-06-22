const { setStatusImage } = require('../lib/status-utils')

module.exports = srv => {
  const { Incidents } = srv.entities

  srv.after('READ', Incidents, each => {
    const rows = Array.isArray(each) ? each : [each]
    for (const row of rows) setStatusImage(row)
  })
}
