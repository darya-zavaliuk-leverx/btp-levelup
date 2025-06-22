const ICONS = require('../config/status-icons.json')

function setStatusImage (row) {
  if (!row) return
  row.statusImageUrl = ICONS[row.status?.code]
}

module.exports = {
  setStatusImage,
  ICONS
}
