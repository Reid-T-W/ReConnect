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
    //for (const value of data.values()) {
    //  console.log(value);
    //}
    console.log(data.get('image1'))
    // let name = $("input[name='name']").val();
    // let gender = $("input[name='gender']:checked").val();
    // let description = $("input[name='description']").val();
    // let subcity = $("input[name='subcity']").val();
    // let woreda = $("input[name='woreda']").val();
    // let contact1name = $("input[name='contact1name']").val();
    // let contact1phone = $("input[name='contact1phone']").val();
    // let contact2name = $("input[name='contact2name']").val();
    // let contact2phone = $("input[name='contact2phone']").val();
    // console.log(name, gender, description, subcity, woreda, contact1name, contact1phone, contact2name, contact2phone);
  });
});
