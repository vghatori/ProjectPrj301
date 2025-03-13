<%-- 
    Document   : userProfile
    Created on : Mar 11, 2025, 3:29:04 PM
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
        <link rel="icon" type="image/x-icon" href="./Icon/iconmini.ico">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="./model/pagestyle.css">
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
        
        

        <div class="bg-light rounded-3">
            <div class="container py-5 rounded-3">
                <div class="row">
                    <!-- Profile Header -->
                    <div class="col-12 mb-4">   
                        <div class="profile-header position-relative mb-4">
                            <div class="position-absolute top-0 end-0 p-3">
                                <button class="btn btn-light"><a href = "edit"><i class="fas fa-edit me-2"></i>Edit Cover</a></button>
                            </div>
                        </div>
                        <div class="text-center">
                            <div class="position-relative d-inline-block">
                                <img src="./GameImage/user.png" class="rounded-circle profile-pic img-fluid" alt="Profile Picture">
                                <button class="btn btn-primary btn-sm position-absolute bottom-0 end-0 rounded-circle">
                                    <i class="fas fa-camera"></i>
                                </button>
                            </div>
                            <h3 class="mt-3 mb-1">${userdata.username}</h3>                          
                        </div>
                    </div>

                    <!-- Main Content -->
                    <div class="col-12">
                        <div class="card border-0 shadow-sm">
                            <div class="card-body p-0">
                                <div class="row g-0">
                                    <!-- Sidebar -->
                                    <div class="col-lg-3 border-end">
                                        <div class="p-4">
                                            <div class="nav flex-column nav-pills">
                                                <a class="nav-link active" href="userprofile"><i class="fas fa-user me-2"></i>Account</a>
                                                <a class="nav-link" href="favgame"><i class="bi bi-star-fill me-2"></i>Favorites Games</a>                                           
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Content Area -->
                                    <div class="col-lg-9">
                                        <div class="p-4">
                                            <!-- Personal Information -->
                                            <div class="mb-4">
                                                <h5 class="mb-4">Account Information</h5>
                                                <div class="row g-3">
                                                    <div class="col-md-6">
                                                        <label class="form-label">Username</label>
                                                        <input type="text" class="form-control" value="${userdata.username}" disabled>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Password</label>
                                                        <input type="password" class="form-control" value="${userdata.password}" disabled>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Email</label>
                                                        <input type="email" class="form-control" value="${userdata.email}" disabled>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Phone</label>
                                                        <input type="tel" class="form-control" value="0${userdata.phone}" disabled>
                                                    </div>
                                                    <div class="col-12">
                                                        <label class="form-label">Bio</label>
                                                        <textarea class="form-control" rows="4" disabled>Product</textarea>
                                                    </div>
                                                    <p class="text-success ms-5">${updateSuccess}</p>
                                                    <c:remove var="updateSuccess"/>
                                                </div>
                                            </div>

                                            <!-- Settings Cards -->
                                            
                                            <!-- Recent Activity -->
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
