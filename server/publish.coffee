Meteor.publish "photos", () ->
  Photos.find({})
