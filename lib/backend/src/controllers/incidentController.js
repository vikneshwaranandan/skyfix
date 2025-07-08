const incidents = [];

exports.reportIncident = (req, res) => {
  const { userId, description, location } = req.body;
  const incident = { id: incidents.length + 1, userId, description, location, status: 'reported', createdAt: new Date() };
  incidents.push(incident);
  res.status(201).json({ message: 'Incident reported', incident });
};

exports.getIncidentById = (req, res) => {
  const incident = incidents.find(i => i.id === parseInt(req.params.id));
  if (!incident) return res.status(404).json({ message: 'Incident not found' });
  res.json({ incident });
};

exports.getUserIncidents = (req, res) => {
  const { userId } = req.query;
  const userIncidents = incidents.filter(i => i.userId == userId);
  res.json({ incidents: userIncidents });
};
