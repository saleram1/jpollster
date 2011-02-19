<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>${fieldValue( bean: campaignInstance, field: "name" )} - Pollster</title>
	<!-- keep my SiteMinder session alive   -->
	<meta http-equiv="REFRESH" content="890" />

	<!-- Individual YUI JS files - can grails install-plugin yui when hosting for better performance  -->
	<script type="text/javascript" src="http://yui.yahooapis.com/2.8.1/build/utilities/utilities.js"></script>
	<script type="text/javascript" src="http://yui.yahooapis.com/2.8.1/build/button/button-min.js"></script>
	<script type="text/javascript" src="http://yui.yahooapis.com/2.8.1/build/container/container-min.js"></script>
	<script type="text/javascript" src="http://yui.yahooapis.com/2.8.1/build/layout/layout-min.js"></script>
	<script type="text/javascript" src="http://yui.yahooapis.com/2.8.1/build/tabview/tabview-min.js"></script>

	<!-- Bubbling Dependency source files -->
	<script type="text/javascript" src="http://js.bubbling-library.com/2.1/build/bubbling/bubbling.js"></script> 
	<script type="text/javascript" src="http://js.bubbling-library.com/2.1/build/accordion/accordion.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type="text/javascript"></script>

	<script type="text/javascript" charset="utf-8">
	jQuery.noConflict();
	var $j = jQuery;

	$j(function() {
		var feedbackTab = {
			speed: 250, 
			containerWidth:$j('.feedback-panel').outerWidth(),
			containerHeight:$j('.feedback-panel').outerHeight(),
			tabWidth:$j('.feedback-tab').outerWidth(),

			init:function(){
				$j('.feedback-panel').css('height',feedbackTab.containerHeight + 'px');

				$j('a.feedback-tab').click(function(event){
					if ($j('.feedback-panel').hasClass('open')) {
						$j('.feedback-panel').animate({left:'-' + feedbackTab.containerWidth}, feedbackTab.speed)
						.removeClass('open');
					} else {
						$j('.feedback-panel').animate({left:'0'},  feedbackTab.speed)
						.addClass('open');
					}
					event.preventDefault();
				});
			}
		};

		feedbackTab.init();

		$j(".button").click(function() {
			var response_message = "Thank you for your comments"
			var postData = 'name=' + $j("input#name").val() + '&content=' + $j("textarea#content").val();

			$j.ajax({
				type: "POST",
				url: "/pollster/blurb/save",
				data: postData,
				success: function() {
					$j('#form-wrap').html("<div id='response-message'></div>");
					$j('#response-message').html("<p>" + response_message +"</p>")
					.hide()
					.fadeIn(500)
					.animate({opacity: 1.0}, 1000)
					.fadeIn(0, function(){
						$j('.feedback-panel')
						.animate({left:'-' + (feedbackTab.containerWidth + feedbackTab.tabWidth)}, 
						(feedbackTab.speed))
						.removeClass('open');
					})
				}
			});
			return false;
		});
	});
	
	</script>

	<!-- Individual YUI CSS files -->
	<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.8.1/build/fonts/fonts-min.css">
	<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.8.1/build/button/assets/skins/sam/button.css">
	<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.8.1/build/container/assets/skins/sam/container.css">
	<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.8.1/build/layout/assets/skins/sam/layout.css">
	<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.8.1/build/tabview/assets/skins/sam/tabview.css">
	<link rel="stylesheet" type="text/css" href="http://js.bubbling-library.com/2.1/build/accordion/assets/accordion.css" /> 
	<!--  Local styles and stuff  -->
	<link rel="stylesheet" href="${resource(dir:'css',file:'mytabview.css')}" />
	<link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />

	<style type="text/css" media="screen">
	.feedback-panel {
		padding:20px;
		width: 250px;
		background: #bab6d8;
		border: #29216d 1px solid;
		position:absolute;
		top:220px;
		left:-291px;
	}

	.feedback-panel a.feedback-tab {
		background:transparent url(/pollster/images/feedbacktab.gif) no-repeat scroll 0 0;
		border-width: 1px 1px 1px 0;
		display:block;
		height:99px;
		left:51px;
		bottom:21px;
		position:relative;
		float:right;
		text-indent:-9999px;
		width: 30px;
		outline:none;
	}

	#response-message {
		background: #ccc;
		border: 1px solid #999;
		padding:50px;
	}
	</style>

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
	<div class="feedback-panel">
		<a class="feedback-tab" href="#">Feedback</a>

		<h3>Share Your Ideas</h3>
		<div id="form-wrap">
			<form method="post" action="/pollster/blurb/save">
				<br />
				<label for="name">Contact:</label><input type="text" id="name" name="name" value="billg@microsoft.com"><br/>
				<label for="content">Message:</label><textarea id="content" name="content" rows="10" col="30"></textarea><br />
				<input type="submit" name="Post" class="button" />
			</form>
		</div>    
	</div>

	<div id="top1" style="background-color: #104E8B;">
		<img src="${resource(dir:'images',file:'jpollster-main.gif')}" /><br/>
		<g:render template="localButtonBar" model="{[campaignInstance: campaignInstance]}" />
	</div>  

	<div id="center1">
		<div id="applicationTabs" class="yui-navset">

			<ul class="yui-nav">
				<li>
					<a href="#tab0"><em>Recent</em></a>
				</li>	
				<li class="selected">
					<a href="#tab1"><em>Top of the Pops</em></a>
				</li>	
				<li>
					<a href="#tab2"><em>By DateCreated</em></a>
				</li>
			</ul>      

			<div id="contentBits" class="yui-content" style="background-color: #F8F8FF;">
				<div>
					<h3>&nbsp;</h3>
					<p>
						You have no recent messages.  Check back in awhile or <span id="addTabButton"><a href="/pollster/searchable/">search</a></span>
					</p>
				</div>

				<div>
					<g:render template="byTopVotesView" model="{[campaignInstance: campaignInstance]}" />
				</div>

				<div>
					<g:render template="byDateView" model="{[campaignInstance: campaignInstance]}" />
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
				{ position: 'top', height: 124, body: 'top1', scroll: null, zIndex: 2 },
				{ position: 'center', body: 'center1', gutter: '5px', collapse: false, scroll: true, resize: true, animate: false },
				{ position: 'right', width: 210, collapse: true, scroll: true, body: 'right1', animate: false }
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
