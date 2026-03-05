const { Trip, User, Like, Comment, Favorite, Wishlist } = require('../models');
const { Op } = require('sequelize');

exports.createTrip = async (req, res) => {
  try {
    const { title, description, location, photos, status } = req.body;
    const trip = await Trip.create({ title, description, location, photos, status, userId: req.user.id });
    res.status(201).json(trip);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.getTrips = async (req, res) => {
  try {
    const { page = 1, limit = 10, search = '' } = req.query;
    const offset = (page - 1) * limit;
    const whereClause = search ? {
      [Op.or]: [
        { title: { [Op.like]: `%${search}%` } },
        { location: { [Op.like]: `%${search}%` } },
      ],
    } : {};
    const { count, rows } = await Trip.findAndCountAll({
      where: whereClause,
      limit: parseInt(limit),
      offset: parseInt(offset),
      include: [
        { model: User, as: 'author', attributes: ['id', 'name', 'photo'] },
        { model: Like, as: 'likes' },
        { model: Comment, as: 'comments' },
      ],
      order: [['createdAt', 'DESC']],
    });
    res.json({ total: count, pages: Math.ceil(count / limit), trips: rows });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.getTrip = async (req, res) => {
  try {
    const trip = await Trip.findByPk(req.params.id, {
      include: [
        { model: User, as: 'author' },
        { model: Like, as: 'likes' },
        { model: Comment, as: 'comments', include: [User] },
      ],
    });
    if (!trip) return res.status(404).json({ message: 'Trip not found' });
    res.json(trip);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.updateTrip = async (req, res) => {
  try {
    const trip = await Trip.findByPk(req.params.id);
    if (!trip) return res.status(404).json({ message: 'Trip not found' });
    if (trip.userId !== req.user.id) return res.status(403).json({ message: 'Unauthorized' });
    await trip.update(req.body);
    res.json(trip);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.deleteTrip = async (req, res) => {
  try {
    const trip = await Trip.findByPk(req.params.id);
    if (!trip) return res.status(404).json({ message: 'Trip not found' });
    if (trip.userId !== req.user.id) return res.status(403).json({ message: 'Unauthorized' });
    await trip.destroy();
    res.json({ message: 'Trip deleted successfully' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.getFeed = async (req, res) => {
  req.query.limit = 20;
  return exports.getTrips(req, res);
};

exports.toggleFavorite = async (req, res) => {
  try {
    const { tripId } = req.body;
    const fav = await Favorite.findOne({ where: { userId: req.user.id, tripId } });
    if (fav) {
      await fav.destroy();
      return res.json({ message: 'Removed from favorites' });
    }
    await Favorite.create({ userId: req.user.id, tripId });
    res.json({ message: 'Added to favorites' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.toggleWishlist = async (req, res) => {
  try {
    const { tripId } = req.body;
    const item = await Wishlist.findOne({ where: { userId: req.user.id, tripId } });
    if (item) {
      await item.destroy();
      return res.json({ message: 'Removed from wishlist' });
    }
    await Wishlist.create({ userId: req.user.id, tripId });
    res.json({ message: 'Added to wishlist' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};
