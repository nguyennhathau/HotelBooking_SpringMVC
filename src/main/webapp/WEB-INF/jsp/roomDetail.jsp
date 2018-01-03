
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.12.4.js"></script>
        <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/animate.min.css">


        <script src="js/parallax.min.js"></script>
        <style>
            .header{
                height: 40px;
                background-color: #586670;
            }

            div.navbar-light{
                height: 120px;
/*                position: fixed;*/
                z-index: 1000;
               border-bottom: 1px solid #222222;
              
                
               
            }
            div.logo{
              
                margin: 20px 20px;
               
            }
            div.logo a{
                font-family: Heltica, sans-serif;
                font-size: 50px;
                font-weight: bolder;
                padding-top: 5px;
                margin-bottom: -3px;

            }
            div.logo p{
                letter-spacing: 3px;
            }
            div.navigation{
                /*                border: 1px solid black;*/
                margin: 21px;
                padding: 21px;
            }
            div.navigation ul li{

                display: inline-block;
                margin-right: 65px;         
                padding-top: 1px;
                padding-bottom: 1px;


            }
            div.navigation ul li p{

                font-size: 10px;
            }
            div.navigation ul li a{

                padding: 0px;
                font-size: 16px;
                color: #586670;
                font-weight: bold;
                margin-bottom: 0;

            }
            div.navigation ul li a:hover{
                text-decoration: none;
                background-color: white;
            }

            .container1{
                width: 90%;
/*                border: 1px solid yellow;*/
                margin: 0 auto;
            }
            .search{
                float: right;
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
        </style>
    </head>
    <body>
        <div class="container-fluid header">
            <div class="container1">
                <div class="row">
                    <div class="col-lg-2 col-md-2 text-center">
                        <p style="font-size: 14px; color: #ffffff; border-right: 1px dotted gainsboro;margin-left: 7px; margin-top: 6px; ">92 Quang Trung, DN</p>

                    </div>
                    <div class="col-lg-2 col-md-2 text-center">
                        <p style="font-size: 14px; color: #ffffff; border-right: 1px dotted gainsboro; margin-top: 6px; ">Phone: 0123456789</p>

                    </div>
                    <div class="col-lg-2 col-md-2 text-center">
                        <p style="font-size: 14px; color: #ffffff; border-right: 1px dotted gainsboro; margin-top: 6px; ">holidayhotel@tourist.com</p>

                    </div>
                    <div class="col-lg-6 col-md-6 search" >
                        <form class="form" action="/action_page.php">
                            <input class="form" type="text" style="width: 80%;height: 28px;margin-top: 3px;" placeholder="Search">
                            <button class="btn btn-primary" style="height: 28px;" type="submit">Search</button>
  </form>
                    </div>
                </div>
            </div>
        </div>
        <!--navigation-->
        <div class="container-fluid navbar-light">
            <div class="row">
                <div class="col-lg-3 col-md-3 logo text-center brand">
                    <a href="#" style="text-decoration: none;">HOLIDAY</a>
                    <p>HOTELS  &  VILLAS</p>
                </div>
                <div class="col-lg-8 col-md-8 navigation text-center">
                    <ul >
                        <li >
                            <a  href="index.html" >HOME</a>
                            <p>SITE HOMEPAGE</p>
                        </li>
                        <li >
                            <a  href="#">RESERVATION</a>
                            <p>SITE HOMEPAGE</p>
                        </li>
                        <li >
                            <a  href="#">SERVICES</a>
                            <p>SITE HOMEPAGE</p>
                        </li>
                        <li >
                            <a  href="#">ABOUT US</a>
                            <p>SITE HOMEPAGE</p>
                        </li>
                        <li >
                            <a  href="#">CONTACT</a>
                            <p>SITE HOMEPAGE</p>
                        </li>
                    </ul>
                </div>

            </div>
        </div>
        
<!--        room detail-->
<div id="roomdetail" class="roomdetail">
    <div class="container " style="margin-top: 100px;" >
    <div class="row">
        <div class="card col-lg-6 col-md-6" style="padding: 10px 10px;">
            <img class="card-img-top" src="${roomDetail.picturesList[0].url_picture}" alt="Card image cap">
  <div class="card-block">
    <h4 class="card-title">Card title</h4>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
        <div class="col-lg-4 col-md-4 card-block" style="margin-left: 100px;">
            <h2>Room with one bedroom</h2>
            <p>from <span style="color:#c82333;font-weight: bold;">$100</span>/night</p>
            <hr>
            <p>Max person: &nbsp;<i class="fa fa-male" aria-hidden="true"></i><i class="fa fa-male" aria-hidden="true"></i> , Room bed: 1 , 1 Kings Bed , 1 Single Bed</p>
            <p>Room size: 20-30m2</p>
            <hr>
            <p>Morbi at mi in risus venenatis suscipit sed ut ipsum. Nullam massa eros, euismod vestibulum ligula quis, volutpat feugiat lorem.
            Morbi in quam varius, euismod arcu id, imperdiet diam. Aenean vel neque...</p>
          
            <input type="text" id="datepicker1" placeholder="check-in-date" style="font-size: 16px;"/>
            <input type="text" id="datepicker2" placeholder="check-out-date" style="margin-left: 10px;font-size: 16px;"><br>
            <select name="room-adults" id="single-room-adult-selection" style="margin-top: 10px;">
						<option style="font-size: 16px;">No. adults</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
					</select>
            <select name="room-children" id="single-room-children-selection" style="margin-left: 10px;">
						<option style="font-size: 16px;">No. children</option>
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
					</select>
            <input type="submit" class="btn btn-danger" value="BOOK NOW" style="background-color: #C73D28;margin-top: 30px;height: 50px;font-size: 20px;">
              
 
               
           
    </div>
        </div>
</div>
</div>
<!--    end roomdetail-->
<!--    des of room-->
<div class="container" style="margin-top: -20px;">
  
 
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#home">DESCRIPTION</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu1">POLICIES</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu2">AVAILIBILITY</a>
    </li>
     <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu2">REVIEW</a>
    </li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="home" class="container tab-pane active"><br>
      <h3>HOME</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
    </div>
    <div id="menu1" class="container tab-pane fade"><br>
      <h3>Menu 1</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
    <div id="menu2" class="container tab-pane fade"><br>
      <h3>Menu 2</h3>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
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
                        <input type="email" placeholder="Subscribe For Updates "><button class="btn btn-success">Subscribe</button>


        

                    </div>
                </div>
            </div>
        </div>
    
    

    </body>
</html>