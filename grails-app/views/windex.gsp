<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title>Welcome to Grails - with BluePrint Styles</title>
  </head>
  <body>
    <div class="container showgrid">

      <div class="span-8 last">
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Campaign</g:link></span>
        </div>
      </div>

      <div class="span-8 last"><!-- spacer -->
	<p>&nbsp;</p>
      </div>

      <div class="column span-8 last">
	<h3>Wonderful World Campaign</h3>
      </div>

      <div class="column span-2">
	Left Navigation
	<ul>
	  <li>One</li>
	  <li>Two</li>
	  <li>Threesome</li>
	</ul>
      </div>
      
      <div class="column span-6 last">
	<div class="column span-1">
	  <p>Votes: 4</p>
	</div>      
	<div class="column span-5 last">
	  Main content
	</div>      
      </div>      
    </div>
  </body>
</html>
