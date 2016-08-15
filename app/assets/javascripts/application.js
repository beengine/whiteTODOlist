// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require best_in_place
//= require jquery-ui
//= require best_in_place.jquery-ui
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .
//= require bootstrap-datepicker
$(document).ready(function () {
	$('.form-control.date').datepicker({
		format: "yyyy-mm-dd"
	});

	$(document).on('focus',".form-control.date", function(){
    	$(this).datepicker({
    		format: "yyyy-mm-dd"
    	});
	});

	jQuery(".best_in_place").best_in_place();

	$('.main').on('focusin', '.task', function (argument) {
		$(this).animate({width: "62.9%"},600,function () {
			$(this).next().css('display','inline');
		});
		

	});
	$('.main').on('click', '.check', function () {
		$(this).children().first().toggleClass("fa-check-square fa-square");
	});

	// $('.main').on('click', '.del', function () {
	// 	$(this).children().first().submit();
	// });

	// $('.main').on('click', '.edit', function () {
	// 	$(this).children().first().submit();
	// });
	// $('.form-inline').focusout(function (argument) {
	// 	console.log('gf');
	// 	$(this).children().last().hide('slow');
	//	$(this).next().css('display','none');
	//	});
});

