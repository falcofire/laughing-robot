<%@ include file="/WEB-INF/jsp/include.jsp" %>
<html>
  <head><title>Hello :: Spring Application</title>
	  <script type="text/javascript">
	  	$(document).ready(function() {
		  	//Get URL
		  	var url = window.location.href;
		  	//Get div
		  	var error = document.getElementById('errorDiv')
		  	if (url.search("error") >= 0){
		  		error.style.display = "block";
		  	}
		  	var logout = document.getElementById('logoutDiv');
		  	if (url.search("logout") >= 0){
		  		logout.style.display = "block";
		  	}
	  	});
	  </script>
  </head>
  <body>
  	<div class="landing">
		<div class="container-fluid">
			<div class="welcome-jumbotron">
				<h1 class="text-right">Laughing | Robot</h1>
				<h3 class="text-right">v1.0</h3>
			</div>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<div class="welcome-jumbotron">
				<div class="form-group col-md-3 col-md-offset-6 col-sm-4 col-sm-offset-4">
					<h1 class="text-left">Login</h1>
				</div>
			</div>
			<div>
				<div class="form-group col-md-3 col-md-offset-6 col-sm-4 col-sm-offset-4">
					<form name="f" c:url="/login" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<input type="hidden" name=error value=${param.error} />
					<input type="hidden" name=logout value=${param.logout} />
						<fieldset>
							<div class="alert alert-warning" id=errorDiv style="display:none;">    
			                    Invalid username and password.
			                </div>
		                	<div class="alert alert-success" id=logoutDiv style="display:none;"> 
                   			You have been logged out.
               				</div>
							<div class="form-group">
							    <input type="text" id=username name=username placeholder="Username" class="form-control input-lg">
						    </div>
						    <div class="form-group">
						    	<input type="password" id=password name=password placeholder="Password" class="form-control input-lg">
						    </div>
						    <div class="form-actions">
                    			<button type="submit" class="btn">Log in</button>
                			</div>
					    </fieldset>
				    </form>
			    </div>
		    </div>
	    </div>
    </div>
  </body>
</html>