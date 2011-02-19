<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'campaign.label', default: 'Campaign')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
			<span class="menuButton">
				<a href=
				"/pollster/campaign/create2" title="StartIT" onclick=
				"Modalbox.show(this.href, {title: this.title, width: 650, transitions: false, overlayDuration: 1}); return false;">
				New Campaign</a>
			</span>
			<span class="menuButton"><g:link controller="blurb" action="list">Show Feedback</g:link></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'campaign.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'campaign.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="summary" title="${message(code: 'campaign.summary.label', default: 'Summary')}" />
                        
                            <g:sortableColumn property="isPrivate" title="${message(code: 'campaign.isPrivate.label', default: 'Is Private')}" />
                        
                            <g:sortableColumn property="isQuestionnaire" title="${message(code: 'campaign.isQuestionnaire.label', default: 'Is Questionnaire')}" />
                        
                            <g:sortableColumn property="openUntilDate" title="${message(code: 'campaign.openUntilDate.label', default: 'Open Until Date')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${campaignInstanceList}" status="i" var="campaignInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${campaignInstance.id}">${fieldValue(bean: campaignInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: campaignInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: campaignInstance, field: "summary")}</td>
                        
                            <td><g:formatBoolean boolean="${campaignInstance.isPrivate}" /></td>
                        
                            <td><g:formatBoolean boolean="${campaignInstance.isQuestionnaire}" /></td>
                        
                            <td><g:formatDate date="${campaignInstance.openUntilDate}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${campaignInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
