const express = require('express');
const router = express.Router();
const notificationController = require('../controllers/notificationController');
const auth = require('../middleware/auth');

/**
 * @swagger
 * /notifications:
 *   get:
 *     summary: Retrieve user's notifications
 *     tags: [Notifications]
 *     security: [{ bearerAuth: [] }]
 *     responses:
 *       200: { description: List of notifications }
 *   post:
 *     summary: Send a new notification
 *     tags: [Notifications]
 *     security: [{ bearerAuth: [] }]
 *     requestBody:
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required: [title, message, userId]
 *             properties:
 *               title: { type: string }
 *               message: { type: string }
 *               userId: { type: string }
 *     responses:
 *       201: { description: Notification sent }
 *   delete:
 *     summary: Delete a notification
 *     tags: [Notifications]
 *     security: [{ bearerAuth: [] }]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema: { type: string }
 *     responses:
 *       200: { description: Deletion message }
 */
router.get('/', auth, notificationController.getNotifications);
router.post('/', auth, notificationController.createNotification);
router.delete('/:id', auth, notificationController.deleteNotification);

module.exports = router;
