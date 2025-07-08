const express = require('express');
const router = express.Router();
const incidentController = require('../controllers/incidentController');

router.post('/', incidentController.reportIncident);
router.get('/:id', incidentController.getIncidentById);
router.get('/', incidentController.getUserIncidents);

module.exports = router;
