

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'comment.label', default: 'Comment')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'comment.id.label', default: 'Id')}" />
                        
                            <th><g:message code="comment.theIdea.label" default="The Idea" /></th>
                   	    
                            <g:sortableColumn property="author" title="${message(code: 'comment.author.label', default: 'Author')}" />
                        
                            <g:sortableColumn property="status" title="${message(code: 'comment.status.label', default: 'Status')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'comment.description.label', default: 'Description')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${commentInstanceList}" status="i" var="commentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${commentInstance.id}">${fieldValue(bean: commentInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: commentInstance, field: "theIdea")}</td>
                        
                            <td>${fieldValue(bean: commentInstance, field: "author")}</td>
                        
                            <td>${fieldValue(bean: commentInstance, field: "status")}</td>
                        
                            <td>${fieldValue(bean: commentInstance, field: "description")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${commentInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
