@Single = React.createFactory React.createClass
  displayName: "Single"
  mixins: [ReactMeteor.Mixin, MediaSizingMixin]
  getInitialState: () -> {}
  getMeteorState: () ->
    key = if @props.pid? then "pid" else "vid"
    query = {}
    query[key] = @props[key]

    media: Photos.findOne(query)

  renderSiteHeader: () ->
    {div, span, a} = React.DOM

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
          "More Photos"

      FlexItem
        flex: "0 0 auto"
        alignSelf: "center"
        a
          href: "mailto:alex@alexhancock.com"
          style:
            color: "black"
            textDecoration: "none"
            cursor: "pointer"
          "contact"

  render: () ->
    {div, img} = React.DOM

    div
      style:
        margin: "0 auto"
        width: "80%"
        maxWidth: @getMaxWidth()

      @renderSiteHeader()

      if @state.media?
        div
          style:
            position: "relative"
            width: "100%"

          if @props.pid
            Photo
              photo: @state.media
          else if @props.vid
            Video
              video: @state.media
