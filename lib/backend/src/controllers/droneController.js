const drones = [
  { id: 1, type: 'tire', status: 'available' },
  { id: 2, type: 'battery', status: 'available' },
  { id: 3, type: 'fuel', status: 'available' },
  { id: 4, type: 'relay', status: 'available' }
];
const missions = [];

exports.listDrones = (req, res) => {
  res.json({ drones });
};

exports.dispatchDrone = (req, res) => {
  const { incidentId, droneType } = req.body;
  const drone = drones.find(d => d.type === droneType && d.status === 'available');
  if (!drone) return res.status(400).json({ message: 'No available drone of requested type' });
  drone.status = 'dispatched';
  const mission = { id: missions.length + 1, incidentId, droneId: drone.id, status: 'en route' };
  missions.push(mission);
  res.status(200).json({ message: 'Drone dispatched', mission });
};

exports.getDroneStatus = (req, res) => {
  const drone = drones.find(d => d.id === parseInt(req.params.id));
  if (!drone) return res.status(404).json({ message: 'Drone not found' });
  res.json({ drone });
};
