// Function for displaying selected image
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();

		reader.onload = function (e) {
			$('#actualImage')
				.attr('src', e.target.result)
				$('#actualImage').addClass("blahImage");
				$('#actualImage').removeClass("blah");
		};
	reader.readAsDataURL(input.files[0]);
}
}


$(document).ready(function () {
	let id;
	// Hiding the loading GIF
	$('#loading').hide();

	$('.card').click(function () {
		// Opening person details on a new tab
		var newWindow = window.open("","_blank");
		// Getting the id of the selected person
		id = $(this).attr('data-id');
		// Sending an ajax GET request
		$.ajax({
			type: "GET",
			url: "http://localhost:5000/search/"+id,
			success: function (data) {
				newWindow.location.href = 'http://localhost:5000/search/'+id;
				console.log("SUCCESS : ", data);
			},
		});
	});



	// Fucntion that executes when the searchbtn is clicked
	$("#searchbtn").click(function(){
		//stop submitting the form, we will post it manually
		event.preventDefault();
		
		// Get form
		var form = $('#searchperson')[0];
		// Create a FormData Object
		var data = new FormData(form);
		// Showing the GIF when the searh_btn is clicked
		$('#loading').show();
		// Sending an ajax post request
		$.ajax({
			type: "POST",
			enctype: 'multipart/form-data',
			url: "http://localhost:5000/facesearch",
			data: data,
			processData: false,
			contentType: false,
	        	success: function (data) {
				$('#loading').hide();
				console.log("Success");
				$("#searchbtn").prop("disabled", false);
				$("body").html(data);
			},
		});
	});
});
