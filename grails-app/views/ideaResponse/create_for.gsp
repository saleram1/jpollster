
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="nologo" />
        <g:set var="entityName" value="${message(code: 'ideaResponse.label', default: 'IdeaResponse')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1>Yes!Yes!  Refine Your Idea</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${ideaInstance}">
            <div class="errors">
                <g:renderErrors bean="${ideaInstance}" as="list" />
            </div>
            </g:hasErrors>

            <g:form action="save" method="post" useToken="true">
       	      <g:hiddenField name="referredBy" value="${ideaResponseInstance?.referredBy}"/>
       	      <g:hiddenField name="parentIdeaId" value="${ideaResponseInstance?.parentIdeaId}"/>
	      
              <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="topic"><g:message code="ideaResponse.topic.label" default="Summary" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ideaResponseInstance, field: 'topic', 'errors')}">
                                    <g:textField name="topic" value="${ideaResponseInstance?.topic}" size="50" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="ideaResponse.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ideaResponseInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" cols="40" rows="5" value="${ideaResponseInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ownerInternetAddress"><g:message code="ideaResponse.ownerInternetAddress.label" default="Contact Email (optional)" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ideaResponseInstance, field: 'ownerInternetAddress', 'errors')}">
                                    <g:textField name="ownerInternetAddress" value="${ideaResponseInstance?.ownerInternetAddress}" size="40" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create_for" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
