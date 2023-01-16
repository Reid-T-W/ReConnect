//Functions for displaying selected images
// Displaying the first Image
function readURLImage1(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
  
    reader.onload = function (e) {
      $('#actualImage1')
        .attr('src', e.target.result)
	// When an image is selected the blah class is removed 
	// and the blahImage class is added, this helps in avoiding
	// the unwanted padding that is present in the blah class
	$('#actualImage1').addClass("blahImage");
	$('#actualImage1').removeClass("blah");
    };
    reader.readAsDataURL(input.files[0]);
  }
}

// Displaying the second Image
function readURLImage2(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
  
    reader.onload = function (e) {
      $('#actualImage2')
        .attr('src', e.target.result)
	// When an image is selected the blah class is removed 
	// and the blahImage class is added, this helps in avoiding
	// the unwanted padding that is present in the blah class
	$('#actualImage2').addClass("blahImage");
	$('#actualImage2').removeClass("blah");
    };
    reader.readAsDataURL(input.files[0]);
  }
}

//Displaying the third Image
function readURLImage3(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
  
    reader.onload = function (e) {
      $('#actualImage3')
        .attr('src', e.target.result)
	// When an image is selected the blah class is removed 
	// and the blahImage class is added, this helps in avoiding
	// the unwanted padding that is present in the blah class
	$('#actualImage3').addClass("blahImage");
	$('#actualImage3').removeClass("blah");
    };
    reader.readAsDataURL(input.files[0]);
  }
}

//Displaying the fourth image
function readURLImage4(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
  
    reader.onload = function (e) {
      $('#actualImage4')
        .attr('src', e.target.result)
	// When an image is selected the blah class is removed 
	// and the blahImage class is added, this helps in avoiding
	// the unwanted padding that is present in the blah class
	$('#actualImage4').addClass("blahImage");
	$('#actualImage4').removeClass("blah");
    };
    reader.readAsDataURL(input.files[0]);
  }
}

//Sending user input to server
$(document).ready(function () {
  // Hiding the loading GIF
  $('#loading').hide();
  
  //Execute the following function when the submit button
  //is clicked
  $("button[name='submit']").click(function(){
    //stop submit the form, we will post it manually
    event.preventDefault();

    // Get form
    var form = $('#missingperson')[0];
   
    // Create a FormData Object
    var data = new FormData(form);
    // Show the loading GIF, as the submit button is already clicked
    $('#loading').show(); 
    //Disabling the submit button
    $("button[name='submit']").prop("disabled", true);
    $.ajax({
      type: "POST",
      enctype: 'multipart/form-data',
      url: "http://localhost:5000/api/v1/missingperson",
      data: data,
      processData: false,
      contentType: false,
      success: function (data) {
        console.log("SUCCESS : ", data);
        // Hide the loading GIF as the AJAX request has
	// successfully executed
	$('#loading').hide();
	// Enabling the submit button
        $("button[name='submit']").prop("disabled", false);
      },
    });
  });
});
