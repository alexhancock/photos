@MediaSizingMixin =
  getMaxWidth: () -> 900
  
  getWidth: () ->
    Math.min @getMaxWidth(), ($(window).width() * 0.8)
  
  getHeight: () ->
    @getWidth() * 0.666666667
