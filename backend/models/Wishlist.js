module.exports = (sequelize, DataTypes) => {
  const Wishlist = sequelize.define('Wishlist', {
    userId: {
      type: DataTypes.UUID,
      allowNull: false,
    },
    tripId: {
      type: DataTypes.UUID,
      allowNull: false,
    },
  }, {
    indexes: [{ unique: true, fields: ['userId', 'tripId'] }]
  });

  return Wishlist;
};
