@App = React.createClass
  displayName: "App"

  pageComponents:
    home: @Home
    about: @About
  
  render: () ->
    @pageComponents[@props.page]()
