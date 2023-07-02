const Sequelize = require('sequelize')
const { DataTypes } = require('sequelize');
const sequelize = require('./db');
const bcrypt = require('bcrypt');
class User extends Sequelize.Model { }
User.init({
    userId: {
        type: DataTypes.INTEGER.UNSIGNED,
        autoIncrement: true,
        primaryKey: true,
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    email: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true,
        validate: {
            isEmail: true,
        },
    },
    password: {
        type: DataTypes.STRING,
        allowNull: false,
    },
}, {
    sequelize,
    modelName: 'user',
    tableName: 'users'
});
sequelize.sync()
    .then(() => {
        console.log('User synchronized.');
        // User.create({
        //   name: 'John',
        //   email: 'john@example.com',
        //   password: 'password'
        // })
        //   .then(user => console.log(user.toJSON()))
        //   .catch(error => console.error(error));
    })
    .catch(error => console.error(error));
User.beforeCreate((user) => {
    const salt = bcrypt.genSaltSync();
    user.password = bcrypt.hashSync(user.password, salt);
});
module.exports = User;
