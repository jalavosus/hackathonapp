People = new Mongo.Collection('people');

Meteor.users.allow({
  update: function (userId, doc) {
    return true;
  }
})
