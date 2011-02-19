<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <title>${fieldValue( bean: campaignInstance, field: "name" )} - Pollster</title>

    <!-- Individual YUI CSS files -->
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.8.1/build/fonts/fonts-min.css">
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.8.1/build/grids/grids-min.css">
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.8.1/build/layout/assets/skins/sam/layout.css">
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.8.1/build/tabview/assets/skins/sam/tabview.css">
    <!-- Individual YUI JS files only using TabView and LayoutManager -->
    <script type="text/javascript" src="http://yui.yahooapis.com/2.8.1/build/yahoo-dom-event/yahoo-dom-event.js"></script>
    <script type="text/javascript" src="http://yui.yahooapis.com/2.8.1/build/element/element-min.js"></script>
    <script type="text/javascript" src="http://yui.yahooapis.com/2.8.1/build/layout/layout-min.js"></script>
    <script type="text/javascript" src="http://yui.yahooapis.com/2.8.1/build/tabview/tabview-min.js"></script>
    
    <!--  Grails block -->
    <script type='text/javascript' src='/pollster/plugins/modalbox-0.4/js/modalbox/prototype.js'></script>
    <script type='text/javascript' src='/pollster/plugins/modalbox-0.4/js/modalbox/scriptaculous.js?load=effects'></script>
    <script type='text/javascript' src='/pollster/plugins/modalbox-0.4/js/modalbox/modalbox.js'></script>

    <link rel="stylesheet" href="${resource(dir:'css',file:'mytabview.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
    <link rel="stylesheet" href="/pollster/plugins/modalbox-0.4/css/modalbox.css" />

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
  background: url(/images/ui/rounded/colhead-tl.png) top left no-repeat;
  top: 0;
  left: 0;
}
 
.rounded_colhead > .tr
{
  background: url(/images/ui/rounded/colhead-tr.png) top right no-repeat;
  top: 0;
  right: 0;
}
 
.rounded_colhead > .bl
{
  background: url(/images/ui/rounded/colhead-bl.png) bottom left no-repeat;
  bottom: 0;
  left: 0;
}
 
.rounded_colhead > .br
{
  background: url(/images/ui/rounded/colhead-br.png) bottom right no-repeat;
  bottom: 0;
  right: 0;
}

</style>
<![endif]--> 
</head>

<body class="yui-skin-sam">
    <g:layoutBody />
  
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
                { position: 'top', height: 80, body: 'top1', scroll: null, zIndex: 2 },
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
