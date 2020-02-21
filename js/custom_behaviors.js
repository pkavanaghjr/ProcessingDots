// GLOBAL VARIABLES
var titlePageArray = new Array("#logo1","#logo2","#logo4","#logo3","#titlePage h1","#titlePage h2","#titleForm input","#titlePage h3",".fadeOne",".fadeTwo","#designby","#copyrightText");


$(document).ready(function() {
					
	// VARIABLES
	
	
	// EVENT HANDLERS	
// _______________________ PRESET LIST _____________________________________	
	$('#dotOne').on('click', function(event){
		event.preventDefault();
		
		window.location = "index2.html?valueOfFirst=dotOne";
	});	

	$('#dotTwo').on('click', function(event){
		event.preventDefault();
		
		window.location = "index2.html?valueOfFirst=dotTwo";
	});	

	$('#dotThree').on('click', function(event){
		event.preventDefault();
		
		window.location = "index2.html?valueOfFirst=dotThree";
	});	

	$('#dotFour').on('click', function(event){
		event.preventDefault();
		
		window.location = "index2.html?valueOfFirst=dotFour";
	});	
	
	
	$('#presetList a').hover(
		function(){
			$(this).stop(true).animate({opacity:.5}, 500);
		},
		function(){
			$(this).stop(true).animate({opacity:1}, 500);
	});
	
	
// ========================= FAKE FILE BROWSE ===============	
	$('#fakeInput').on('click', function(event){
		event.preventDefault();
		$('#realInput').click();
	});
	
	$('#realInput').on('change', function(event){
		event.preventDefault();
		var fileName = $(this).val();
		writeValueToPage(fileName);
		
		var files = event.target.files;
		
		var reader = new FileReader();

		reader.onload = function() {
		  setPreview(reader.result);
		};
	
		reader.readAsDataURL(files[0]);
		
	});
	
	$("#uploadForm").on("submit", function(event){
		event.preventDefault();
		// Hmmm...?
		window.location = "index2.html?valueOfUpload="+firstTextField;
	});
	
	
	// FUNCTIONS
// ========================= FAKE FILE BROWSE ===============	
	function writeValueToPage(incomingValue){
		$("#pathHolder").html(incomingValue);
	};
	
	function setPreview(url) {
	  $('#myImage').attr('src', url);
	  
	  var image = document.createElement("img");
	  
	  $(image).attr("src", url);
	  
	  //$("#container").append(image)
	  
	}
		
	function animateTitlePageIn(){
			// loop across array of items you want faded in			
			for(i=0;i<titlePageArray.length;i++){
				// make sure all objects you want faded in have styles set to visibility=hidden, opacity=0
				//then make them visible and full opacity
				$(titlePageArray[i]).stop(true).css("visibility", "visible");						
				$(titlePageArray[i]).stop(true).delay(200*i).animate({
					opacity:1
				},750);				
			};	// then initialize the function
					
		};	



	// INITIALIZATION
	animateTitlePageIn();
	
	
});

