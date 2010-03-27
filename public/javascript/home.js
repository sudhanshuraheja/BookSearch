$(document).ready(function() {

	// Focus search box if empty
	if($("#home-bookname-input").val() == '') {
		$("#home-bookname-input").focus();
	}

});

function setRedirect() {
	var searchTerm = $("#home-bookname-input").val();
	if(searchTerm != '') {
		location.href = Generatrix.href('/search/book/' + searchTerm);
	}
}
