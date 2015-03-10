@FlexItem = React.createFactory React.createClass
  displayName: "FlexItem"
  render: () ->
    {span} = React.DOM

    span
      style:
        order: 0
        alignSelf: @props.alignSelf or null
        WebkitAlignSelf: @props.alignSelf or null
        flex: @props.flex
        WebkitFlex: @props.flex

      @props.children
