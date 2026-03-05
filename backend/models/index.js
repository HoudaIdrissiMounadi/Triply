const { Sequelize, DataTypes } = require('sequelize');
const path = require('path');

const sequelize = new Sequelize({
  dialect: 'sqlite',
  storage: path.join(__dirname, '../database.sqlite'),
  logging: false,
});

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.User = require('./User')(sequelize, DataTypes);
db.Trip = require('./Trip')(sequelize, DataTypes);
db.Notification = require('./Notification')(sequelize, DataTypes);
db.Event = require('./Event')(sequelize, DataTypes);
db.Comment = require('./Comment')(sequelize, DataTypes);
db.Like = require('./Like')(sequelize, DataTypes);
db.Favorite = require('./Favorite')(sequelize, DataTypes);
db.Wishlist = require('./Wishlist')(sequelize, DataTypes);

// Associations
db.User.hasMany(db.Trip, { as: 'trips', foreignKey: 'userId' });
db.Trip.belongsTo(db.User, { as: 'author', foreignKey: 'userId' });

db.User.hasMany(db.Notification, { as: 'notifications', foreignKey: 'userId' });
db.Notification.belongsTo(db.User, { foreignKey: 'userId' });

db.Trip.hasMany(db.Comment, { as: 'comments', foreignKey: 'tripId' });
db.Comment.belongsTo(db.Trip, { foreignKey: 'tripId' });
db.User.hasMany(db.Comment, { foreignKey: 'userId' });
db.Comment.belongsTo(db.User, { foreignKey: 'userId' });

db.Trip.hasMany(db.Like, { as: 'likes', foreignKey: 'tripId' });
db.Like.belongsTo(db.Trip, { foreignKey: 'tripId' });
db.User.hasMany(db.Like, { foreignKey: 'userId' });
db.Like.belongsTo(db.User, { foreignKey: 'userId' });

db.User.belongsToMany(db.Trip, { through: db.Favorite, as: 'favoriteTrips', foreignKey: 'userId' });
db.Trip.belongsToMany(db.User, { through: db.Favorite, as: 'favoritedBy', foreignKey: 'tripId' });

db.User.belongsToMany(db.Trip, { through: db.Wishlist, as: 'wishlistTrips', foreignKey: 'userId' });
db.Trip.belongsToMany(db.User, { through: db.Wishlist, as: 'wishlistedBy', foreignKey: 'tripId' });

db.User.hasMany(db.Event, { as: 'organizedEvents', foreignKey: 'organizerId' });
db.Event.belongsTo(db.User, { as: 'organizer', foreignKey: 'organizerId' });

module.exports = db;
