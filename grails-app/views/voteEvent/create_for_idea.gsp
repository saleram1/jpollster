
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="nologo" />
        <g:set var="entityName" value="${message(code: 'voteEvent.label', default: 'VoteEvent')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1>Select Idea and Number of Votes</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>

            <g:form controller="voteEvent" action="save" method="post" useToken="true">
                <div class="dialog">
                    <table>
                        <tbody>                                                
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="theIdea"><g:message code="voteEvent.theIdea.label" default="Choose Idea" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: voteEventInstance, field: 'theIdea', 'errors')}">
                                    <g:select name="theIdea.id" from="${voteEventInstance?.theIdea?.offspring.sort { it.topic }}" optionKey="id" value="${voteEventInstance?.theIdea?.id}"  />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="author"><g:message code="voteEvent.author.label" default="Voter" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: voteEventInstance, field: 'author', 'errors')}">
                                    <g:textField name="author" size="10" readonly="READONLY" value="${voteEventInstance?.author}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="votesToSpend"><g:message code="voteEvent.votesToSpend.label" default="Votes To Spend" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: voteEventInstance, field: 'votesToSpend', 'errors')}">
                                    <g:select name="votesToSpend" from="${voteEventInstance.constraints.votesToSpend.inList}" value="${voteEventInstance?.votesToSpend}" valueMessagePrefix="voteEvent.votesToSpend"  />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Vote')}" /></span>
                </div>
              	<g:hiddenField name="referredBy" value="${voteEventInstance?.referredBy}" />
            </g:form>
        </div>
    </body>
</html>
