
$(document).ready(function() {
    	
	 
//ACCORDION BUTTON ACTION (ON CLICK DO THE FOLLOWING)
  $('.accordion-title').click(function() {
		//REMOVE THE ON CLASS FROM ALL BUTTONS
		$('.accordion-title').removeClass('on');
		$('.accordion-title').find('i').addClass('fa-chevron-up').removeClass('fa-chevron-down');
		  
		//NO MATTER WHAT WE CLOSE ALL OPEN SLIDES
	 	$('.accordian-content').slideUp('normal');
   
		//IF THE NEXT SLIDE WASN'T OPEN THEN OPEN IT
		if($(this).next().is(':hidden') == true) {
			
			//ADD THE ON CLASS TO THE BUTTON
			$(this).addClass('on');
			$(this).find('i').addClass('fa-chevron-down').removeClass('fa-chevron-up');
			  
			//OPEN THE SLIDE
			$(this).next().slideDown('normal');
		 } 
		  
	 });
	  
	
	/*** REMOVE IF MOUSEOVER IS NOT REQUIRED ***/
	
	//ADDS THE .OVER CLASS FROM THE STYLESHEET ON MOUSEOVER 
	$('.accordion-title').mouseover(function() {
		$(this).addClass('over');
		
	//ON MOUSEOUT REMOVE THE OVER CLASS
	}).mouseout(function() {
		$(this).removeClass('over');										
	});
	
	/*** END REMOVE IF MOUSEOVER IS NOT REQUIRED ***/
	
	
	/********************************************************************************************************************
	CLOSES ALL S ON PAGE LOAD
	********************************************************************************************************************/	
	$('.accordian-content').hide();
	$('.show').show();

   
   	
});


