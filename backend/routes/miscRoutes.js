const express = require('express');
const router = express.Router();
const tripController = require('../controllers/tripController');
const auth = require('../middleware/auth');

/**
 * @swagger
 * /feed:
 *   get:
 *     summary: Retrieve trip newsfeed
 *     tags: [Trips]
 *     responses:
 *       200: { description: List of trips }
 * /favorites:
 *   post:
 *     summary: Toggle a trip as favorite
 *     tags: [Trips]
 *     security: [{ bearerAuth: [] }]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               tripId: { type: string }
 *     responses:
 *       200: { description: Favorited/Unfavorited message }
 * /wishlist:
 *   post:
 *     summary: Toggle a trip in wishlist
 *     tags: [Trips]
 *     security: [{ bearerAuth: [] }]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               tripId: { type: string }
 *     responses:
 *       200: { description: Wishlisted/Unwishlisted message }
 * /search:
 *   get:
 *     summary: Search for trips by location or title
 *     tags: [Trips]
 *     parameters:
 *       - in: query
 *         name: search
 *         schema: { type: string }
 *     responses:
 *       200: { description: Search results }
 */
router.get('/feed', tripController.getFeed);
router.post('/favorites', auth, tripController.toggleFavorite);
router.post('/wishlist', auth, tripController.toggleWishlist);
router.get('/search', tripController.getTrips);

module.exports = router;
