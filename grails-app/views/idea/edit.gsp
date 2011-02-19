<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'idea.label', default: 'Idea')}" />
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
            <g:hasErrors bean="${ideaInstance}">
            <div class="errors">
                <g:renderErrors bean="${ideaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" useToken="true">
                <g:hiddenField name="id" value="${ideaInstance?.id}" />
                <g:hiddenField name="version" value="${ideaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="theCampaign"><g:message code="idea.theCampaign.label" default="The Campaign" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ideaInstance, field: 'theCampaign', 'errors')}">
                                    <g:select name="theCampaign.id" from="${Campaign.list()}" optionKey="id" value="${ideaInstance?.theCampaign?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ownerInternetAddress"><g:message code="idea.ownerInternetAddress.label" default="Owner Internet Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ideaInstance, field: 'ownerInternetAddress', 'errors')}">
                                    <g:textField name="ownerInternetAddress" value="${ideaInstance?.ownerInternetAddress}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="topic"><g:message code="idea.topic.label" default="Topic" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ideaInstance, field: 'topic', 'errors')}">
                                    <g:textField name="topic" value="${ideaInstance?.topic}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="idea.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ideaInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" cols="40" rows="5" value="${ideaInstance?.description}" />
                                </td>
                            </tr>

			    <tr class="prop">
			      <td valign="top" class="name">
				<label for="wikiPage"><g:message code="idea.wikiPage.label" default="More Info" /></label>
			      </td>
			      <td valign="top" class="value ${hasErrors(bean: ideaInstance, field: 'wikiPage', 'errors')}">
				<g:textField name="wikiPage" size="40" value="${ideaInstance?.wikiPage}" />
			      </td>
			    </tr>

			    <g:hiddenField name="referredBy" value="${ideaInstance?.referredBy}" />

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="comments"><g:message code="idea.comments.label" default="Comments" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ideaInstance, field: 'comments', 'errors')}">
                                    
<ul>
<g:each in="${ideaInstance?.comments?}" var="c">
    <li><g:link controller="comment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="comment" action="create" params="['idea.id': ideaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'comment.label', default: 'Comment')])}</g:link>

                                </td>
                            </tr>                      
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="votes"><g:message code="idea.votes.label" default="Votes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ideaInstance, field: 'votes', 'errors')}">
                                    
<ul>
<g:each in="${ideaInstance?.votes?}" var="v">
    <li><g:link controller="voteEvent" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="voteEvent" action="create" params="['idea.id': ideaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'voteEvent.label', default: 'VoteEvent')])}</g:link>

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
