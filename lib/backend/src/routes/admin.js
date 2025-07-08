const express = require('express');
const router = express.Router();
const adminController = require('../controllers/adminController');

router.get('/fleet', adminController.getFleet);
router.get('/repairs', adminController.getRepairs);
router.get('/inventory', adminController.getInventory);
router.get('/support', adminController.getSupport);
router.get('/dashboard', adminController.getDashboard);

module.exports = router;
