@FlexContainer = React.createFactory React.createClass
  displayName: "FlexContainer"
  render: () ->
    {div} = React.DOM
    div
      className: "flex_container"
      style: _.extend {}, @props.style,
        flexDirection: @props.direction or "row"
        WebkitFlexDirection: @props.direction or "row"
      @props.children
