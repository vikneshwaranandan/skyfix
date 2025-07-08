const express = require('express');
const router = express.Router();
const droneController = require('../controllers/droneController');

router.get('/', droneController.listDrones);
router.post('/dispatch', droneController.dispatchDrone);
router.get('/:id/status', droneController.getDroneStatus);

module.exports = router;
