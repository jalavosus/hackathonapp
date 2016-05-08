Router.configure layoutTemplate: 'layout'

Router.route '/', ->
  @render 'Home'
  @layout 'layout'
  return
