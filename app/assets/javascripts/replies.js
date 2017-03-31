$(document).on('turbolinks:load', function() {
	showRepliesContainerOnClick();
	showReplyFormOnClick();
});

function showRepliesContainerOnClick() {
	$('body').on('click', 'a.show-replies-container', function(event) {
		repliesContainer = $(this).closest('.media-body').children('.replies-container'); 
		event.preventDefault();
		toggleElementWithLink(repliesContainer, $(this))
	});
}

function showReplyFormOnClick() {
	$('body').on('click', 'a.show-reply-form', function(event) {
		replyForm = $(this).closest('.media-body').children('.replies-form');
		event.preventDefault();
		toggleElementWithLink(replyForm,$(this));
	});
}

