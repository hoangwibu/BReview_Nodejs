const Sequelize = require('sequelize')
const { DataTypes } = require('sequelize');
const sequelize = require('./db');
class Rating extends Sequelize.Model {}

Rating.init({
  userId: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  bookId: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  rating: {
    type: DataTypes.FLOAT,
    allowNull: false
  },
}, {
  sequelize,
  modelName: 'rating',
  tableName: 'ratings'
});
sequelize.sync()
    .then(() => {
        console.log('Ratings synchronized.');
    })
    .catch(error => console.error(error));
module.exports = Rating;