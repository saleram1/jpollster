
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="nologo" />
        <g:set var="entityName" value="${message(code: 'comment.label', default: 'Comment')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h3>Regarding ${commentInstance?.theIdea?.topic?.encodeAsHTML()} &hellip;</h3>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comment.author.label" default="Author:" /></td>                            
                            <td valign="top" class="value">${fieldValue(bean: commentInstance, field: "author")}</td>                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comment.status.label" default="Status" /></td>                            
                            <td valign="top" class="value">${fieldValue(bean: commentInstance, field: "status")}</td>                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comment.emailNotify.label" default="Email Notifications:" /></td>                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${commentInstance?.emailNotify}" /></td>                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comment.description.label" default="Description:" /></td>                            
                            <td valign="top" class="value">${fieldValue(bean: commentInstance, field: "description")}</td>                            
                        </tr>                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${commentInstance?.id}" />
                </g:form>
            </div>
        </div>
    </body>
</html>
