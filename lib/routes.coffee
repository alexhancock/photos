outer = @

Router.route "/", () ->
  if Meteor.isClient
    @render "App", data:
      page: "home"
  else
    @response.end React.renderToString(outer.App(page: "home"))
, {
  fastRender: true
  waitOn: () ->
    return Meteor.subscribe('photos')
}


Router.route "/photos/:pid", () ->
  if Meteor.isClient
    @render "App", data:
      page: "single"
      pid: @params.pid
  else
    @response.end React.renderToString(outer.App(
      page: "single"
      pid: @params.pid
    ))

Router.route "/videos/:vid", () ->
  if Meteor.isClient
    @render "App", data:
      page: "single"
      vid: @params.vid
  else
    @response.end React.renderToString(outer.App(
      page: "single"
      vid: @params.vid
    ))

Router.route "/about", () ->
  if Meteor.isClient
    @render "App", data:
      page:"about"
  else
    @response.end React.renderToString(outer.App(page: "about"))
