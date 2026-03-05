module.exports = (sequelize, DataTypes) => {
  const Favorite = sequelize.define('Favorite', {
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

  return Favorite;
};
