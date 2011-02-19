<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="nologo" />
        <g:set var="entityName" value="${message(code: 'comment.label', default: 'Comment')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1>Enter your Comments</h1>

            <g:form controller="comment" action="save" method="post" useToken="true" >
                <div class="dialog">
                    <table>
                        <tbody>
                            <g:hiddenField name="theIdea.id" value="${commentInstance?.theIdea?.id}" />
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="author"><g:message code="comment.author.label" default="Author" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: commentInstance, field: 'author', 'errors')}">
<!-- set this READONLY - or use the Acegi security tag  to see who is logged in -->
                                    <g:textField name="author" value="${commentInstance?.author}" />
                                </td>
                            </tr>

                            <g:hiddenField name="status" value="${commentInstance?.status}" />
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="comment.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: commentInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" cols="40" rows="5" value="${commentInstance?.description}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
              			  <g:hiddenField name="referredBy" value="${commentInstance?.referredBy}" />
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
