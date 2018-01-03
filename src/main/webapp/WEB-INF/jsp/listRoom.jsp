
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            /*            room detail*/
            .roomdetail{
                margin-left: 10px;
            }
            .roomdetail h2{
                font-size: 30px;
            }
            .roomdetail p{
                font-size: 16px;
            }
            .roomdetail input{
                width: 40%;
                height: 30px;
            }
            .roomdetail select{
                width: 40%;
                height: 30px;
            }
            .container{
                max-width: 1320px;
                margin-bottom: 100px;
            }
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
            /* list room*/
            #listRoom1{
                width: 80%;
                margin: 0 auto;
            }
            #yourBooking{
                background: gainsboro;
                margin-left: 100px;
                height: 400px;
                margin-top: 100px;
                margin-bottom: 20px;

            }
            .allroom{
                margin-top: 100px;
            }

        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light" style="border-bottom: 1px solid black;">
            <a class="navbar-brand col-lg-6" href="/hotelWeb/index.jsp" style="font-weight: bold; font-size: 30px;">HOLIDAY</a>
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
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Superior Twin</a>
                            <a class="dropdown-item" href="#">Deluxe Twin</a>
                            <a class="dropdown-item" href="#">Deluxe Tripple</a>
                            <a class="dropdown-item" href="#">Deluxe Family Tripple</a>
                            <a class="dropdown-item" href="#">Premier Deluxe King</a>
                            <a class="dropdown-item" href="#">Executive Suite</a>
                            <!--                            <div class="dropdown-divider"></div>-->
                            <a class="dropdown-item" href="#">Apartment</a>
                        </div>
                    </li>

                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-warning my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </nav>
        <!--     list room -->
        <div  id="listroom">
            <div class="row">

                <div class=" text-center col-lg-4 col-md-4" id="selectedRoom"  style=" height: auto; background-color: #eeeeee;margin-right: 5px;" >

                    <h2 style="color: #337AB7; margin-top: 25px;">SELECTED ROOM</h2>

                    <c:forEach var="room" items="${RoomkList}">
                    <!-- list  seleted room-->
                    
                        <div class=" listselected"   id="roomselectbtn${room.roomID}" style="display: none;">
                            <div class="row">
                            <div class="col-lg-4" style=" margin-bottom: 10px; ">
                                <a href="roomDetail"><img src="${room.picturesList[0].url_picture}" alt="room" style="width: 90%;height: 60%;border: 1px dotted #cccccc; padding: 10px"></a>                        
                            </div>                        
                            <div class="col-lg-7" style="margin-bottom: 10px; margin-left: 10px; " >
                                <p style="font-size: 20px;font-weight: bold;color: #586670; text-transform: uppercase;">  ${room.categoryRoom.type} </p>
                                <p style="font-size: 18px;font-weight: bold;color: #586670; text-transform: uppercase;" class="only"> ROOM: &nbsp; ${room.roomID}</p>         
                                <p style="font-size: 14px; font-weight: bold;">PRICE:   &nbsp; from <span style="color: #C73D28;font-size: 18px;"> $ ${room.getTotalPrice()} </span>/night</p>									
                            </div>
                            </div>                  
                            <button class="btn btn-warning deleteroom" id="btn${room.roomID}">REMOVE</button>
                            <hr style="color: #CA3438;">
                        </div>
                            
                    </c:forEach>
                    
                    <!--form submit-->
                    <form action="listroomselect" method="GET" id="listsubmit">
                        <input type="hidden" name="listRoomSelect" value="" id="listRoomSelect">
                        <input type="hidden"  name="inputdatecheckin" id="inputDateFrom" value="${dateFrom}">
                        <input type="hidden" name="inputdatecheckout" id="inputDateTo" value="${dateTo}" >
                    </form>
                    
                    <!--// Input sumit to controller-->     
                    <input type="button" value="CHECKOUT" id="btnbook" class="btn btn-success">         
                </div>

                <!--DIV FOR AVAILABLE ROOM-->

                <div class="allroom col-lg-7 col-md-7 text-center" style="height: auto; margin-top: 20px; margin-left: 10px; ">
                    <div class="row text-center" style="border-bottom: 1px solid black;">
                        <p style="font-size:30px; font-weight: bold;" class="text-center">Available room</p>
                    </div>
                    <div class="row">
                        <c:forEach var="room" items="${RoomkList}">

                            <div class="row"   id="room${room.roomID}" style="margin-bottom: 10px; border-bottom: 1px solid black;">
                                <div class="col-lg-4" style=" margin-bottom: 10px; ">
                                    <a href="roomDetail"><img src="${room.picturesList[0].url_picture}" alt="room" style="width: 90%;height: 60%;border: 1px dotted #cccccc; padding: 10px"></a>
                                        <c:if test="${room.getTotalDiscountPrice() != 0}">
                                            <p style="background-color: #FFC107; font-weight: bold; border-radius: 100px;width: 90%;margin: 0 auto; margin-top: 0;">Discount  ${room.getTotalDiscountPrice()}%</p>
                                        </c:if>
                                </div>                        
                                <div class="col-lg-7" style="margin-bottom: 10px; margin-left: 10px; " >
                                    <p style="font-size: 20px;font-weight: bold;color: #586670; text-transform: uppercase;">${room.categoryRoom.type}</p>
                                    <p style="font-size: 18px;font-weight: bold;color: #CA3438; text-transform: uppercase;" class="only" >ROOM: &nbsp; ${room.roomID}</p>    
                                    <p style="font-size: 14px; border-bottom: 1px dotted #586670;padding-bottom: 5px;">${room.categoryRoom.description}</p>
                                    <p style="font-size: 14px; font-weight: bold;">PRICE:   &nbsp; from <span style="color: #C73D28;font-size: 18px;">$ ${room.getTotalPrice()}</span>/night</p>									
                                    <p style="font-size: 14px;font-weight: bold;">SIZE:&nbsp; ${room.categoryRoom.size} m<sup>2</sup></p>    
                                    <p style="font-size: 14px;font-weight: bold;">NUM OF PERSON: &nbsp; ${room.categoryRoom.numberOfPerson}</p>    
                                    
                                    
                                    <form action="roomSelected" method="get">
                                        <input type="hidden" name="roomID" value="${room.roomID}" >                             
                                    </form>                  
                                    <input type="submit" class="btn btn-danger pickid" style="font-size: 16px; float: left; margin-left: 10px;"  id="${room.roomID}"  value="Select Room"/>
                                </div>


                            </div>


                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

        <!--footer-->
        <div id="footer" class="footer">
            <div class="container-fluid">
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
                        <input type="email" placeholder="Subscribe For Updates ">
                        <button class="btn btn-success">Subscribe</button>
                    </div>
                </div>
            </div>
        </div>



        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
        <!-- SELECT ROOM-->

        <script>
            var a;
            var room;
            var listRoom = [];
            var b;
            var test;
            var id;
            var roomselect;
            var c;
            var res;
            var roomm;
            //     BUTTON SELECT ROOOM IS CLICKED
            $(".pickid").click(function () {
                a = $(this).attr('id');
                alert("you haved add room " + a + "to your booking");

                room = "room" + a.toString();
                roomselectbtn = "roomselectbtn" + a.toString();
                $("#" + roomselectbtn).css("display", "block");
                $("#" + room).css("display", "none");
                listRoom.push(a);
            });

            //        BUTTON DELETE IS CLICKED      
            $(".deleteroom").click(function () {
                c = $(this).attr('id'); // c = btn(1 -> 20)
                d = c.split("btn");
                res = d[1];
                alert("you delete room " + res + " from your booking");
                roomselect = "roomselect" + c.toString();//room cua div can display
                roomm = "room" + res;
                $("#" + roomselect).css("display", "none");
                $("#" + roomm).css("display", "");
                var index = listRoom.indexOf(res);

                if (index !== -1) {

                    listRoom.splice(index, 1);
                }
            });

            //BUTTON BOOK IS CLICKED

            $("#btnbook").click(function () {
                if (listRoom.length === 0) {
                    alert("Please select Room before CheckOut");
                } else {
                    $('#listRoomSelect').val(listRoom);
                    alert("Rooms you was booked: " + $("#listRoomSelect").val());
                    $("#listsubmit").submit();
                }

            });
        </script> 
        <script>
            window.onload = function () {
                document.onkeydown = function (e) {
                    return (e.which || e.keyCode) !== 116;
                };
            };
        </script>
    </body>
</html>
















