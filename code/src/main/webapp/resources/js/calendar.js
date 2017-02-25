/* Calendar */
$(document).ready(function() {
	$("#datepicker").datepicker();
});
/* End Calendar */

/* Popup */
$(".modal-wide").on("show.bs.modal", function() {
	var height = $(window).height() - 900;
	$(this).find(".modal-body").css("max-height", height);
});
/* End Popup */

/* Text Editor */
bkLib.onDomLoaded(function() {
	nicEditors.allTextAreas()
}); // convert all text areas to rich text editor on that page

bkLib.onDomLoaded(function() {
	new nicEditor().panelInstance('area1');
}); // convert text area with id area1 to rich text editor.

bkLib.onDomLoaded(function() {
	new nicEditor({
		fullPanel : true
	}).panelInstance('area2');
}); // convert text area with id area2 to rich text editor with full panel.
/* End Text Editor */