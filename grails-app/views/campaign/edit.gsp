

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'campaign.label', default: 'Campaign')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${campaignInstance}">
            <div class="errors">
                <g:renderErrors bean="${campaignInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" useToken="true">
                <g:hiddenField name="id" value="${campaignInstance?.id}" />
                <g:hiddenField name="version" value="${campaignInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="campaign.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: campaignInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" maxlength="50" value="${campaignInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="summary"><g:message code="campaign.summary.label" default="Summary" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: campaignInstance, field: 'summary', 'errors')}">
                                    <g:textField name="summary" maxlength="250" value="${campaignInstance?.summary}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="isPrivate"><g:message code="campaign.isPrivate.label" default="Is Private" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: campaignInstance, field: 'isPrivate', 'errors')}">
                                    <g:checkBox name="isPrivate" widget="checkbox" value="${campaignInstance?.isPrivate}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="isQuestionnaire"><g:message code="campaign.isQuestionnaire.label" default="Is Questionnaire" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: campaignInstance, field: 'isQuestionnaire', 'errors')}">
                                    <g:checkBox name="isQuestionnaire" widget="checkbox" value="${campaignInstance?.isQuestionnaire}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="openUntilDate"><g:message code="campaign.openUntilDate.label" default="Open Until Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: campaignInstance, field: 'openUntilDate', 'errors')}">
                                    <g:datePicker name="openUntilDate" precision="day" value="${campaignInstance?.openUntilDate}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ideas"><g:message code="campaign.ideas.label" default="Ideas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: campaignInstance, field: 'ideas', 'errors')}">
                                    
<ul>
<g:each in="${campaignInstance?.ideas?}" var="i">
    <li><g:link controller="idea" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="idea" action="create" params="['campaign.id': campaignInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'idea.label', default: 'Idea')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
