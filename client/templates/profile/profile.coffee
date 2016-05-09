Template.profile.helpers
  email: ->
    return Meteor.user().emails[0].address
  setupvar: ->
    return Session.get 'setupvar'
  changepage: ->
    FlowRouter.go("/login")
# Template.profile.onCreated ->
#   Session.set 'firstlogin', true
Template.profile.onRendered ->
    @$('#texts').hide()
    @$('#nums').hide()
    @$('#editsubmit').hide()

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
    $('#editsubmit').show()
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
    Session.set('setupvar', false)
    return
  'click #editprefs': ->
    Session.set('setupvar', true)
    FlowRouter.reload()
    return
