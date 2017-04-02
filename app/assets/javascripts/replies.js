$(document).on('turbolinks:load', function() {
	ajaxInProgress = false;
	needsUpdate = true;
	showRepliesContainerOnClick();
	showReplyFormOnClick();
	if (pathEndsWith('replies')) { showRepliesList() }
	$(window).scroll(function() {
		if ($('.replies-list')[0]) {
			needsMoreReplies();
		}
	});
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

function showRepliesList() {
	repliesList = $('.replies-list');
	if (repliesList.hasClass('hidden')) { repliesList.removeClass('hidden') }
	repliesList.hide().fadeIn(450)
}

function needsMoreReplies() {
	repliesList = $('.replies-list');
	if( repliesList && isScrolledIntoView($('.replies-list .reply:last-child')) && !ajaxInProgress && needsUpdate) {
		ajaxInProgress = true;
		$.ajax({
			type: 'get',
			url: '/replies/get',
			dataType: 'script',
			data: {
				lowerLimit: $('.replies-list .reply').length,
				upperLimit: $('.replies-list .reply').length + 10,
				id: $('#message-id').text()
			}
		});
	}
}

