Template.signup.events
  'submit #at-pwd-form': ->
    Session.set 'firstlogin', true
    FlowRouter.go("/profile")

Template.signup.helpers
  'profiler': ->
    FlowRouter.go("/profile")
