Router.configure layoutTemplate: 'layout'

Router.route '/', ->
  @render 'Home'
  return
Router.route '/addperson', ->
  @render 'addperson'
  return
