<%-- 
    Document   : cateResult
    Created on : Mar 11, 2025, 3:28:53 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="icon" type="image/x-icon" href="./Icon/iconmini.ico">
        <link rel="stylesheet" href="./model/searchstyle.css">  
        <title>Ditch.io</title>
    </head>
    <body>
        <nav class="n navbar navbar-expand-lg">
        <div class="container-fluid">
          <a class="navbar-brand" href="home    ">Ditch.io</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-3 rounded-3 mb-lg-0">
              <li class="nav-item active">
                <a class="nav-link active" aria-current="page" href="home">Home</a>
              </li>                 
              <c:if test="${userdata != null}">
                <li class="nav-item active">
                  <a class="nav-link active" aria-disabled="true">Hello ${userdata.username}</a>
                </li>
                <li class="nav-item active">
                  <a class="nav-link active" href="userprofile" aria-disabled="true">Profile</a>
                </li>
                <li class="nav-item active">
                  <a class="nav-link active" href="logout?tag=home" aria-disabled="true">Logout</a>
                </li>
              </c:if>
              <c:if test="${userdata == null}">
                <li class="nav-item active">
                    <a class="nav-link active" href="login" aria-disabled="true">Login/Register</a>
                </li>
              </c:if>              
              
              
              <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                      Genre
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <c:forEach var ="c" items="${catelist}">
                           <a class="dropdown-item" href="catesearch">${c.catetitle}</a>  
                        </c:forEach>
                    </div>
                </li>
            </ul>
            <form class="d-flex" role="search" action="search?pagenum=1" method = "post">
              <button class="btn btn-outline-light bg-light text-secondary" type="submit"><i class="bi bi-search"></i></button>
              <input class="form-control me-2" name = "searchinput" type="search" placeholder="Search" aria-label="Search">             
            </form>
          </div>
        </div>
      </nav>
        
        <!-- comment -->  
        <h1>search result for </h1>
        
        <div class="container text-center w-90 h-90 border-top border-bottom  border-black border-4">
          <div class="row row-cols-3 justify-content-center align-items-center gap-3 mt-3 mb-3" >
            <!--  -->
            <c:forEach begin="1" end="12">
                <div class="card dm" style="width: 18rem;">
                <img src="./GameImage/dyinglie.jpg" class="card-img-top mt-2 rounded-3" alt="...">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <div class = "row">
                          <div class ="col"><a href="page" class="btn btn-primary">Download</a></div>
                          <div class ="col"><a href="page" class="btn btn-outline-primary"><i class="bi bi-heart-fill"></i></a></div>
                      </div>
                    </div>
              </div>
            </c:forEach>          
          </div>
        </div>
    </body>
</html>
