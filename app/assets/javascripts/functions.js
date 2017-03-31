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