$(document).ready( function() {
    $('#web_apps').bind( 'click', function(){
        $(this).css('border-bottom','1px solid red')
        $('#menu').slideToggle();
    });    
});
