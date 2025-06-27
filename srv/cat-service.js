const cds = require('@sap/cds');

const ICONS = {
  N: 'sap-icon://status-inactive',
  A: 'sap-icon://status-in-process',
  I: 'sap-icon://activate',
  H: 'sap-icon://pending',
  R: 'sap-icon://accept',
  C: 'sap-icon://decline'
};

class ProcessorService extends cds.ApplicationService {
  /** Registering custom event handlers */
  init() {
    const { Incidents, Customers } = this.entities;

    // BEFORE handlers
    this.before("CREATE", Incidents, (req) => this.changeUrgencyDueToSubject(req.data));
    this.before("UPDATE", Incidents, (req) => this.onUpdate(req));

    // AFTER handler
    this.after("READ", Incidents, (each) => {
      const rows = Array.isArray(each) ? each : [each];
      for (const row of rows) this.setImage(row);
    });

    this.before('READ', Incidents, async req => {
      const customers = await cds.transaction(req)
        .run(SELECT.from(Customers));

        console.log(customers)
    });

    return super.init();
  }

  changeUrgencyDueToSubject(data) {
    if (!data) return;
    const incidents = Array.isArray(data) ? data : [data];
    for (const incident of incidents) {
      if (incident.title?.toLowerCase().includes("urgent")) {
        incident.urgency = { code: "H", descr: "High" };
      }
    }
  }

  async onUpdate(req) {
    const { status_code } = await SELECT.one(req.subject, i => i.status_code).where({ ID: req.data.ID });
    if (status_code === 'C') {
      return req.reject(`Can't modify a closed incident`);
    }
  }

  setImage(row) {
    if (!row) return;
    row.statusImageUrl = ICONS[row.status?.code];
  }
}

module.exports = { ProcessorService };
