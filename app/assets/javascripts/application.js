// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// Documentation on Foundation javascripts can be found here:
// http://foundation.zurb.com/docs/javascript.html
//
// Many Foundation javascript elements can be controlled via the
// data-option attribute on an element.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require puts
//= require prism.min
//= require foundation/foundation
//= require foundation/foundation.alert
//
// Include all elements from /elements directory
//
//= require_tree ./elements

// Other Foundation scripts available:
//
// foundation/foundation.abide
// foundation/foundation.accordion
// foundation/foundation.clearing
// foundation/foundation.dropdown
// foundation/foundation.equalizer
// foundation/foundation.interchange
// foundation/foundation.joyride
// foundation/foundation.magellan
// foundation/foundation.offcanvas
// foundation/foundation.orbit
// foundation/foundation.reveal
// foundation/foundation.tab
// foundation/foundation.tooltip
// foundation/foundation.topbar

// Initialize libraries during render
$(function(){ $(document).foundation(); });

// Initialize custom elements after page is loaded
$(window).load(function(){
  ExampleObject.autoInit();
});