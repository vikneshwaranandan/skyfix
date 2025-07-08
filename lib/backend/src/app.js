const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');

const userRoutes = require('./routes/user');
const incidentRoutes = require('./routes/incident');
const droneRoutes = require('./routes/drone');
const repairRoutes = require('./routes/repair');
const adminRoutes = require('./routes/admin');

const app = express();

app.use(cors());
app.use(bodyParser.json());

app.use('/api/users', userRoutes);
app.use('/api/incidents', incidentRoutes);
app.use('/api/drones', droneRoutes);
app.use('/api/repairs', repairRoutes);
app.use('/api/admin', adminRoutes);

app.get('/', (req, res) => {
  res.send('SkyFix API is running');
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
