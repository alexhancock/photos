@Photos = new Mongo.Collection("photos")

@Home = React.createFactory React.createClass
  displayName: "Home"
  mixins: [ReactMeteor.Mixin, MediaSizingMixin]
  getInitialState: () -> {}
  getMeteorState: () ->
    photos: Photos.find({}, {sort: {'_id': -1}}).fetch()

  renderPhotos: () ->
    _.map @state.photos, (obj) ->
      if obj.vid?
        Video {video: obj}
      else
        Photo {photo: obj}

  renderTitleBar: () ->
    {div, span} = React.DOM

    FlexContainer
      direction: "row"
      style:
        width: "100%"
        height: 110

      FlexItem
        flex: "1"
        alignSelf: "center"
        span
          onClick: () ->
            Router.go "/"
          style:
            cursor: "pointer"
            fontWeight: "bold"
          "Alex Hancock"

      FlexItem
        flex: "0 0 auto"
        alignSelf: "center"
        span
          onClick: () ->
            Router.go "/about"
          style:
            cursor: "pointer"
          "about"

  render: () ->
    {div} = React.DOM

    div
      style:
        margin: "0 auto"
        width: "80%"
        maxWidth: @getMaxWidth()

      @renderTitleBar()
      @renderPhotos()
