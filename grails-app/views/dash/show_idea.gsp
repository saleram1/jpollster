<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <title>${fieldValue( bean: ideaInstance, field: "topic" )} - Pollster</title>
    <meta http-equiv="REFRESH" content="900" />

    <!-- DO NOT USE YUI Loader to bring in your other dependencies: -->
    <!-- Individual YUI CSS files -->
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.8.1/build/fonts/fonts-min.css">
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.8.1/build/button/assets/skins/sam/button.css">
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.8.1/build/container/assets/skins/sam/container.css">
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.8.1/build/layout/assets/skins/sam/layout.css">
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.8.1/build/tabview/assets/skins/sam/tabview.css">
    <link rel="stylesheet" type="text/css" href="http://js.bubbling-library.com/2.1/build/accordion/assets/accordion.css" /> 
    
    <!-- Individual YUI JS files -->
    <script type="text/javascript" src="http://yui.yahooapis.com/2.8.1/build/utilities/utilities.js"></script>
    <script type="text/javascript" src="http://yui.yahooapis.com/2.8.1/build/button/button-min.js"></script>
    <script type="text/javascript" src="http://yui.yahooapis.com/2.8.1/build/container/container-min.js"></script>
    <script type="text/javascript" src="http://yui.yahooapis.com/2.8.1/build/layout/layout-min.js"></script>
    <script type="text/javascript" src="http://yui.yahooapis.com/2.8.1/build/tabview/tabview-min.js"></script>

    <!-- Bubbling Dependency source files -->
    <script type="text/javascript" src="http://js.bubbling-library.com/2.1/build/bubbling/bubbling.js"></script> 
    <script type="text/javascript" src="http://js.bubbling-library.com/2.1/build/accordion/accordion.js"></script> 
    
    <!--  Local stuff  -->
    <link rel="stylesheet" href="${resource(dir:'css',file:'mytabview.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />

    <!--  Grails and modalBox block -->
    <g:javascript library="application" />
    <modalbox:modalIncludes />
<style type="text/css">
.rounded_colhead
{
  width: 44px;
  margin: auto;
  color: white;
  padding: 14px 20px;
  /* Rounded corner stuff starts here */
  background-color: #3f6daf;
  -webkit-border-radius: 6px;    /* for Safari */
  -moz-border-radius: 6px;       /* for Firefox */
}
</style> 
 
<!--[if gte IE 7]>
<style type="text/css">
 
.rounded_colhead
{
  position: relative;
}
 
.rounded_colhead > .tl, .rounded_colhead > .tr, .rounded_colhead > .bl, .rounded_colhead > .br
{
  width: 6px;
  height: 6px;
  position: absolute;
}
 
.rounded_colhead > .tl
{
  background: url(/pollster/images/colhead-tl.png) top left no-repeat;
  top: 0;
  left: 0;
}
 
.rounded_colhead > .tr
{
  background: url(/pollster/images/colhead-tr.png) top right no-repeat;
  top: 0;
  right: 0;
}
 
.rounded_colhead > .bl
{
  background: url(/pollster/images/colhead-bl.png) bottom left no-repeat;
  bottom: 0;
  left: 0;
}
 
.rounded_colhead > .br
{
  background: url(/pollster/images/colhead-br.png) bottom right no-repeat;
  bottom: 0;
  right: 0;
}

</style>
<![endif]--> 
</head>

<body class="yui-skin-sam">
  <div id="top1" style="background-color: #104E8B;">
    <img src="${resource(dir:'images',file:'jpollster-main.gif')}" /><br/>
    <g:render template="localIdeaButtonBar" model="{[ideaInstance: ideaInstance]}" />
  </div>  

  <div id="center1">
    <div id="applicationTabs" class="yui-navset">

      <ul class="yui-nav">
	<li class="selected">
	  <a href="#tab0"><em>Idea Board</em></a>
	</li>
      </ul>    

      <div id="contentBits" class="yui-content" style="background-color: #F8F8FF;">
	<div>
	  <g:render template="myIdeaView" model="{[ideaInstance: ideaInstance]}" />
	</div>
      </div>
    </div>
    
    <div id="right1">
      <p>
        <g:if test="${flash.message}">
          <div class="message">${flash.message}</div>
        </g:if>
      </p>
      <p>
	<g:if test="${flash.invalidToken}">
	  Please do not click the &apos;Create&apos; button twice!  Be patient while we are still in Beta.
	</g:if>
      </p>
    </div>    
  </div>
  
<!-- script tag to handle yui tabview renderer  here -->
<script type="text/javascript">
var m_myTabs = null;

(function() {
var initTabView = function() {
    var t_counter = 0;  // iterator for new tab labels
    
    m_myTabs = new YAHOO.widget.TabView( "applicationTabs" );
}();

     YAHOO.util.Event.onDOMReady(function() {
        var layout = new YAHOO.widget.Layout({
            units: [
                { position: 'top', height: 117, body: 'top1', scroll: null, zIndex: 2 },
                { position: 'center', body: 'center1', gutter: '5px', collapse: false, scroll: true, animate: false },
                { position: 'right', width: 200, resize: true, collapse: true, scroll: true, body: 'right1', animate: false }
            ]
        });
        
        layout.on('render', function() {
            YAHOO.util.Event.onContentReady("center1", initTabView );
        });
        
        layout.render();
    });
})();
</script>
</body>
</html>
