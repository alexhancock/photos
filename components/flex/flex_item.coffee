@FlexItem = React.createFactory React.createClass
  displayName: "FlexItem"
  render: () ->
    {span} = React.DOM

    span
      style:
        order: 0
        alignSelf: @props.alignSelf or null
        WebkitFlex: @props.flex
        flex: @props.flex

      @props.children
