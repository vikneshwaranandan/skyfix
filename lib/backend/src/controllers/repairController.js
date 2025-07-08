const repairs = [];

exports.getRepairSession = (req, res) => {
  const repair = repairs.find(r => r.id === parseInt(req.params.id));
  if (!repair) return res.status(404).json({ message: 'Repair session not found' });
  res.json({ repair });
};

exports.submitFeedback = (req, res) => {
  const repair = repairs.find(r => r.id === parseInt(req.params.id));
  if (!repair) return res.status(404).json({ message: 'Repair session not found' });
  repair.feedback = req.body.feedback;
  res.json({ message: 'Feedback submitted', repair });
};

exports.escalateToHuman = (req, res) => {
  const repair = repairs.find(r => r.id === parseInt(req.params.id));
  if (!repair) return res.status(404).json({ message: 'Repair session not found' });
  repair.status = 'escalated to human';
  res.json({ message: 'Repair escalated to human mechanic', repair });
};
