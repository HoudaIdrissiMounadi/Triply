const { Event, User } = require('../models');

exports.getEvents = async (req, res) => {
  try {
    const events = await Event.findAll({
      include: [{ model: User, as: 'organizer' }],
      order: [['date', 'ASC']],
    });
    res.json(events);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.createEvent = async (req, res) => {
  try {
    const { title, description, date, location, participants } = req.body;
    const event = await Event.create({ title, description, date, location, participants, organizerId: req.user.id });
    res.status(201).json(event);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.getEvent = async (req, res) => {
  try {
    const event = await Event.findByPk(req.params.id, {
      include: [{ model: User, as: 'organizer' }],
    });
    if (!event) return res.status(404).json({ message: 'Event not found' });
    res.json(event);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.updateEvent = async (req, res) => {
  try {
    const event = await Event.findByPk(req.params.id);
    if (!event) return res.status(404).json({ message: 'Event not found' });
    if (event.organizerId !== req.user.id) return res.status(403).json({ message: 'Unauthorized' });
    await event.update(req.body);
    res.json(event);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.deleteEvent = async (req, res) => {
  try {
    const event = await Event.findByPk(req.params.id);
    if (!event) return res.status(404).json({ message: 'Event not found' });
    if (event.organizerId !== req.user.id) return res.status(403).json({ message: 'Unauthorized' });
    await event.destroy();
    res.json({ message: 'Event deleted successfully' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};
