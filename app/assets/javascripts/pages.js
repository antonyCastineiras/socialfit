$(document).on("turbolinks:load", function() {
	hideSignInForm();
	displayFormBehaviour();
});

function hideSignInForm() {
	$('#home-page-forms-container #sign-in-form').hide();
}

function displayFormBehaviour() {
	$('.display-form-link').on('click', function(event) {
		event.preventDefault();
		// only switch forms if parent element does not have the class active 
		// parent must be targeted as that is the elemtn with active not the clicked link
		if (!$(event.target).parent().hasClass('active')) {
			toggleClass(this);
			currentlyHidden = $('#home-page-forms-container form:hidden');
			currentlyVisible = $('#home-page-forms-container form:visible');
			currentlyVisible.slideToggle();
			currentlyHidden.slideToggle();
		}
	});
}

function toggleClass(elem) {
	$('.active').toggleClass('active');
	$(elem).toggleClass('active');
}