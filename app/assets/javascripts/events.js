$(document).on('turbolinks:load', function() {

	toggleLinks();
	hideElements();
});

//hides event and calendar related elements that need to be hidden
function hideElements() {
	$('.distance-options').hide();
}


function getParamsFromHref(href) {
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
		$(this).closest('.dropdown').children('.dropdown-content').slideToggle(450);
	});
}


