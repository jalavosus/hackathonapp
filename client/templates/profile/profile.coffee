Template.profile.helpers
  email: ->
    return Meteor.user().emails[0].address
  firstlogin: ->
    return Session.get 'firstlogin'
  changepage: ->
    FlowRouter.go("/login")
# Template.profile.onCreated ->
#   Session.set 'firstlogin', true
Template.profile.onRendered ->
    @$('#texts').hide()
    @$('#nums').hide()
    @$('.ui.button').hide()

Template.profile.events
  'click a.item': (event) ->
    $('a.active.item').removeClass('active')
    $(event.target).addClass('active')
    text = event.target.text
    if text == 'Texts' || text == "Both"
      $('#texts').show()
      Session.set('messagetype', 'texts')
    if text == 'Emails'
      $('#texts').hide()
      Session.set('messagetype', 'emails')
    $('#nums').show()
    $('.ui.button').show()
    return
  'submit #userinfo': (event) ->
    userinfo = {}
    target = event.target
    id = Meteor.user()._id
    Meteor.users.update(id, { $set: {
      'firstname': target.firstname.value,
      'lastname': target.lastname.value,
      'messagepref': Session.get('messagetype'),
      'phonenum': target.phone.value,
      'mishebnum': target.num.value,
      }})
    console.log Meteor.users.findOne({_id: Meteor.user()._id})
    Session.set('firstlogin', false)

    return
