module.exports = (sequelize, DataTypes) => {
  const Trip = sequelize.define('Trip', {
    id: {
      type: DataTypes.UUID,
      defaultValue: DataTypes.UUIDV4,
      primaryKey: true,
    },
    title: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    description: {
      type: DataTypes.TEXT,
    },
    location: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    photos: {
      type: DataTypes.TEXT,
    },
    status: {
      type: DataTypes.ENUM('planned', 'ongoing', 'completed', 'canceled'),
      defaultValue: 'planned',
    },
    userId: {
      type: DataTypes.UUID,
      allowNull: false,
    },
  });

  return Trip;
};
