@FlexContainer = React.createFactory React.createClass
  displayName: "FlexContainer"
  render: () ->
    {div} = React.DOM
    className = @props.className or ""
    className += " flex_container"

    div
      className: className
      style: _.extend {}, @props.style,
        flexDirection: @props.direction or "row"
        WebkitFlexDirection: @props.direction or "row"
      @props.children
