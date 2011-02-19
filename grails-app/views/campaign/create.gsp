

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'campaign.label', default: 'Campaign')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${campaignInstance}">
            <div class="errors">
                <g:renderErrors bean="${campaignInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" useToken="true">
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
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
