<%@ include file="/WEB-INF/jsp/include.jsp" %>
<html xmlns:th="http://www.thymeleaf.org" xmlns:tiles="http://www.thymeleaf.org">
  	<head><title>Laughing Robot</title>
  	<script>
		$(document).ready(function() {
	    $('ul.nav.navbar-nav').find('a[href="' + location.pathname + '"]')
	        .closest('li').addClass('active');
	});
  	</script>
  	</head>
  	<body>
	  	<div class="landing">
			<div class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					        <span class="sr-only">Toggle navigation</span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
				      	</button>
			      	</div>
			      	<div class="collapse navbar-collapse">
			      		<c:url var="logoutUrl" value="/logout"/>
						<form class="navbar-form pull-right" action="${logoutUrl}" method="post">
							<input type="submit" value="Logout" class="btn"/>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</form>
			      		<ul class="nav navbar-nav navbar-right">
			      			<li role="presentation"><a href="/laughing-robot/home">Home</a></li>
							<li role="presentation" style="padding-right:15px;"><a href="/laughing-robot/admin">Admin Console</a></li>
			      		</ul>
			      		
						<!-- <div class="page-header">
							<div align="right" style="vertical-align:middle;">
								<c:url var="logoutUrl" value="/logout"/>
								<form action="${logoutUrl}" method="post">
								  	<div class="form-actions">
		                   				<button type="submit" class="btn">Log out</button>
		              				  	</div>
								  	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								</form>
							</div>
						</div> -->
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
