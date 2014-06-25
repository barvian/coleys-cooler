$(document).ready ->

  # Initialize maps
  center = new google.maps.LatLng(42.249773, -88.812704)
  maptype = [
    {
      featureType: "poi.attraction"
      elementType: "labels"
      stylers: [{
        visibility: "simplified"
      }]
    },
    {
      featureType: "poi.medical",
      stylers: [{
        visibility: "off"
      }]
    },
    {
      featureType: "poi.business",
      stylers: [{
        visibility: "simplified"
      }]
    }
  ]

  labels = new google.maps.StyledMapType maptype,
    name: "Custom Labels"

  mapOptions =
    center: center
    zoom: 15
    scrollwheel: no
    mapTypeControlOptions:
      style: google.maps.MapTypeControlStyle.DEFAULT
      position: google.maps.ControlPosition.RIGHT_CENTER
    zoomControlOptions:
      style: google.maps.ZoomControlStyle.SMALL
      position: google.maps.ControlPosition.LEFT_CENTER
    panControl: no
    streetViewControl: no
    mapTypeIds: [google.maps.MapTypeId.ROADMAP, "custom_styles"]

  maps = new google.maps.Map(document.getElementById("map"), mapOptions)
  maps.mapTypes.set("custom_styles", labels)
  maps.setMapTypeId("custom_styles")
