
<div class="nav"> 
    <div id="linkbuttonsfrommarkup" style="text-align:right;">

        <span id="linkbutton1" class="yui-button yui-link-button"> 	  <em class="first-child">
    <a href=
    "/pollster/campaign/create2" title="AskIT" onclick=
    "Modalbox.show(this.href, {title: this.title, width: 650, transitions: false, overlayDuration: 1}); return false;">
    AskIT</a>
          </em>
	</span>

        <span id="linkbutton2" class="yui-button yui-link-button"> 	  <em class="first-child">
    <a  href=
    "/pollster/idea/create_for?campaignId=${fieldValue( bean: campaignInstance, field: 'id')}"
    title='SuggestIT' onclick=
    'Modalbox.show(this.href, {title: this.title, width: 650, transitions: false, overlayDuration: 1}); return false;'>
    SuggestIT</a>
          </em>
	</span>

        <span id="linkbutton3" class="yui-button yui-link-button">	  <em class="first-child">
          <a href="#" onClick="window.open('/pollster/ideaNote/create_for?campaignId=${campaignInstance.id}','window1','width=750,height=590,location=0,menubar=0,scrollbars=0,status=1,toolbar=0,resizable=0')">Annotate&hellip;</a>
          </em>
	</span>

        <span id="linkbutton4" class="yui-button yui-link-button"> 	  <em class="first-child">
	    <a 
	        href=
		    "/pollster/voteEvent/create_for?campaignId=${fieldValue( bean: campaignInstance, field: 'id')}"
		    title="Vote Early" onclick=
		    "Modalbox.show(this.href, {title: this.title, width: 700, transitions: false, overlayDuration: 1}); return false;">
		    Vote Here</a></em>
	</span>

        <span id="linkbutton5" class="yui-button yui-link-button"> 	  <em class="first-child">
    <a href="#" 
     onclick="javascript:alert('Use SuggestIT button to contribute a new top-level Idea, then Annotate with RichText if desired.  Vote Here casts a vote for one of the ideas displayed. Use AskIT to start a new Category');">
    Help!</a></em>
	</span>

        <label for="theCampaign">Go:</label>
        <g:select name="theCampaign.name" from="${Campaign.list(sort: 'name', max:40)}" noSelection="['':'--Select Campaign--']" optionValue="name" value="${ideaInstance?.theCampaign?.name}" onchange="if ( this.value != '' ) { window.location.href='/pollster/dashboard/' + this.value; }" />

    </div> 
</div> 

<script type="text/javascript"> 
    YAHOO.namespace( "com.siventures.js.buttonbar.client" ); 
    YAHOO.com.siventures.js.buttonbar.client = function () {
 
        // "contentready" event handler for the "linkbuttonsfrommarkup" <div> 
        YAHOO.util.Event.onContentReady("linkbuttonsfrommarkup", function() {
            // Create Buttons from existing markup    
            var oLinkButton1 = new YAHOO.widget.Button("linkbutton1");
            var oLinkButton2 = new YAHOO.widget.Button("linkbutton2");
            var oLinkButton3 = new YAHOO.widget.Button("linkbutton3");
            var oLinkButton4 = new YAHOO.widget.Button("linkbutton4");
            var oLinkButton5 = new YAHOO.widget.Button("linkbutton5");
        }); 
    } ();
</script> 
