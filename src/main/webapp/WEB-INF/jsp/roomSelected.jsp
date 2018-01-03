
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>JSP Page</title>
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
            </div>
        </nav>
        
        <!--ROOOOOOOOMMMMMMMMMMMMM-->
       

                <!--YOUR BOOKING-->

                
                        <div class="container text-center " style="">
                            <h2 style="font-weight: bold;">YOUR BOOKING</h2>
                            <p>Please check information before check-out</p>
                            <p style="font-weight: bold;">Date From: ${inputdatecheckin}</p>
                            <p style="font-weight: bold;">Date To: ${inputdatecheckout}</p>

                            <c:forEach var="a" items="${listRoom}">
                                        <c:forEach var="room" items="${listAllRoom}">
                                            <c:if test="${room.roomID == a}">
                                                <div class="row" style="margin-bottom: 30px;border-top: 2px solid #cccccc; padding-top: 20px;padding-bottom: 10px;">
                                                <div class="col-lg-4">   <img src="${room.picturesList[0].url_picture}" alt="room"  style="width: 100%;"></div>
                                                <div class="col-lg-6 text-center" style="height: 200px;">
                                                    <p style="font-size: 20px;font-family: sans-serif;font-weight: bold;text-transform: uppercase;">${room.categoryRoom.type}</p>
                                                    <p>Room Price: $ ${room.getTotalPrice()}</p>
<!--                                                  
-->                                                </div>
                                                   </div>
                                                
                                            </c:if>
                                        </c:forEach>                        
                                    </c:forEach>
                            <h2 style="font-weight: bold;">Total Price: <span id="totalprice" style="color: #CA3438">$ ${totalAllPrice}</span></h2>

                        </div>
                        
                        <!--PAYMENT INFOR-->
         
                
   
             
                      
                 

                                         <div class="container" style="background-color: #DFD3AD;height: auto; padding: 20px;margin-bottom: 20px;">
                                    <h2 style="font-weight: bold;">INFORMATION DETAIL</h2>
                                   
                            <form action="checkout" id="formcheckout"> 
                                <div class="row">
                                    <div class="col-lg-4 col-md-4" style="margin-bottom: 5px;">
                                        <label for="name" style="float:right;">FULL NAME :</label>
                                    </div>
                                    <div class="colg-lg-8 col-md-8" style="margin-bottom: 5px;">
                                        <input type="text" class="form-control" id="name" name="fullname" required="" value="${customer.fullName}">
                                    </div>
                                </div>
                                 <div class="row">
                                     <div class="col-lg-4 col-md-4" >
                                        <label for="email" style="float:right;">EMAIL :</label>
                                    </div>
                                    <div class="colg-lg-8 col-md-8" style="margin-bottom: 5px;">
                                        <input type="email" class="form-control" id="email" name="email" required="" value="${customer.email}">
                                    </div>
                                </div>
                                 <div class="row">
                                    <div class="col-lg-4 col-md-4">
                                        <label for="phone" style="float:right;">PHONE :</label>
                                    </div>
                                    <div class="colg-lg-8 col-md-8" style="margin-bottom: 5px;">
                                        <input type="tel" class="form-control" id="phone" name="phone" required="" value="${customer.phone}">
                                    </div>
                                </div>
                                 <div class="row">
                                    <div class="col-lg-4 col-md-4">
                                        <label for="address" style="float:right;">ADDRESS :</label>
                                    </div>
                                    <div class="colg-lg-8 col-md-8">
                                        <input type="text" class="form-control" id="address" name="address" required="" value="${customer.address}">
                                    </div>
                                </div>
                                   <h2 style="font-weight: bold;">PAYMENT</h2>
                                    <div class="row">
                                    <div class="col-lg-4 col-md-4" style="margin-bottom: 5px;">
                                        <label for="namecard" style="float:right;">NAME OF CARD :</label>
                                    </div>
                                    <div class="colg-lg-8 col-md-8" style="margin-bottom: 5px;">
                                        <input type="text" class="form-control" id="namecard" name="namecard" required="">
                                    </div>
                                </div>
                                 <div class="row">
                                    <div class="col-lg-4 col-md-4" style="margin-bottom: 5px;">
                                        <label for="card" style="float:right;">SERIE NUMBER :</label>
                                    </div>
                                    <div class="colg-lg-8 col-md-8" style="margin-bottom: 5px;">
                                        <input type="text" class="form-control" id="card" name="serienumber" required="">
                                    </div>
                                   
                                </div>
                                   <div class="row">
                                    <div class="col-lg-4 col-md-4" style="margin-bottom: 5px;">
                                        <label for="ccv" style="float:right;">CCV :</label>
                                    </div>
                                    <div class="colg-lg-8 col-md-8" style="margin-bottom: 5px;">
                                        <input type="text" class="form-control" id="ccv" name="ccv" required="">
                                    </div>
                                   
                                </div>
                                   <div class="row">
                                    <div class="col-lg-4 col-md-4" style="margin-bottom: 5px;">
                                        <label for="card" style="float:right;">Expired Day :</label>
                                    </div>
                                    <div class="colg-lg-8 col-md-8" style="margin-bottom: 5px;">
                                        <span style="color:black; ">Month: </span>
                                        <select name="expiredMonth" id="expiredMonth" style="width: 7%;margin-right: 10px;">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                            <option value="7">7</option>
                                            <option value="8">8</option>
                                            <option value="9">9</option>
                                            <option value="10">10</option>
                                            <option value="11">11</option>
                                            <option value="12">12</option>
                                        </select>
                                        <span style="color:black; ">Year: </span>
                                        <select name="expiredYear" id="expiredYear">
                                            <option value="2018">2018</option>
                                            <option value="2019">2019</option>
                                            <option value="2020">2020</option>                                          
                                        </select>
                                    </div>
                                       
                                       <h2>${mess}</h2>
                                       
                                    
                                </div>
                                   
                                   
                                   <input type="hidden" name="lastListRoom" value="" id="lastListRoom">      
                                   <input type="hidden" name="totalprice" value="" id="lastprice">
                                   <input type="hidden" name="inputdatecheckin" value="${inputdatecheckin}">
                                   <input type="hidden" name="inputdatecheckout" value="${inputdatecheckout}">
                            </form>
                            
                                <input type="submit" value="PAYMENT" class="btn btn-primary" id="checkoutbtn">
                        </div>
                               
        <!--END ROOOMMM-->
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
        <script>

                    var values = [];
                    var check;
            <c:forEach var="a" items="${listRoom}" >
                values.push("${a}"); 
            </c:forEach>

            var aaa;
            $("#checkoutbtn").click(function(){
               $("#lastListRoom").val(values);
               aaa = ${totalAllPrice};
               $('#lastprice').val(aaa);
               check =  $("#lastListRoom").val();
//               alert("Value of input hidden is: " + check);
               $("#formcheckout").submit();
            });
        </script>
    </body>
</html>
