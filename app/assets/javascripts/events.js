$(document).on('turbolinks:load', function() {
	toggleLinks();
});

function paramsFromHref(href) {
	paramsString = href.split('?');
	params = paramsString[1].split('&');
	paramsObject = {};
	$(params).each(function() {
		splitParams = this.split('=');
		paramsObject[splitParams[0]] = splitParams[1]
	});
	return paramsObject;
}

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
