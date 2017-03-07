$(document).on('turbolinks:load', function() {
	toggleLinks();
});

//function for dealing with link that have toggle-link class
function toggleLinks() {
	$('.toggle-dropdown').on('click', function(event) {
		event.preventDefault();
		hideControlForms(event);
		$(this).closest('.dropdown').children().last().slideToggle(450);
	});
}

//hide all visible forms in controls
function hideControlForms(event) {
	$('#controls form').each(function() {
		if( $(this).is(":visible") && !$(this).siblings().is($(event.target)) )  $(this).slideToggle(450);
	});
}