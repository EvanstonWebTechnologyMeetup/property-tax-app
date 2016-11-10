require './style.styl'

properties = require '../../subset.json'

map = new google.maps.Map document.getElementById('map'),
  center: properties[0].location
  zoom: 18

properties.forEach (property) ->
  marker = new google.maps.Marker
    position: new google.maps.LatLng property.location.lat, property.location.lng
    map: map
  marker.addListener 'click', ->
    $('.address').html property.addressFormatted
    $('.assessed-property-value').html property.assessedPropertyValue
    $('.estimated-property-value').html property.estimatedPropertyValue
    $('.tax-rate').html property.taxRate
