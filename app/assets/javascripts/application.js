//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap/collapse
//= require bootstrap/transition
$(document).ready(function(){
  var myLatLng = new google.maps.LatLng(40.0293099,-105.2399774);
  var myOptions = {
    zoom: 14,
    center: myLatLng,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    scrollwheel: false,
    //disableDefaultUI: true,
  };
  map = new google.maps.Map(
    document.getElementsByClassName('map')[0], myOptions
  )
});
