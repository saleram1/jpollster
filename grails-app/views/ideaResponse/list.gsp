

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ideaResponse.label', default: 'IdeaResponse')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'ideaResponse.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="topic" title="${message(code: 'ideaResponse.topic.label', default: 'Topic')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'ideaResponse.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="ownerInternetAddress" title="${message(code: 'ideaResponse.ownerInternetAddress.label', default: 'Owner Internet Address')}" />
                        
                            <g:sortableColumn property="referredBy" title="${message(code: 'ideaResponse.referredBy.label', default: 'Referred By')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'ideaResponse.dateCreated.label', default: 'Date Created')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ideaResponseInstanceList}" status="i" var="ideaResponseInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${ideaResponseInstance.id}">${fieldValue(bean: ideaResponseInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: ideaResponseInstance, field: "topic")}</td>
                        
                            <td>${fieldValue(bean: ideaResponseInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: ideaResponseInstance, field: "ownerInternetAddress")}</td>
                        
                            <td>${fieldValue(bean: ideaResponseInstance, field: "referredBy")}</td>
                        
                            <td><g:formatDate date="${ideaResponseInstance.dateCreated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ideaResponseInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
