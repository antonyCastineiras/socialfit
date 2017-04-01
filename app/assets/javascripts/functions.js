//deals with checking if an element is in the windows view
function isScrolledIntoView(elem) {
	var docViewTop = $(window).scrollTop();
	var docViewBottom = docViewTop + $(window).height();

	var elemTop = $(elem).offset().top;
	var elemBottom = elemTop + $(elem).height();

	return ((elemBottom <= docViewBottom) && (elemTop >= docViewTop))
}

function isCorrectController(controller,action) {
	paths = window.location.pathname.split("/");
	lastPath = paths[paths.length-1]
	secondLast = paths[paths.length-2]
	return (lastPath === action && secondLast === controller)
}

function toggleElementWithLink(elem,link) {
		if (elem.hasClass('hidden')) {
			elem.removeClass('hidden').hide();
		}
		elem.slideToggle(450);
		switch(link.text()) {
			case "Reply":
				link.text('Hide Reply Form');
				break;
			case "Hide Reply Form":
				link.text('Reply');
				break;
			case "See Replies":
				link.text('Hide Replies');
				break;
			case "Hide Replies":
				link.text('See Replies');
				break;
		}
}

function pathEndsWith(string) {
	paths = window.location.pathname.split('/'); 
	return paths[paths.length-1] == string;
}