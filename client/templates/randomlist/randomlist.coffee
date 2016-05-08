Template.randomlist.helpers
  get_peeps: ->
    return People.find()
  needs_refuah: (person) ->
    if person.illnesstype
      return true
    else
      return false
