@PhotoInfoBar = React.createFactory React.createClass
  displayName: "PhotoInfoBar"

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
        backgroundColor: "rgba(0, 0, 0, 0.5)"

      FlexItem
        flex: "0 0 10px"

      FlexItem
        flex: "1"

        span
          style:
            cursor: "pointer"
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
            onMouseOver: () =>
              @props.hoveredOverMapButton()
            onMouseLeave: () =>
              @props.leftMapButton()
            "Map"
      
      if @props.showMapLink
        FlexItem
          flex: "0 0 10px"

