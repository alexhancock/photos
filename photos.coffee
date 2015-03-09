@App = React.createClass
  displayName: "App"

  pageComponents:
    home: @Home
    about: @About
    single: @Single
  
  render: () ->
    @pageComponents[@props.page] @props
