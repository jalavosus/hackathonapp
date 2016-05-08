Meteor.publish('people', function() { return People.find();});
Meteor.publish('userList', function (){
  return Meteor.users.find({});
});
