<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "en">
<head>
	<title>Login Here</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/a81368914c.js"></script>
	<link rel="stylesheet" href="styles.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
</head>
<body>
	<div> <input type="hidden" id="status" value="<%= request.getAttribute("status") %>"> </div>
	<img class="wave" src="img/wave.png">
    <div class="nav">
        <div class="logo">
           <h3>Course Management System SUST</h3>
        </div>
        
   </div>
   <div class="container">
	<div class="img">
		<img src="img/bg.svg"> <!--u can use your own buy use vectors file and avoid pngs -->
	</div>
	<div class="login-content">
		<form action="template" method = "post">
			<img src="img/avatar.svg">
			<h2 class="title">Welcome</h2> <!--this is the welcome text-->
			   <div class="input-div one">
				  <div class="i">
						  <i class="fas fa-user"></i>
				  </div>
				  <div class="div">
						  <h5>Username</h5> <!--username sizes-->
						  <input type="text" class="input" name = "username">
				  </div>
			   </div>
			   <div class="input-div pass"> 
				  <div class="i"> 
					   <i class="fas fa-lock"></i>
				  </div>
				  <div class="div">
					   <h5>Password</h5>  <!--joy don't chane the sizes of the texts it will be a mess ! -->
					   <input type="password" class="input" name = "password">
			   </div>
			</div>
			<a href="#">Forgot Password?</a>
			<div class="btn-group">
				<div class="btn-item">
				 <input type="radio" id="student" name="radio" value="student" checked="checked">
				 <label for="student">Student</label>
				</div>
	  
				<div class="btn-item">
				 <input type="radio" id="teacher" name="radio" value="teacher">
				 <label for="teacher">Teacher</label>
				</div>
	  
				<div class="btn-item">
				 <input class = "sir" type="radio" id="admin" name="radio" value="admin">
				 <label for="admin">Admin</label>
				</div>
			  </div>
			<input type="submit" class="btn" value="Login">
			<a style = "text-align: center;padding:10px;text-decoration:none;"class = "btn" href = "signup.jsp" value = "Create Account">Create Account</a>
		</form>
	</div>
</div>
    <script type="text/javascript" src="js/main.js"></script>
    <script type="text/javascript">
		var status = document.getElementById("status").value;
		if(status == "failed"){
			swal("Sorry", "Your Username or Password is Incorrect!", "warning");
		}
		else if(status == "err"){
			swal("Invalid", "Please check radio button!", "warning");
		}
	</script>
</body>
</html>