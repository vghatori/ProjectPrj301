<%-- 
    Document   : Register
    Created on : Mar 11, 2025, 3:28:28 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ditch.io</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="icon" type="image/x-icon" href="./Icon/iconmini.ico">
        <link rel="stylesheet" href="./model/loginstyle.css"> 
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <title>Ditch.io</title>
    </head>
    <body>
        
        
        <div class="d-flex justify-content-center mt-4"><h1>Login/Register</h1></div>
        
        <form action="register" method = "post" style="width: 35%;" class ="form-register border p-5 mt-5 border-5 rounded-3">
            <div class ="row">  
                <div class="col text-center"><h1>Register</h1></div>
                <div class="col text-center"><h1><a class = "text-primary" href="home" style ="text-decoration: unset;">Home</a></h1></div>
            </div>
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Email address</label>
                <input type="email" name="emailregister" class="form-control rounded-5" id="exampleInputEmail1" aria-describedby="emailHelp">
                <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
            </div>
            <div class="mb-3">
                <label for="exampleInputUser" class="form-label">Username</label>
                <input type="text" name="usernameregister" class="form-control rounded-5" placeholder="Username" id="exampleInputUser" aria-label="Username" aria-describedby="basic-addon1">
            </div> 
            <div class="mb-3">
                <label for="exampleInputPhone" class="form-label">Phonenumber</label>
                <input type="text" name="phoneregister" class="form-control rounded-5" placeholder="Phonenumber" id="exampleInputPhone" aria-label="Phonenumber" aria-describedby="basic-addon1">
            </div>
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Password</label>
                <input type="password" name="passregister" class="form-control rounded-5" id="exampleInputPassword1">
            </div>  
            <p class ="text-danger">${regisErr}</p>
            <c:remove var ="regisErr"/>
            <button type="submit" class="btn btn-outline-info w-100 rounded-5 text-dark ">Register</button>
            <div class="d-flex justify-content-evenly">
                <p> Have account ? </p>
                <a href="login" class = "loginlink">Login</a>
            </div>
        </form>
    </body>
</html>
