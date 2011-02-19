<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="nologo" />
    <g:set var="entityName" value="${message(code: 'idea.label', default: 'Idea')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
  </head>

  <body>
    <div class="body">
      <h1>Describe Your Idea</h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>

      <div id="errorContainer" class="errors" style="display: none;">
	<p>Form contains the following errors:</p><br/>
        <g:renderErrors bean="${campaignInstance}" as="list" />
      </div>

      <g:form action="save" method="post" useToken="true">
	<div id="welcome"> 
	  <p class="textilish">Don't be shy! Tell us what's on your mind.</p> 
	</div>
        <div class="dialog">
          <table>
            <tbody>
	      <g:hiddenField name="referredBy" value="${ideaInstance?.referredBy}"/>
	      
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="topic"><g:message code="idea.topic.label" default="Summary" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: ideaInstance, field: 'topic', 'errors')}">
                  <g:textField name="topic" value="${ideaInstance?.topic}" size="50" />
		  <g:hiddenField name="theCampaign.id" value="${ideaInstance?.theCampaign?.id}" />
                </td>
              </tr>
              
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="description"><g:message code="idea.description.label" default="Description (optional)" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: ideaInstance, field: 'description', 'errors')}">
                  <g:textArea name="description" cols="40" rows="5" value="${ideaInstance?.description}" />
                </td>
              </tr>
	      
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="ownerInternetAddress"><g:message code="idea.ownerInternetAddress.label" default="Contact Email (optional)" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: ideaInstance, field: 'ownerInternetAddress', 'errors')}">
                  <g:textField name="ownerInternetAddress" value="${ideaInstance?.ownerInternetAddress}" size="40" />
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="buttons">
          <span class="button">
	    <input type="button" name="create" class="save" onclick="if (!(document.getElementById('topic').value === '')) { document.forms[0].submit(); }" value="Create" />
	  </span>
        </div>
      </g:form>
    </div>
  </body>
</html>
