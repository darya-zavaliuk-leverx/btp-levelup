const cds = require('@sap/cds');

class ItemsService extends cds.ApplicationService {
  init() {
    const { Items } = this.entities;

    this.before('CREATE', Items, req => {
      if (req.data.quantity > 100) {
        req.error(400, 'Quantity must not exceed 100');
      }
    });

    this.on('getItemsByQuantity', async req => {
      const { quantity } = req.data;
      return SELECT.from(Items).where({ quantity });
    });

    this.on('createItem', async req => {
      const { title, descr, quantity } = req.data;
      const result = await INSERT.into(Items).entries({ title, descr, quantity });
      return result;
    });

    return super.init();
  }
}

module.exports = { ItemsService };
