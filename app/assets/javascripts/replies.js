$(document).on('turbolinks:load', function() {
	showRepliesContainerOnClick();
	showReplyFormOnClick();
});

function showRepliesContainerOnClick() {
	$('a.show-replies-container').on('click', function(event) {
		repliesContainer = $(this).closest('.media-body').children('.replies-container'); 
		event.preventDefault();
		toggleElementWithLink(repliesContainer, $(this))
	});
}

function showReplyFormOnClick() {
	$('a.show-reply-form').on('click', function(event) {
		replyForm = $(this).closest('.media-body').children('.replies-form');
		event.preventDefault();
		toggleElementWithLink(replyForm,$(this));
	});
}

