@About = React.createFactory React.createClass
  displayName: "About"
  mixins: [ReactMeteor.Mixin, MediaSizingMixin]
  getInitialState: () -> {}
  getMeteorState: () ->
    photo: Photos.findOne({ pid: "about" })

  renderSiteHeader: () ->
    {div, span, a} = React.DOM

    FlexContainer
      direction: "row"
      style:
        width: "100%"
        height: 110

      FlexItem
        flex: "1"
        alignSelf: "center"
        span
          onClick: () ->
            Router.go "/"
          style:
            cursor: "pointer"
            fontWeight: "bold"
          "More Photos"

      FlexItem
        flex: "0 0 auto"
        alignSelf: "center"
        a
          href: "mailto:alex@alexhancock.com"
          target: "_blank"
          style:
            color: "black"
            textDecoration: "none"
            cursor: "pointer"
          "contact"

  renderBio: () ->
    {div, br} = React.DOM

    div
      style:
        zIndex: 30
        position: "absolute"
        top: 40
        left: 40
        color: "white"

      "My name is Alex Hancock. I am 26 years old and live in Oakland, California."
      br {}, ""
      "I work as a software engineer and enjoy travel, running, and photography."
      br {}, ""
      "The photos on my site were taken with a Canon 5D Mark III."

  render: () ->
    {div, img} = React.DOM

    div
      style:
        margin: "0 auto"
        width: "80%"
        maxWidth: @getMaxWidth()

      @renderSiteHeader()

      div
        style:
          position: "relative"
          width: "100%"

        @renderBio()

        img
          src: @state.photo.source
          width: "100%"
