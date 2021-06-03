<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Ajout Session</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
	  <div class="row">
	    <div class="col">
	    </div>
	    
	    <div class="col">
			<form method="post" action="SessionServlet">
			  <div class="mb-3">
			    <label for="date" class="form-label">Date </label>
			    <input type="text" pattern="(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}" required name="date" class="form-control" id="date" >
			  </div>
			  
			  <div class="mb-3">
			    <label for="formation" class="form-label">Formation </label>
			    <input type="text" required name="formation" class="form-control" id="formation">
			  </div>
			  
			  <div class="mb-3">
			    <label for="duree" class="form-label">Durée </label>
			    <input type="text" required name="duree" class="form-control" id="duree" min="2" max="100">
			  </div>
			   
			  <div class="mb-3">
			  	<button type="submit" class="btn btn-primary">Ajouter session</button>
			  </div>
			  
			  <!-- Afficher le message d'erreur -->
			  <% if(request.getAttribute("erreurSaveSession") != null) { %>
			  	<div class="alert alert-danger" role="alert" >
					<%=request.getAttribute("erreurSaveSession") %>
				</div>
			  <% } %>
			  
			  <!-- Afficher le message de confirmation -->
			  <% if(request.getAttribute("confirmationSaveSession") != null) { %>
			  	<div class="alert alert-success" role="alert" >
					<%=request.getAttribute("confirmationSaveSession") %>
				</div>
			  <% } %>
			  			  
			</form>    
		</div>
		
	    <div class="col">	      
	    </div>
	  </div>
	</div>
</body>
</html>