Accounts.onCreateUser (options, user) ->
  user.firstname = ''
  user.lastname = ''
  user.phonenum = ''
  user.mishebnum = ''
  user.messagepref = ''
  return user
