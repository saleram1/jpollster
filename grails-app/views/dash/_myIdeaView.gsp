
  <div class="body">
    <h1>
    <img src=
    "http://t1.gstatic.com/images?q=tbn:L0wlKC5B41TGcM:http://campaignwindow.com/stepheniedodson/uploads/stepheniedodson/VoteButton.gif"
    width="50" height="50" />&nbsp;${ideaInstance?.theCampaign?.summary}
    </h1>

    <div class="dialog">
      <table>
        <tbody>
          <tr class="ideasummary">
            <td valign="top">
            </td>

            <td valign="top" class="value">
            <strong>${fieldValue(bean: ideaInstance, field: "topic")}</strong>&nbsp;&mdash;&nbsp; <a href=
            "mailto:${fieldValue(bean: ideaInstance, field: 'ownerInternetAddress')}">email</a>
	    </td>
          </tr>

          <tr class="prop">
            <td>
              <div class="rounded_colhead">
                <div class="tl"></div>
                <div class="tr"></div>
                <p style="text-align: center;"><font face="Verdana" size="+2">${ideaInstance.voteCount()}</font></p>
                <p>&nbsp;</p>
                <p style="text-align: center;"><font face="Verdana" size="-2">votes</font></p>
                <div class="bl"></div>
                <div class="br"></div>
              </div>
	    </td>

<g:if test="${ideaInstance.description2 != null}">
            <td valign="top" class="value"><span><%=ideaInstance.description2 %></span></td>
</g:if>
<g:else>
            <td valign="top" class="value">${ideaInstance.description}</td>
</g:else>
          </tr>

          <g:if test="${ideaInstance?.comments?.size() >= 1}">
          <tr class="prop">
            <td rowspan="1" colspan="3">

<div class="yui-cms-accordion multiple fade fixIE">
    <div class="yui-cms-item yui-panel selected">
       <div class="hd">Comments (${ideaInstance.comments.size()})</div>

	    <g:each in="${ideaInstance.comments.sort { it.dateCreated }}" var="c">
            <div class="bd"> 
              <div class="fixed"> 
      	           <p>${c.encodeAsHTML()}</p>
              </div> 
            </div> 
	    </g:each>

            <div class="actions">
    	       <a href="#" class="accordionToggleItem">&nbsp;</a>
   	     </div>
    </div>
</div>
	</td>
	  </tr>
	  </g:if>

          <tr class="prop">
            <td rowspan="1" colspan="3">&nbsp;</td>
          </tr>
        </tbody>
      </table>

    </div><!-- end dialog -->
  </div><!--   end body   -->
