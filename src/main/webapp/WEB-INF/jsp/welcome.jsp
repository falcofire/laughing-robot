<%@ include file="/WEB-INF/jsp/include.jsp" %>
<html xmlns:th="http://www.thymeleaf.org" xmlns:tiles="http://www.thymeleaf.org">
  	<head><title>Laughing Robot</title>
  	</head>
  	<body>
	  	<div class="landing">
			<div class="container-fluid">
					<div class="page-header">
						<div align="right" style="vertical-align:middle;">
							<c:url var="logoutUrl" value="/logout"/>
							<form action="${logoutUrl}" method="post">
							  <input type="submit" value="Logout" />
							  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							</form>
						</div>
					</div>
				</div>
			</div>
	</body>
</html>
