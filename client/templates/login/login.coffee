Template.login.events
  'submit #at-pwd-form': (event) ->
    FlowRouter.go("/profile")

Template.login.helpers
  'profiler': ->
    FlowRouter.go("/profile")
    
