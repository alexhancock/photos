@Home = React.createFactory React.createClass
  displayName: "Home"
  mixins: [ReactMeteor.Mixin, MediaSizingMixin]

  getPhotos: () -> Photos.find({ pid: { $not: "about"} }, {sort: {'_id': -1}}).fetch()

  getInitialState: () ->
    photos: @getPhotos()

  getMeteorState: () ->
    photos: @getPhotos()

  attachUnveil: () ->
    distance = $(window).height()*2
    $("img").unveil distance, () ->
      $(@).load () -> @style.opacity = 1

  componentDidUpdate: (prevProps, prevState) ->
    cond = @state.photos.length != prevState.photos.length
    @attachUnveil() if cond

  componentDidMount: () ->
    @attachUnveil() if @state.photos.length

  renderPhotos: () ->
    _.map @state.photos, (obj) ->
      if obj.vid?
        Video
          key: obj.vid
          video: obj
      else
        Photo
          key: obj.pid
          photo: obj

  renderSiteHeader: () ->
    {div, span} = React.DOM

    FlexContainer
      direction: "row"
      style:
        width: "100%"
        verticalAlign: "middle"
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

      @renderSiteHeader()
      @renderPhotos()

      div
        style:
          height: 110
