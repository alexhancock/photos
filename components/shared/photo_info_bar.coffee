@PhotoInfoBar = React.createFactory React.createClass
  displayName: "PhotoInfoBar"

  getInitialState: () ->
    mapVisible: false

  render: () ->
    {div, span, img} = React.DOM
    FlexContainer
      className: "photo_info_bar"
      direction: "row"
      style:
        zIndex: 20
        opacity: if @props.visible then 1 else 0
        position: "absolute"
        width: "100%"
        top: 0
        height: 40
        lineHeight: "40px"
        color: "white"
        verticalAlign: "middle"

      FlexItem
        flex: "0 0 10px"

      FlexItem
        flex: "1"

        span
          style:
            opacity: if @state.mapVisible then 0 else 1
            cursor: "pointer"
            textShadow: "0px 0px 2px rgba(0, 0, 0, .5)"
          onClick: () =>
            hasPid = @props.photo.pid?
            key = if hasPid then "pid" else "vid"
            routePrefix = if hasPid then "photos" else "videos"
            route =  "/#{routePrefix}/#{@props.photo[key]}"
            Router.go route

          @props.photo.title
     
      if @props.showMapLink
        FlexItem
          flex: "0 0 auto"

          span
            style:
              cursor: "pointer"
              textShadow: "0px 0px 2px rgba(0, 0, 0, .5)"
              opacity: if @state.mapVisible then 0 else 1
            onMouseOver: () =>
              @props.hoveredOverMapButton()
              @setState(mapVisible: true)
            onMouseLeave: () =>
              @props.leftMapButton()
              @setState(mapVisible: false)
            "Map"
      
      if @props.showMapLink
        FlexItem
          flex: "0 0 10px"

