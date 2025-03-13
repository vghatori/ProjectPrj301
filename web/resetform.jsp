<%-- 
    Document   : resetform
    Created on : Mar 13, 2025, 9:33:58 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ditch.io</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <link rel="icon" type="image/x-icon" href="./Icon/iconmini.ico">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="./model/loginstyle.css">   
    
    <title>Ditch.io</title>
</head>
<body class = "d-flex flex-column">
    
    
    <div class="d-flex justify-content-center mt-4"><h1>Forgot password</h1></div>
    <!-- login form -->
    
        
        <form action="reset" method = "POST" style="width: 35%;" class="form-login border p-5 mt-5 border-5 rounded-3">
            <div class ="row d-flex flex-column">  
                <div class="col text-center mb-3"><h1><a style ="text-decoration: unset;" class = "text-primary" href="home">Home</a></h1></div>
                <div class="col text-center mt-1"><h5 class ="text-success">Carefully don't forget your's password again!</h5></div>               
            </div>
              <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Enter new Password</label>
                <input type="text"  name="passreset" class="form-control rounded-5" id="exampleInputPassword1">
              </div>
              <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Re-enter new Password</label>
                <input type="text" name="repassreset" class="form-control rounded-5" id="exampleInputPassword1">
              </div>
              <button type="submit" class="btn btn-outline-info w-100 rounded-5 text-dark">Reset Password</button>             
        </form>
        <!-- register form -->
        
        
           
    <script src ="/Script/loginScript.js"></script>
</body>
</html>