@Video = React.createFactory React.createClass
  displayName: "Video"

  mixins: [MediaSizingMixin]

  getInitialState: () ->
    barVisible: false
    width: @getWidth()

  componentDidMount: () ->
    resizeFunc = () => @setState(width: @getWidth())
    $(window).on "resize.videoSizing", _.throttle(resizeFunc, 200)

  componentWillUnmount: () ->
    $(window).off "resize.videoSizing"

  getParams: () ->
    obj =
      rel: 0
      showinfo: 0
      autohide: 1
      fs: 1

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

      PhotoInfoBar
        photo: @props.video
        visible: @state.barVisible
        showMapLink: false

      iframe
        className: "video_player"
        style:
          width: "100%"
          border: "none"
        width: "100%"
        height: @getHeight()
        frameBorder: 0
        src: "http://www.youtube.com/embed/#{@props.video.vid}#{@getParams()}"
        allowFullScreen: true
