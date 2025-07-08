exports.getFleet = (req, res) => {
  res.json({ fleet: [
    { id: 1, type: 'tire', status: 'available' },
    { id: 2, type: 'battery', status: 'dispatched' }
  ] });
};

exports.getRepairs = (req, res) => {
  res.json({ repairs: [
    { id: 1, status: 'complete' },
    { id: 2, status: 'pending' }
  ] });
};

exports.getInventory = (req, res) => {
  res.json({ inventory: [
    { item: 'tire patch', quantity: 10 },
    { item: 'battery pack', quantity: 5 }
  ] });
};

exports.getSupport = (req, res) => {
  res.json({ supportTickets: [
    { id: 1, status: 'open' },
    { id: 2, status: 'closed' }
  ] });
};

exports.getDashboard = (req, res) => {
  res.json({ stats: { users: 100, incidents: 20, repairs: 15 } });
};
