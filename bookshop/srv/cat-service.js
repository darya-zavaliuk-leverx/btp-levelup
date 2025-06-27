module.exports = (srv) => {
  const { Books } = srv.entities;

  srv.after('READ', 'Books', each => {
    if (each.stock > 111) each.title += ' -- 11% discount!';
  });
};
