const users = [{
  email: 'admin@skyfix.com',
  password: 'admin123',
  name: 'Admin'
}];

exports.register = (req, res) => {
  const { email, password, name } = req.body;
  if (users.find(u => u.email === email)) {
    return res.status(400).json({ message: 'User already exists' });
  }
  const user = { id: users.length + 1, email, password, name };
  users.push(user);
  res.status(201).json({ message: 'User registered', user: { id: user.id, email, name } });
};

exports.login = (req, res) => {
  const { email, password } = req.body;
  const user = users.find(u => u.email === email && u.password === password);
  if (!user) {
    return res.status(401).json({ message: 'Invalid credentials' });
  }
  res.json({ message: 'Login successful', user: { id: user.id, email: user.email, name: user.name } });
};

exports.me = (req, res) => {
  // For MVP, just return the first user
  if (users.length === 0) return res.status(404).json({ message: 'No user found' });
  res.json({ user: { id: users[0].id, email: users[0].email, name: users[0].name } });
};
