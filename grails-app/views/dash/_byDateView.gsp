
  <div class="body">
    <h1>
    <!--  TODO: use different icons from freeiconsweb to display rotating mini question mark -->
    <img src=
    "http://t1.gstatic.com/images?q=tbn:L0wlKC5B41TGcM:http://campaignwindow.com/stepheniedodson/uploads/stepheniedodson/VoteButton.gif"
    width="50" height="50" />&nbsp;${fieldValue( bean: campaignInstance, field: "summary")}</h1>

    <g:each in="${campaignInstance.ideas.sort { }}" var="idear">
    <div class="dialog">
      <table>
        <tbody>

          <tr class="prop">
            <td valign="top">
            </td>

            <td valign="top" class="value"><a href="/pollster/ideaboard/${idear.id}">
            <strong>${fieldValue(bean: idear, field: "topic")}</strong></a>&nbsp;&mdash;&nbsp; <a href=
            "mailto:${fieldValue(bean: idear, field: 'ownerInternetAddress')}">email</a>

    <a  href=
    "/pollster/comment/create_for?ideaId=${idear.id}"
    title='Comment/Suggestion' onclick=
    'Modalbox.show(this.href, {title: this.title, width: 450, transitions: false, overlayDuration: 1}); return false;'>
    &nbsp;nudge</a>

            <g:if test="${idear.wikiPage != null}">
	    	&nbsp;&nbsp;<a href="${fieldValue(bean: idear, field: 'wikiPage')}" target="_new">wiki</a>
            </g:if>
	    </td>
          </tr>

          <tr class="prop">
            <td>
              <div class="rounded_colhead">
                <div class="tl"></div>
                <div class="tr"></div>
                <p style="text-align: center;"><font face="Verdana" size="+2">${idear.voteCount()}</font></p>
                <p>&nbsp;</p>
                <p style="text-align: center;"><font face="Verdana" size="-2">votes</font></p>
                <div class="bl"></div>
                <div class="br"></div>
              </div>
	    </td>
            <td valign="top" class="value">${idear.descriptionDotTrim()}</td>
          </tr>

          <g:if test="${idear.comments.size() >= 1}">
          <tr class="prop">
            <td rowspan="1" colspan="3">
            </td>
          </tr>
          </g:if>
        </tbody>
      </table>
    </div>
    </g:each>
  </div>
