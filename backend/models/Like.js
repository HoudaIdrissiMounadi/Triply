module.exports = (sequelize, DataTypes) => {
  const Like = sequelize.define('Like', {
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

  return Like;
};
