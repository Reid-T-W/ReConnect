//Functions for displaying selected images
// Displaying the first Image
function readURLImage1(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
  
    reader.onload = function (e) {
      $('#actualImage1')
        .attr('src', e.target.result)
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
	$('#actualImage4').addClass("blahImage");
	$('#actualImage4').removeClass("blah");
    };
    reader.readAsDataURL(input.files[0]);
  }
}

//Sending user input to server
$(document).ready(function () {
  $("button[name='submit']").click(function(){
    //stop submit the form, we will post it manually
    event.preventDefault();

    // Get form
    var form = $('#missingperson')[0];
   
    // Create a FormData Object
    var data = new FormData(form);
    
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
        $("button[name='submit']").prop("disabled", false);
      },
    });
  });
});
