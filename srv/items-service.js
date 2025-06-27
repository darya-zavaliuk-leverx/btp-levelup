const cds = require("@sap/cds");

class ItemsService extends cds.ApplicationService {
  init() {
    const { Items } = this.entities;

    this.before("CREATE", Items, (req) => {
      if (req.data.quantity > 100) {
        req.error(400, "Quantity must not exceed 100");
      }
    });

    this.on("getItemsByQuantity", async (req) => {
      const { quantity } = req.data;
      return SELECT.from(Items).where({ quantity });
    });

    this.on("createItem", async (req) => {
      const { title, descr, quantity } = req.data;

      if (!title || typeof title !== "string" || title.trim().length === 0) {
        return req.error(
          400,
          "Title is required and must be a non-empty string."
        );
      }

      if (!descr || typeof descr !== "string" || descr.trim().length === 0) {
        return req.error(
          400,
          "Description is required and must be a non-empty string."
        );
      }

      if (
        quantity === undefined ||
        typeof quantity !== "number" ||
        quantity < 0
      ) {
        return req.error(400, "Quantity must be a non-negative number.");
      }

      if (quantity > 100) {
        return req.error(400, "Quantity must be no more than 100.");
      }

      const result = await INSERT.into(Items).entries({
        title,
        descr,
        quantity,
      });
      return result;
    });

    return super.init();
  }
}

module.exports = { ItemsService };
