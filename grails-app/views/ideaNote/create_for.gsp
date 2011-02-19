<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Editor - Pollster</title>

    <!-- Individual YUI CSS files -->
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.8.1/build/fonts/fonts-min.css">
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.8.1/build/button/assets/skins/sam/button.css">
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.8.1/build/container/assets/skins/sam/container.css">
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.8.1/build/menu/assets/skins/sam/menu.css">
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.8.1/build/editor/assets/skins/sam/editor.css">
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.8.1/build/layout/assets/skins/sam/layout.css">
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.8.1/build/tabview/assets/skins/sam/tabview.css">
    <!-- Individual YUI JS files -->
    <script type="text/javascript" src="http://yui.yahooapis.com/2.8.1/build/yahoo/yahoo-min.js"></script>
    <script type="text/javascript" src="http://yui.yahooapis.com/2.8.1/build/dom/dom-min.js"></script>
    <script type="text/javascript" src="http://yui.yahooapis.com/2.8.1/build/event/event-min.js"></script>
    <script type="text/javascript" src="http://yui.yahooapis.com/2.8.1/build/element/element-min.js"></script>
    <script type="text/javascript" src="http://yui.yahooapis.com/2.8.1/build/connection/connection-min.js"></script>
    <script type="text/javascript" src="http://yui.yahooapis.com/2.8.1/build/container/container-min.js"></script>
    <script type="text/javascript" src="http://yui.yahooapis.com/2.8.1/build/button/button-min.js"></script>
    <script type="text/javascript" src="http://yui.yahooapis.com/2.8.1/build/editor/editor-min.js"></script>

    <script type="text/javascript" src="${resource(dir:'js',file:'jsvalidation.js')}"></script>
</head>

<body class="yui-skin-sam">

<div id="dialogContainer"> 
  <div class="hd">Enter Document Title, URL, and Abstract - Save when Done</div> 
  <div class="bd"> 
    <form id="dialogForm" name="dialogForm" method="post" action="/pollster/ideaNote/save">
      <fieldset>
	<p><label for="title">Document Title</label> <input name="title" id="title" size="45" class="required validate-alphanum" /></p>
	<p><label for="theIdea.id">Choose Idea</label>
 <g:select name="theIdea.id" from="${ideaNoteInstance?.theCampaign?.ideas.sort { it.topic }}" optionKey="id" value="${ideaNoteInstance?.theIdea?.id}"  />      </p
	<p><label for="urlName">URL (optional)</label> <input name="urlName" id="urlName" size="80" class="validate-url" /></p>
      </fieldset>
      <textarea id="abstractTxt" name="abstractTxt" class=""></textarea>
      
      <div id="descriptionContainer">&nbsp;</div>
      
    <g:hiddenField name="theCampaign.id" value="${ideaNoteInstance?.theCampaign?.id}" />
    <g:hiddenField name="author" value="${ideaNoteInstance?.author}" />
    <g:hiddenField name="referredBy" value="${ideaNoteInstance?.referredBy}" />      
      </form> 
    </div> 
</div> 

<script language="JavaScript"> 
(function() {

//create the RTE:
var editor = new YAHOO.widget.Editor('abstractTxt', {
    width: '702px',
    height: '200px'
});
 
//render the editor explicitly into a container
//within the Dialog's DOM:
editor.render();

//create Dialog:
var dlg = new YAHOO.widget.Dialog("dialogContainer", {
    width:"725px",
    modal: true,
    visible: true
});
 
//event handlers for our Dialog buttons:

//if the user clicks "save", then we save the HTML
//content of the RTE and submit the dialog:
function handleSave() {
    editor.saveHTML();
    this.submit();
    window.close();
}

//if the user clicks cancel, we call Dialog's
//cancel method:
function handleCancel() {
    this.cancel();
    window.close();
}

//set up buttons for the Dialog and wire them
//up to our handlers:
var myButtons = [ { text:"Save", 
handler:handleSave },
  { text:"Cancel", 
handler:handleCancel,
isDefault:true } ];
dlg.cfg.queueProperty("buttons", myButtons);
 
//Dialog by default will use Connection Manager to POST
//form contents to the URI specified in the action
//attribute of the form; we can wire up success and
//failure handlers for the XHR call and act on them
//just as we would with any Connection Manager
//transaction:
var onSuccess = function(o) {
//we're going to get JSON back from post.php; we
//can parse it using JSON.parse:
var data = YAHOO.lang.JSON.parse(o.responseText);

}
var onFailure = function(o) {
    //in the event of a failure, we can log the problem:
    YAHOO.log("Dialog reported a communication failure; connection object: " + YAHOO.lang.dump(o, 5));
}
dlg.callback.success = onSuccess;
dlg.callback.failure = onFailure;
 
//Now that our Dialog is fully configured, we can
//render it:
    dlg.render();
})();
</script> 
 
</body>
</html>
