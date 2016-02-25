<%@ include file="/WEB-INF/jsp/include.jsp" %>
<html>
  <head><title>Hello :: Spring Application</title></head>
  <body>
  	<div class="container-fluid">
  		<div class="welcome-jumbotron" id="welcome-jumbotron">
		    <button type="button" class="btn btn-primary btn-lg">Hello - Spring Application</button>
		    <p>Greetings, it is now <c:out value="${now}"/></p>
	    </div>
    </div>
  </body>
</html>