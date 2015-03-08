@PhotoInfoBar = React.createFactory React.createClass
  displayName: "PhotoInfoBar"

  render: () ->
    {div, span, img} = React.DOM
    div
      className: "photo_info_bar"
      style:
        opacity: if @props.visible then 1 else 0
        position: "absolute"
        width: "100%"
        top: 0
        height: 40
        lineHeight: "40px"
        color: "white"
        verticalAlign: "middle"
        backgroundColor: "rgba(0, 0, 0, 0.5)"

      span
        style:
          marginLeft: 10
        @props.photo.title

@Photo = React.createFactory React.createClass
  displayName: "Photo"

  getInitialState: () ->
    barVisible: false

  render: () ->
    {div, span, img} = React.DOM

    div
      className: "photo"
      onMouseEnter: () =>
        @setState(barVisible: true)
      onMouseLeave: () =>
        @setState(barVisible: false)
      style:
        position: "relative"
        width: "100%"
        marginBottom: 20

      PhotoInfoBar
        photo: @props.photo
        visible: @state.barVisible
      
      img
        src: @props.photo.source
        style:
          width: "100%"
