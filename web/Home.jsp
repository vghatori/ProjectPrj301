<%-- 
    Document   : Home
    Created on : Mar 11, 2025, 3:15:43 PM
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="./model/style.css">   
    
</head>
<body>
  <!-- thanh điều hướng -->
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
      <!-- thẻ chứa game -->
      
      <div class = "container rounded-3 gamecontainer">
      <!-- carousel - ảnh giới thiệu game  -->

      <div class = "container-fluid carousel slide carousel-dark slide carousel-fade  border-top mt-3 border-black border-3 w-90 border-3" id="carouselbt">
        <!--  -->
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselbt" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#carouselbt" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#carouselbt" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <!--  -->
          <div class="carousel-inner">
          <!--  -->
          <div class="carousel-item active">
            <a href="">
            <img src="./GameImage/dyinglie.jpg" alt="" class="img-fluid d-block border rounded-3">
            </a>
          </div>
          <!--  -->
          <div class="carousel-item">
            <a href="">
            <img src="./GameImage/enshrounded.png" alt="" class="img-fluid d-block border rounded-3">
            </a>
          </div>
          <!--  -->
          <div class="carousel-item">
            <a href="">
            <img src="./GameImage/Sims.png" alt="" class="img-fluid d-block border rounded-3">
            </a>
          </div>
          <!--  -->
        </div>
        <button class = "carousel-control-prev" type = "button" data-bs-target="#carouselbt" data-bs-slide ="prev">
          <span class = "carousel-control-prev-icon"  aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>

        <button class = "carousel-control-next" type = "button" data-bs-target="#carouselbt" data-bs-slide ="next">
          <span class = "carousel-control-next-icon"  aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>        
      </div>
      
    


       <!-- thẻ game hot -->    
       <div class="container border-top border-bottom pb-5 pt-3 border-black border-3 ">
        <h3 style = "border-bottom: solid;" class = "d-inline-block pb-2 px-2 border-4">Game Hot</h3>
        <div class="row">
            <!--  -->
            <div class="col-md-4 border-end border-black border-3">
                <div class="card h-100">
                    <c:set var ="c" value="${edldenring}"/>
                    <img src="${edldenring.image}" class="card-img-top" alt="Ghost of Tsushima">
                    <div class="card-body">
                        <h2 class="card-title">${edldenring.title}</h2>
                        <p class="card-text overflow-y-hidden" style ="max-height:100px;">Info of game ${edldenring.description}...</p>
                        <a href="page?name=${edldenring.title}" class="btn btn-danger" style="margin-top:10px; margin-left:100px">Download</a>
                    </div>
                </div>
            </div>

            <!--  -->
            <div class="col-md-8">
                <div class="list-group overflow-y-scroll" style ="max-height:465px;">
                    <c:forEach items ="${allgamelistforhome}" var = "c" begin ="10" end ="20">
                        <a href="page?name=${c.title}" class="list-group-item list-group-item-action d-flex align-items-center mb-3 rounded-3">
                            <img src="${c.image}" class="me-3 rounded-3" width="60" height="60" alt="Dragon Age">
                            <div>
                                <h5 class="mb-1">${c.title}</h5>
                                <small>Giới thiệu game ${c.title}...</small>
                            </div>
                        </a>
                    </c:forEach>
                    <!--  -->
                    
                </div>
            </div>
        </div>
    </div>
      <!-- Game hiện tại -->
      <div class="container border-bottom pb-5 pt-3 border-black border-3 ">
        <!-- header -->
        <div class="d-flex">
            <h3 style = "border-bottom: solid;" class = "d-inline-block pb-2 px-2 border-4">Current Game</h3>
            <h3 class="text-success ms-4">${addfavgamemess}</h3>
            <h3 class="text-danger ms-4">${adderrfavgamemess}</h3>
        </div>
        <c:remove var="adderrfavgamemess"/>
        <c:remove var="addfavgamemess"/>
        <!--  -->
        <div class="container text-center">
          <div class="row row-cols-3" >
            <!--  -->
            <c:forEach var = "c" items="${gamelistforhome}">
                <div class="card dm" style="width: 18rem; max-height: 370px">
                <img src="${c.image}" class="img-fluid card-img-top mt-2 rounded-3" style = "height: 147px;" alt="...">
                    <div class="card-body">
                      <div class ="row" style = "height: 140px;">
                            <h5 class="card-title">${c.title}</h5>
                            <p class="card-text overflow-y-hidden" style = "height:50px;">${c.description}</p>
                      </div>
                      <div class = "row">
                          <div class ="col"><a href="page?name=${c.title}" class="btn btn-primary">Download</a></div>
                          <div class ="col">
                              <form action="addfavgame" method = "post">
                                  <button name="addbutton" value ="${c.gameid}" class="btn btn-outline-primary"><i class="bi bi-heart-fill"></i></button>
                              </form>
                          </div>
                      </div>
                    </div>
              </div>
            </c:forEach>
           
          </div>
        </div>
      </div>
      <!-- thanh chuyển trang  -->

      <nav aria-label="Page navigation example" class="mt-3">
        <ul class="pagination">
            <c:if test = "${PNindex > 1}">
               <li class="page-item active"><a class="page-link" href="home?pagenum=${PNindex - 1}">Previous</a></li>
            </c:if>
            
          <c:forEach var = "i" begin="1" end="${totalnumpage}">
            <li class="page-item active"><a class="page-link" href="home?pagenum=${i}">${i}</a></li>
          </c:forEach>
            <c:if test = "${PNindex < totalnumpage}">
                <li class="page-item active"><a class="page-link" href="home?pagenum=${PNindex + 1}">Next</a></li>
            </c:if>
        </ul>
      </nav>
      <!-- footer -->
      <div class="card w-100 ">     
        <div class="card-body">
          <h5 class="card-title">Special title treatment</h5>
          <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
      </div>
      
    </div>

</body>
</html>