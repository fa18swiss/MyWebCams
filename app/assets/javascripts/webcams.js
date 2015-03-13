$(function() {
  webcamsConfig = {
    my:false,
    others:false,
    favorites:true
  }
  $("#webcam_disposition_grid").click(function() {
    console.log("Grid");
  })
  $("#webcam_disposition_map").click(function() {
    console.log("map");
  })
  $("#webcam_show_favorites").click(function() {
    console.log("favorite", webcamsConfig, this);
  })
  $("#webcam_show_my").click(function() {
    console.log("my", webcamsConfig, this);
  })
  $("#webcam_show_others").click(function() {
    console.log("others", webcamsConfig, this);
  })
});