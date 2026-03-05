require('dotenv').config();
const express = require('express');
const cors = require('cors');
const db = require('./models');

const authRoutes = require('./routes/authRoutes');
const userRoutes = require('./routes/userRoutes');
const tripRoutes = require('./routes/tripRoutes');
const notificationRoutes = require('./routes/notificationRoutes');
const eventRoutes = require('./routes/eventRoutes');
const miscRoutes = require('./routes/miscRoutes');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

app.use('/auth', authRoutes);
app.use('/users', userRoutes);
app.use('/trips', tripRoutes);
app.use('/notifications', notificationRoutes);
app.use('/events', eventRoutes);
app.use('/', miscRoutes);

require('./swagger')(app);

app.get('/', (req, res) => {
  res.json({ message: 'Welcome to Triply API' });
});

db.sequelize.sync().then(() => {
  console.log('Database synced');
  if (process.env.NODE_ENV !== 'test') {
    app.listen(PORT, () => {
      console.log(`Server is running on port ${PORT}`);
    });
  }
});

module.exports = app;
