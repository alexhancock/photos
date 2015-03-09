@Video = React.createFactory React.createClass
  displayName: "Video"

  mixins: [MediaSizingMixin]

  getInitialState: () ->
    barVisible: false
    mapVisible: false

  getParams: () ->
    obj =
      rel: 0
      showinfo: 0
      autohide: 1

    str = "?"

    for key, val of obj
      str += "&#{key}=#{val}"

    str

  render: () ->
    {div, iframe} = React.DOM
    div
      className: "photo"
      onMouseEnter: () =>
        @setState(barVisible: true)
      onMouseLeave: () =>
        @setState(barVisible: false)
      style:
        position: "relative"
        width: "100%"
        marginBottom: 20

      iframe
        className: "video_player"
        style:
          border: "none"
        width: @getWidth()
        height: @getHeight()
        frameborder: 0
        src: "http://www.youtube.com/embed/#{@props.video.vid}#{@getParams()}"
        allowfullscreen: true
