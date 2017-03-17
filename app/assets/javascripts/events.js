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
		hideControlForms(event);
		$(this).closest('.dropdown').children('.dropdown-content').slideToggle(450);
	});
}

//hide all visible forms in controls
function hideControlForms(event) {
	$('#controls form').each(function() {
		if( $(this).is(":visible") && !$(this).siblings().is($(event.target)) )  $(this).slideToggle(450);
	});
}

// // deals with displaying or hiding a link when an update events button is clicked
// function nearbyEventsClick() {
// 	$('.distance-options').on('ajax:complete', function(event) {
// 		alert('success');
// 		displayDistanceOptions();
// 		// console.log($(event.target).id);
// 		// if( $(event.target).attr('id') === 'nearby-events-link' ) {
			
// 		// } else {
// 		// 	hideDistanceOptions();
// 		// }
// 	});
// }

// function displayDistanceOptions() {
// 	$('.distance-options').slideDown(450);
// }

// function hideDistanceOptions() {
// 	$('.distance-options').fadeOut(450);
// }