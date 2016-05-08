import { Meteor } from 'meteor/meteor';
import { Mongo } from 'meteor/mongo';

People = new Meteor.Collection('people');

Meteor.startup(() => {
  // code to run on server at startup
});

if (Meteor.isServer) {
  Meteor.publish('people', function peopleList() {
    return People.find();
  });
  Meteor.methods({
    peopleinsert: function(obj) {
      People.insert(obj);
      console.log(People.find().fetch());
    },
  });

}
