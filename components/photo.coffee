@Photo = React.createFactory React.createClass
  displayName: "Photo"
  mixins: [MediaSizingMixin]

  getInitialState: () ->
    barVisible: false
    mapVisible: false
    height: @getHeight()

  componentDidMount: () ->
    resizeFunc = () => @setState(height: @getHeight())
    $(window).on "resize.photoSizing", _.throttle(resizeFunc, 200)

  componentWillUnmount: () ->
    $(window).off "resize.photoSizing"

  getMapStyles: () ->
    [
      {
        'featureType': 'administrative'
        'elementType': 'all'
        'stylers': [
          { 'visibility': 'on' }
        ]
      }
      {
        'featureType': 'landscape'
        'elementType': 'all'
        'stylers': [
          { 'visibility': 'simplified' }
          { 'hue': '#0066ff' }
          { 'saturation': 74 }
          { 'lightness': 100 }
        ]
      }
      {
        'featureType': 'poi'
        'elementType': 'all'
        'stylers': [ { 'visibility': 'off' } ]
      }
      {
        'featureType': 'road'
        'elementType': 'all'
        'stylers': [ { 'visibility': 'off' } ]
      }
      {
        'featureType': 'road.highway'
        'elementType': 'all'
        'stylers': [
          { 'visibility': 'off' }
        ]
      }
      {
        'featureType': 'road.highway'
        'elementType': 'geometry'
        'stylers': [ { 'visibility': 'off' } ]
      }
      {
        'featureType': 'road.arterial'
        'elementType': 'all'
        'stylers': [ { 'visibility': 'off' } ]
      }
      {
        'featureType': 'road.local'
        'elementType': 'all'
        'stylers': [ { 'visibility': 'off' } ]
      }
      {
        'featureType': 'transit'
        'elementType': 'all'
        'stylers': [ { 'visibility': 'off' } ]
      }
      {
        'featureType': 'water'
        'elementType': 'all'
        'stylers': [
          { 'visibility': 'simplified' }
          { 'color': '#5f94ff' }
          { 'lightness': 26 }
          { 'gamma': 5.86 }
        ]
      }
    ]

  componentDidUpdate: (prevProps, prevState) ->
    if @state.mapVisible and !prevState.mapVisible
      latLng =
        lat: @props.photo.coords[0]
        lng: @props.photo.coords[1]
      mapOptions =
        zoom: 6
        center: latLng
        disableDefaultUI: true
      
      map = new google.maps.Map @refs["map_canvas"].getDOMNode(), mapOptions
      marker = new google.maps.Marker
        position: latLng
        map: map
        title: @props.photo.title
      
      map.setOptions
        styles: @getMapStyles()
      marker.setMap map

  render: () ->
    {div, span, img} = React.DOM

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
        photo: @props.photo
        visible: @state.barVisible
        showMapLink: true
        hoveredOverMapButton: () =>
          @setState
            mapVisible: true
        leftMapButton: () =>
          @setState
            mapVisible: false

      div
        ref: "map_canvas"
        className: "map_canvas"
        style:
          opacity: if @state.mapVisible then 1 else 0
          position: "absolute"
          top: 0
          bottom: 0
          left: 0
          right: 0
          zIndex: 10
          width: "100%"
          height: "100%"
      
      img
        className: "image_photo"
        src: "data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACwAAAAAAQABAAACAkQBADs="
        "data-src": @props.photo.source
        style:
          height: @state.height
          width: "100%"
