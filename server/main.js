import { Meteor } from 'meteor/meteor';
import { Mongo } from 'meteor/mongo';


Meteor.startup(() => {
});

if (Meteor.isServer) {
  Meteor.methods({
    peopleinsert: function(obj) {
      People.insert(obj);
      console.log(People.find().fetch());
    },
  });

}
