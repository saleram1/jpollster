<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'idea.label', default: 'Idea')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1>New Idea</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${ideaInstance}">
            <div class="errors">
                <g:renderErrors bean="${ideaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" useToken="true">
  <div id="welcome"> 
    <p class="textilish">Don't be shy! Tell us what's on your mind.</p> 
  </div>
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
                                    <label for="topic"><g:message code="idea.topic.label" default="Topic" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ideaInstance, field: 'topic', 'errors')}">
                                    <g:textField name="topic" value="${ideaInstance?.topic}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="idea.description.label" default="Description:" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ideaInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" cols="40" rows="5" value="${ideaInstance?.description}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ownerInternetAddress"><g:message code="idea.ownerInternetAddress.label" default="Owner Email Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ideaInstance, field: 'ownerInternetAddress', 'errors')}">
                                    <g:textField name="ownerInternetAddress" value="${ideaInstance?.ownerInternetAddress}" />
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
