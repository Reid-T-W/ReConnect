//Function for displaying selected image
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();

		reader.onload = function (e) {
			$('.blah')
				.attr('src', e.target.result)
				.width(150)
				.height(200);
		};
	reader.readAsDataURL(input.files[0]);
}
}

// Displaying the first Image
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

	$('.card').click(function () {
		var newWindow = window.open("","_blank");
		id = $(this).attr('data-id');
		//window.location.href = 'http://localhost:5000/search/'+id;
		$.ajax({
			type: "GET",
			url: "http://localhost:5000/search/"+id,
			success: function (data) {
				// window.location.href = 'http://localhost:5000/search/'+id;
				newWindow.location.href = 'http://localhost:5000/search/'+id;
				console.log("SUCCESS : ", data);
			},
		});
	});




	$("#searchbtn").click(function(){
		//stop submit the form, we will post it manually
		event.preventDefault();
		
		// Get form
		var form = $('#searchperson')[0];
		// Create a FormData Object
		var data = new FormData(form);

		$.ajax({
			type: "POST",
			enctype: 'multipart/form-data',
			url: "http://localhost:5000/facesearch",
			data: data,
			processData: false,
			contentType: false,
	        	success: function (data) {
				console.log(data);
				$("#searchbtn").prop("disabled", false);
				$("body").html(data);
			},
		});
	});
});
