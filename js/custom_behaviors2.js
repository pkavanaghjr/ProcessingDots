// GLOBAL VARIABLES
var canvas;
var pjs;
var canvasPageArray = new Array(".navFadeOne",".navFadeTwo",".navFadeThree","#interface","#gui .fadeOne","#gui .fadeTwo","#gui .fadeThree","#gui .fadeFour","#gui .fadeFive","#myCanvas","#interface h1");
var guiFadeArray = new Array("#gui .fadeOne","#gui .fadeTwo","#gui .fadeThree","#gui .fadeFour","#gui .fadeFive");
var searchString = document.location.search;
var canvasClicked = false;


$(document).ready(function() {
					
	// VARIABLES
	
	
	// EVENT HANDLERS
// _______________________ CANVAS CLICK _____________________________________
	$("#myCanvas").on('focus', function(){			
		
		$("#interface h1").stop(true).css("visibility", "hidden");						
		$("#interface h1").stop(true).animate({
			opacity:0
		},1000);		
		
		$("#interface h2").stop(true).css("visibility", "visible");						
		$("#interface h2").stop(true).animate({
			opacity:1
		},1000);		
		
		keyboardClick();

	});	
	
	
	$("#myCanvas").on('blur', function(){			
		
		$("#interface h2").stop(true).css("visibility", "hidden");						
		$("#interface h2").stop(true).animate({
			opacity:0
		},1000);		
		
		$("#interface h1").stop(true).css("visibility", "visible");						
		$("#interface h1").stop(true).animate({
			opacity:1
		},1000);		
		
		canvasClick();
	});	

// _______________________ PRESET LIST _____________________________________
	$('#smallDotOne').on('click', function(event){
		event.preventDefault();
		
		window.location = "index2.html?valueOfFirst=dotOne";
	});	

	$('#smallDotTwo').on('click', function(event){
		event.preventDefault();
		
		window.location = "index2.html?valueOfFirst=dotTwo";
	});	

	$('#smallDotThree').on('click', function(event){
		event.preventDefault();
		
		window.location = "index2.html?valueOfFirst=dotThree";
	});	

	$('#smallDotFour').on('click', function(event){
		event.preventDefault();
		
		window.location = "index2.html?valueOfFirst=dotFour";
	});	
	
	
	$('#presetList2 a').hover(
		function(){
			$(this).stop(true).animate({opacity:.5}, 500);
		},
		function(){
			$(this).stop(true).animate({opacity:1}, 500);
	});
	
	
	$(".navFadeOne").hover(
		function(){
			$(this).stop(true).animate({opacity:.5}, 500);
		},
		function(){
			$(this).stop(true).animate({opacity:1}, 500);
	});
	
	
	
// _______________________ ICON HOVER _____________________________________
/*	$("#gui a").hover(
		function(){
			$(this).stop(true).animate({opacity:0}, 500);
			$("#gui h4").stop(true).css("visibility", "visible");
		},
		function(){
			$(this).stop(true).animate({opacity:1}, 500);
			$("#gui h4").stop(true).css("visibility", "hidden");
	});
*/	
	
// _______________________ RESIZE EVENT HANDLER _____________________________________	
	$(window).resize(function(event){
		event.preventDefault();
		resizeCanvas();
	});
			
	
	// FUNCTIONS	
// _______________________ INITIALIZE CANVAS _____________________________________	
	function initializeInterface(){
		canvas = document.getElementById('myCanvas');
		canvas.width  = $("#myCanvas").width();
		canvas.height = $("#myCanvas").height();
		var pII;
		pII=setInterval(function() {  
			pjs = Processing.getInstanceById("myCanvas");
			var userImage = getQueryParam("valueOfFirst", searchString);
			pjs.chooseImage(userImage)
			console.log("pjs: "+pjs);
			console.log(userImage);
			if (pjs) clearInterval(pII);
		}, 500);
	};



// _______________________ RESIZE CANVAS _____________________________________
	function resizeCanvas(){
		canvas.width  = $("#myCanvas").width();
		canvas.height = $("#myCanvas").height();
		
		if(pjs){
			pjs.resizeProcessing(canvas.width, canvas.height);
		};
	};
		
// _______________________ PROCESS CHOOSE IMG _____________________________________
	function chooseImageFunction(){
	
		
		if(pjs){
			pjs.chooseImage(imageChoice);
		};
	};
		
		
	
// _______________________ WRITE QUERY STRING TO PAGE _____________________________________
	function writeTextToPage(textToWrite, destination){
		$(destination).html(textToWrite);
		
	};
	
// _______________________ GET QUERY STRING _____________________________________
	function getQueryParam(parameter, qs) {
		qs = "&" + qs.replace(/%20/gi, ' ' );
		var p = escape(unescape(parameter));
		var regex = new RegExp("[?&]" + p + "=(?:([^&]*))?", "i");
	   
		var match = regex.exec(qs);
		var value = "";
		if (match != null) {
			value = match[1];
		};
		return value;
	};		
	
// _______________________ BLINK CANVAS CLICK _____________________________________
	function canvasClick(){
		
		$('#interface h1').delay(750).animate({opacity:.35},1500).delay(100).animate({opacity:1},250);
			canvasClick();
	}	
	

	function keyboardClick(){
			$('#interface h2').delay(100).animate({opacity:.35},1500).delay(100).animate({opacity:1},500);
			$('#interface h2').delay(100).animate({opacity:.35},1500).delay(100).animate({opacity:1},500);
			$('#interface h2').delay(100).animate({opacity:.35},1500).delay(100).animate({opacity:1},500);
	}	
	

// _______________________ ANIMATE PAGE _____________________________________
	function animateCanvasPage(){			
			for(i=0;i<canvasPageArray.length;i++){
				$(canvasPageArray[i]).stop(true).css("visibility", "visible");						
				$(canvasPageArray[i]).stop(true).delay(200*i).animate({opacity:1},750);							
			};	
			canvasClick();
					
		};	



	// INITIALIZATION
	chooseImageFunction();
	initializeInterface();
	animateCanvasPage();
	
});

