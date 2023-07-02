const Sequelize = require('sequelize')
const { DataTypes } = require('sequelize');
const sequelize = require('./db');
class Book extends Sequelize.Model {}

Book.init({
  bookId: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    allowNull: false,
    primaryKey: true
  },
  title: {
    type: DataTypes.STRING,
    allowNull: false
  },
  image: {
    type: DataTypes.STRING,
    allowNull: false
  },
  author: {
    type: DataTypes.STRING,
    allowNull: false
  },
  publishing: {
    type: DataTypes.INTEGER,
    allowNull: true,
    defaultValue: 2023
  },
  stars: {
    type: DataTypes.FLOAT,
    allowNull: true,
    defaultValue:5
  },
  ratings: {
    type: DataTypes.INTEGER,
    allowNull: true,
    defaultValue:0
  },
  description: {
    type: DataTypes.STRING,
    allowNull: false
  },
  category: {
    type: DataTypes.STRING,
    allowNull: false
  },
  commentCount: {
    type: Sequelize.INTEGER,
    defaultValue: 0
  }
}, {
  sequelize,
  modelName: 'book',
  tableName: 'books'
});
sequelize.sync()
    .then(() => {
        console.log('Books synchronized.');
    })
    .catch(error => console.error(error));
module.exports = Book;