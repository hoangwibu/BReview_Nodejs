const Sequelize = require('sequelize')
const { DataTypes } = require('sequelize');
const sequelize = require('./db');
class Comment extends Sequelize.Model {
  
}

Comment.init({
  commentId: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    allowNull: false,
    primaryKey: true
  },
  content: {
    type: DataTypes.STRING,
    allowNull: false
  },
  
}, {
  sequelize,
  modelName: 'comment',
  tableName: 'comments'
});
sequelize.sync()
    .then(() => {
        console.log('Comments synchronized.');
    })
    .catch(error => console.error(error));
module.exports = Comment;