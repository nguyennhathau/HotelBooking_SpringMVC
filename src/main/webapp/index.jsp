<%-- 
    Document   : index
    Created on : Dec 14, 2017, 9:44:07 PM
    Author     : viet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">   
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/animate.min.css">     
        
    
        <style>
          .form-booking{
                position: absolute;
                top: 70px;
                width: 60%;
                left: 20%;
                height: 86px;
                box-sizing: border-box;
                background: rgba(0,0,0,0.5);
                padding: 25px;
            }
            .form-booking p,span{
                color: #FFC107;
                text-transform: uppercase;
            }
            .form-booking input[type=date]{
                
                width: 150px;
                border: none;
                border-radius: 0;
                margin-left: 10px;
                margin-right: 15px;
            }
            
            .form-booking select {
                width: 50px;
                margin-left: 10px;
            }
            .form-booking input[type=submit]{
                width: 250px;
                
                margin: 0 auto;
                text-align: center;
            }
            /*rooms*/
            .rooms{
                /*border: 1px solid red;*/
                padding: 80px 0 80px;
                text-align: center;
            }
            .rooms h2{
                font-size: 30px;
                color: #4c4c4c;
                margin: 20px 0 20px;
            }
            .rooms p{
                font-size: 18px;
                margin-top: -10px;
                margin-bottom: 20px;
            }
            .rooms h4{
                font-size: 26px;
                margin: 8px;
                color: #5C5F70;
            }
            /*Footer*/
            .footer{
                padding: 30px;
                color: #cccccc;
                background-color: #222222;
                font-size: 15px;
            }
            .footer .social{
                font-size: 20px;
                height: 30px;
                width: 30px;
                text-align: center;
                padding: 5px;
                border: 1px solid #cccccc;
                margin-bottom: 10px;
                margin-right: 5px;
            }
            .footer input{
                height: 30px;
                width: 160px;
                padding: 5px;
                border: none;
                background-color: #cccccc;
                color: #000;    
            }
        </style>
    </head>

    <body>
        <div class=""></div>

 <nav class="navbar navbar-expand-lg navbar-light">
            <a class="navbar-brand col-lg-6" href="#" style="font-weight: bold; font-size: 30px;">HOLIDAY</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto ">
                    <li class="nav-item ">
                        <a class="nav-link" href="#">HOME  <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">RESERVATION</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            ROOM
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown" id="listCateRoom">
                            <a class="dropdown-item" href="#" id="r1">Superior Twin</a>
                            <a class="dropdown-item" href="#" id="r2" >Deluxe Twin</a>
                            <a class="dropdown-item" href="#" id="r3" >Deluxe Tripple</a>
                             <a class="dropdown-item" href="#" id="r4" >Deluxe Family Tripple</a>
                              <a class="dropdown-item" href="#" id="r5" >Premier Deluxe King</a>
                            <a class="dropdown-item" href="#" id="r6" >Executive Suite</a>
                            <a class="dropdown-item" href="#" id="r7" >Apartment</a>
                            <form action="" method="get">
                                <input type="hidden" name="valueOfRoom" id="valueOfRoom" value="">
                            </form>
                        </div>
                    </li>

                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" id="searchroom">
                    <button class="btn btn-outline-warning my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </nav>
        <div id="demo" class="carousel slide" data-ride="carousel" >

            <!-- Indicators -->
            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
            </ul>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="img/caro1.jpg" alt="Los Angeles" width="100%" height="500">
                </div>
                <div class="carousel-item">
                    <img src="img/caro2.jpg" alt="Chicago" width="100%" height="500">
                </div>
                <div class="carousel-item">
                    <img src="img/caro3.jpg" alt="New York" width="100%" height="500">
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>
        </div>
        <!--//FORM BOOKING-->
        
        <div class="form-booking container" >
            <div class="row">                
              
                    <form action="searchRoomAvailable" method="get" id="formbooking">
                        <span>Arrival: </span>
                        <input type="date" name="dateFrom" id="dateFrom" />
                        <span>Departure: </span>
                        <input type="date" name="dateTo" id="dateTo" />             
                        <input type="button" class="btn btn-warning" value="CHECK AVAILABLE"  style="margin-left: 100px;" id="btncheckavailable"/>
                    </form>
                
            </div>
        </div>

        <!--end carousel-->
        <!--welcome-->
        <div id="welcome" class="welcome"  style="background-color: lightyellow;margin-top: 0;padding: 30px;height: auto;">
            <div class="container text-center" >
                    <h2>WELCOME TO HOLIDAY HOTEL</h2>
                    <p style="font-size: 16px;">Holiday Hotel prides itself on having a gallery of the most luxurious and morden accommodation in Hanoi Old Quarter. </p>            
            </div>

        <!--          room-->

            <div class="container-fluid">
                <div class="row text-center">
                    <div class="col-lg-3 col-md-3 wow fadeInLeft" data-wow-delay="1.0s" >
                        <a href="AllRoom"><img class="image" style="width: 80%;height: 230px;" src="rooms/hinh1.jpg" alt=""></a>
                        <h4> ROOMS</h4>
                        <hr>
                        <p>Lorem ipsum dolor sit amet, consect adipisicing elit. Proin nibh augue, suscipit a, scelerisque sed</p>
                    </div>
                    <div class="col-lg-3 col-md-3 wow fadeInLeft room-format" data-wow-delay="0.8s" >
                        <a href="#"><img class="image" style="width: 80%;height: 230px;" src="rooms/services.jpg" alt=""></a>
                        <h4>SERVICES</h4>
                        <hr>
                        <p>Lorem ipsum dolor sit amet, consect adipisicing elit. Proin nibh augue, suscipit a, scelerisque sed</p>

                    </div>
                    <div class="col-lg-3 col-md-3 wow fadeInLeft room-format" data-wow-delay="0.6s" >
                        <a href="#"><img class="image" style="width: 80%;height: 230px;" src="rooms/office.jpg" alt=""></a>
                        <h4>OFFICES</h4>
                        <hr>
                        <p>Lorem ipsum dolor sit amet, consect adipisicing elit. Proin nibh augue, suscipit a, scelerisque sed</p>
                    </div>
                    <div class="col-lg-3 col-md-3 wow fadeInLeft room-format" data-wow-delay="0.6s" >
                        <a href="#"><img class="image" style="width: 80%;height: 230px;" src="rooms/membership.jpg" alt=""></a>
                        <h4>MEMBERSHIPS</h4>
                        <hr>
                        <p>Lorem ipsum dolor sit amet, consect adipisicing elit. Proin nibh augue, suscipit a, scelerisque sed</p>
                    </div>
                    <div class="col-lg-4 col-md-4 text-center" style="margin: 40px auto;"><a href="AllRoom" style="border: 1px solid black;color: #4c4c4c; font-weight: bold; font-size: 18px; padding: 20px 30px;">VIEW ALL ROOMS</a></div>
                </div>
            </div>

        </div>

        <!--footer-->
        <div id="footer" class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-4">
                        <h4>Contact us</h4>
                        <p><i class="fa fa-home" aria-hidden="true"></i>111 Main Street, Washington DC, 2222</p>
                        <p><i class="fa fa-envelope" aria-hidden="true"></i>info@media.com</p>
                        <p><i class="fa fa-phone" aria-hidden="true"></i> +1 222 222 222 </p>
                        <p><i class="fa fa-globe" aria-hidden="true"></i>media.com</p>
                    </div>
                    <div class="col-lg-4 col-md-4">
                        <h4>About</h4>
                        <p><i class="fa fa-square-o" aria-hidden="true"></i>About us</p>
                        <p><i class="fa fa-square-o" aria-hidden="true"></i>Privacy</p>
                        <p><i class="fa fa-square-o" aria-hidden="true"></i>Term & Condition</p>
                    </div>
                    <div class="col-lg-4 col-md-4">
                        <h4>Stay in touch</h4>
                        <i class="social fa fa-facebook-official" aria-hidden="true"></i>
                        <i class="social fa fa-twitter" aria-hidden="true"></i>
                        <i class="social fa fa-linkedin" aria-hidden="true"></i>                        
                        <i class="social fa fa-pinterest" aria-hidden="true"></i>
                        <input type="email" placeholder="Subscribe For Updates "><button class="btn btn-success">Subscribe</button>

                    </div>
                </div>
            </div>
        </div>

                  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="js/autocomplete.css" type="text/css">
        <script src="js/autocomplete.js"></script>
        <script src="js/wow.min.js"></script>
        <script>
            new WOW().init();
            new EasyAutocomplete().init();
        </script>
        <script>
            $('.carousel').carousel();        
        </script>
        <script>
          
        </script>   
        <script>
            var arrive;
            var depar;
            var numofperson;
            $('#btncheckavailable').click(function() {
               arrive = ($('#dateFrom').val());
               depar = ($('#dateTo').val());
               numofperson = ($('#adult').val());
               var date1 = new Date(arrive);
               var date2 = new Date(depar);
               if(arrive === "" || depar === "" || numofperson === ""){
                   alert("Please fill out all form !!!!");
               }
               else if(date1<date2){                
                   $('#formbooking').submit();
               }else alert("Date of Departure must be after Date of Arrive");
               
});
            
            
        </script>
      
    </body>
</html>

