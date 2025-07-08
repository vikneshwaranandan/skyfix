const express = require('express');
const router = express.Router();
const repairController = require('../controllers/repairController');

router.get('/:id', repairController.getRepairSession);
router.post('/:id/feedback', repairController.submitFeedback);
router.post('/:id/escalate', repairController.escalateToHuman);

module.exports = router;
