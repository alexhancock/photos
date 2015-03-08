@Photos = new Mongo.Collection("photos")

@Home = React.createFactory React.createClass
  displayName: "Home"
  mixins: [ReactMeteor.Mixin]
  getInitialState: () -> {}
  getMeteorState: () ->
    photos: Photos.find({}, {sort: {'_id': -1}}).fetch()

  renderPhotos: () ->
    _.map @state.photos, (photo) -> Photo {photo}

  render: () ->
    {div} = React.DOM
    div
      style:
        margin: "0 auto"
        width: "80%"
        maxWidth: 900
      @renderPhotos()
