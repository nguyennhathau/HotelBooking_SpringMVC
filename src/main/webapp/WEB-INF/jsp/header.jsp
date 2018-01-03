
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Home Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script   src="https://code.jquery.com/jquery-2.2.3.min.js"   integrity="sha256-a23g1Nt4dtEYOj7bR+vTu7+T8VP13humZFBJNIYoEJo="   crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            /* Remove the navbar's default margin-bottom and rounded borders */ 
            .navbar {
                margin-bottom: 0;
                border-radius: 0;
            }

            /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
            .row.content {height: 450px}

            /* Set gray background color and 100% height */
            .sidenav {
                padding-top: 20px;
                background-color: #f1f1f1;
                height: 100%;
            }

            /* Set black background color, white text and some padding */
            footer {
                background-color: #555;
                color: white;
                padding: 15px;
            }

            /* On small screens, set height to 'auto' for sidenav and grid */
            @media screen and (max-width: 767px) {
                .sidenav {
                    height: auto;
                    padding: 15px;
                }
                .row.content {height:auto;} 
            }
        </style>
    </head>
    <body>

        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="home">Logo</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="home">Home</a></li>
                        <c:if test="${sessionScope.role=='1'}">
                            <li><a href="/hotelWeb/managerAcc">Manage Account</a></li>                          
                        </c:if> 
                        <c:if test="${sessionScope.role=='2'}">
                            <li><a href="getALLServices">Manage Service</a></li>
                            <li><a href="manage">Manage Category Room</a></li> 
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Manage Promotion
                                    <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="getAllRoomPromotion">Room Promotion</a></li>
                                    <li><a href="getAllServicesPro">Service Promotion</a></li>

                                </ul>
                            </li>
                        </c:if>     
                        <c:if test="${sessionScope.role=='3'}">
                            <li><a href="/hotelWeb/getBooking">Manage Booking</a></li> 
                            <li><a href="/hotelWeb/managerCust">Manage customer</a></li>
                        </c:if>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                <span style="color: white">Welcome  ${sessionScope.username}</span>
                                <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="/hotelWeb/changepassword">Change Password</a></li>                                                                     
                            </ul>
                        </li>
                        <li><a href="/hotelWeb/logout"><span class="glyphicon glyphicon-log-in"> logout</span> </a></li>
                    </ul>
                </div>
            </div>
        </nav>