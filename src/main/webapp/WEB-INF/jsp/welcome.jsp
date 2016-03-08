<%@ include file="/WEB-INF/jsp/include.jsp" %>
<html xmlns:th="http://www.thymeleaf.org" xmlns:tiles="http://www.thymeleaf.org">
  	<head><title>Laughing Robot</title>
  	<script>
		$(document).ready(function() {
	    $('ul.nav.navbar-nav').find('a[href="' + location.pathname + '"]')
	        .closest('li').addClass('active');
	        
		  	//Get URL
		  	var url = window.location.href;
		  	if (url.search("accessDenied") >= 0){
		  		$('#accessDenied').modal();
		  	}
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
					</div>
					<div id="accessDenied" class="modal fade" role="dialog">
						<div class="modal-dialog">
					
						    <!-- Modal content-->
						    <div class="modal-content">
						    	<div class="modal-header">
						        	<button type="button" class="close" data-dismiss="modal">&times;</button>
						        	<h4 class="modal-title">Access Denied</h4>
						      	</div>
						      	<div class="modal-body">
						        	<p>You do not have permission to access that page.</p>
						      	</div>
						      	<div class="modal-footer">
						        	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						      	</div>
					    	</div>
					
					  	</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
