@Photos.allow
  insert: (userId, doc) ->
    if !userId? or userId != Meteor.settings.adminId
      false
    else
      true
  remove: (userId, doc) -> false
  update: (userId, doc) -> false
