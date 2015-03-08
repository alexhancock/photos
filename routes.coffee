outer = @

Router.route "/", () ->
  if Meteor.isClient
    @render "App", data:
      page: "home"
  else
    @response.end React.renderToString(outer.App(page: "home"))

Router.route "/about", () ->
  if Meteor.isClient
    @render "App", data:
      page:"about"
  else
    @response.end React.renderToString(outer.App(page: "about"))
