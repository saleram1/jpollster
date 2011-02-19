<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="nologo" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
  </head>
  <body>
    <div class="body">
      <h1>Describe Your Dilemma</h1>

      <div id="errorContainer" class="errors" style="display: none;">
	<p>Save of the Campaign failed due to the following errors:</p><br/>
      </div>

      <g:form name="campaign2Form" method="post" action="save" useToken="true">
        <div class="dialog">
          <table>
            <tbody>                        
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="name"><g:message code="campaign.name.label" default="ShortName" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: campaignInstance, field: 'name', 'errors')}">
                  <g:textField id="name" name="name" class="required" maxlength="50" size="40" value="${campaignInstance?.name}" />
                </td>
              </tr>

              <tr class="prop">
                <td valign="top" class="name">
                  <label for="summary"><g:message code="campaign.summary.label" default="Summary/Question" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: campaignInstance, field: 'summary', 'errors')}">
		  <g:textArea name="summary" cols="60" rows="1" value="${campaignInstance?.summary}" maxlength="2500" />
                </td>
              </tr>
              
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="isPrivate"><g:message code="campaign.isPrivate.label" default="Private?" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: campaignInstance, field: 'isPrivate', 'errors')}">
                  <g:checkBox name="isPrivate" widget="checkbox" value="${campaignInstance?.isPrivate}" />
                </td>
              </tr>
              
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="isQuestionnaire"><g:message code="campaign.isQuestionnaire.label" default="Questionnaire?" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: campaignInstance, field: 'isQuestionnaire', 'errors')}">
                  <g:checkBox name="isQuestionnaire" widget="checkbox" value="${campaignInstance?.isQuestionnaire}" />
                </td>
              </tr>

              <tr class="prop">
                <td valign="top" class="name">
                  <label for="emailNotify"><g:message code="comment.emailNotify.label" default="Email Notify" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: campaignInstance, field: 'emailNotify', 'errors')}">
                  <g:checkBox name="emailNotify" value="${campaignInstance?.emailNotify}" />
                </td>
              </tr>
	      
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="ownerInternetAddress"><g:message code="campaign.ownerInternetAddress.label" default="Contact Email (for notifications)" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: campaignInstance, field: 'ownerInternetAddress', 'errors')}">
                  <g:textField name="ownerInternetAddress" size="35" value="${ideaInstance?.ownerInternetAddress}" />
                </td>
              </tr>
              
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="openUntilDate"><g:message code="campaign.openUntilDate.label" default="'Open Until' Date" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: campaignInstance, field: 'openUntilDate', 'errors')}">
                  <g:datePicker name="openUntilDate" precision="day" years="${2010..2035}" value="${campaignInstance?.openUntilDate}" noSelection="['': '']" />
                </td>
              </tr>
              
            </tbody>
          </table>
        </div>
        <div class="buttons">
          <span class="button"><input type="button" name="create" class="save" onclick="if (!(document.getElementById('name').value === '' || document.getElementById('summary').value === '')) { document.forms[0].submit(); }" value="Create" />
	  </span>
        </div>
      </g:form>
    </div>
  </body>
</html>
