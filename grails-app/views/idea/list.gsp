<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'idea.label', default: 'Idea')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${resource(dir:'css',file:'popups.css')}" />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="id" title="${message(code: 'idea.id.label', default: 'Id')}" />
                        
                            <th><g:message code="idea.theCampaign.label" default="Campaign" /></th>
                   	    
                            <g:sortableColumn property="ownerInternetAddress" title="${message(code: 'idea.ownerInternetAddress.label', default: 'Owner')}" />
                        
                            <g:sortableColumn property="topic" title="${message(code: 'idea.topic.label', default: 'Topic')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'idea.description.label', default: 'Description')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ideaInstanceList}" status="i" var="ideaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${ideaInstance.id}">${fieldValue(bean: ideaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: ideaInstance, field: "theCampaign")}</td>
                        
                            <td>${fieldValue(bean: ideaInstance, field: "ownerInternetAddress")}</td>
                        
                            <td>${fieldValue(bean: ideaInstance, field: "topic")}</td>
                        
                            <td>${fieldValue(bean: ideaInstance, field: "description")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ideaInstanceTotal}" />
            </div>
        </div>

<!--        <a href="#?w=700" rel="popup3" class="poplight">See Popup in Action - Width = 700px</a>  -->

<div id="popup3" class="popup_block"> 
  <a href="http://www.designbombs.com"><img src="bomber.gif" alt="Lil bomb dude" style="float: right; margin: 80px 0 0 20px;" /></a> 
    <h2>Popup #3</h2> 
    <pre>&lt;a href=&quot;#?w=720&quot; rel=&quot;popup3&quot; class=&quot;poplight&quot;&gt;</pre> 
    <p>Aliquip transverbero loquor esse ille vulputate exerci veniam fatua eros similis illum valde. Praesent, venio conventio rusticus antehabeo lenis. Melior pertineo feugait, praesent hos rusticus et haero facilisis abluo. </p> 
    <p>Veniam tincidunt augue abluo vero, augue nisl melior quidem secundum nobis singularis eum eum.</p><p><strong>Need Inspiration?</strong> Check out <a href="http://www.designbombs.com">Design Bombs</a></p> 
    
</div> 

<script type="text/javascript"> 
$(document).ready(function(){
   
//When you click on a link with class of poplight and the href starts with a # 
$('a.poplight[href^=#]').click(function() {
var popID = $(this).attr('rel'); //Get Popup Name
var popURL = $(this).attr('href'); //Get Popup href to define size

//Pull Query & Variables from href URL
var query= popURL.split('?');
var dim= query[1].split('&');
var popWidth = dim[0].split('=')[1]; //Gets the first query string value
 
//Fade in the Popup and add close button
$('#' + popID).fadeIn().css({ 'width': Number( popWidth ) }).prepend('<a href="#" class="close"><img src="${resource(dir:'images',file:'close_pop.png')}" class="btn_close" title="Close Window" alt="Close" /></a>');

//Define margin for center alignment (vertical + horizontal) - we add 80 to the height/width to accomodate for the padding + border width defined in the css
var popMargTop = ($('#' + popID).height() + 80) / 2;
var popMargLeft = ($('#' + popID).width() + 80) / 2;

//Apply Margin to Popup
$('#' + popID).css({ 
'margin-top' : -popMargTop,
'margin-left' : -popMargLeft
});

//Fade in Background
$('body').append('<div id="fade"></div>'); //Add the fade layer to bottom of the body tag.
$('#fade').css({'filter' : 'alpha(opacity=80)'}).fadeIn(); //Fade in the fade layer 

return false;
});


//Close Popups and Fade Layer
$('a.close, #fade').live('click', function() { //When clicking on the close or fade layer...
$('#fade , .popup_block').fadeOut(function() {
$('#fade, a.close').remove();  
}); //fade them both out

return false;
});
 

});
</script> 
 

    </body>
</html>
