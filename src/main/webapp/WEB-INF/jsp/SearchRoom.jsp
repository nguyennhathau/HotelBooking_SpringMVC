<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="header.jsp" %>
<div class="row content">
    <div class="col-sm-12 text-left"> 
        <div class="container">
            <!--// search room by id Room-->
            <c:if test="${action=='searchRoomByID'}">
                <h2>${title}</h2>
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>IMG</th>                
                            <th>Type</th>
                            <th>Size</th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Number Of Person</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="roo" items="${roomListSearch}">
                            <tr>
                                <th>${roo.roomID}</th>
                                <th><a data-toggle="modal" href='#${roo.roomID}'><img src="/hotelWeb/${roo.picturesList[0].url_picture}" alt="imgRoom" style="width:169px;
                                                                                      height: 150px;border: 1px dotted #cccccc; padding: 10px"></a></th>
                                <th>${roo.categoryRoom.type}</th>       
                                <td>${roo.categoryRoom.size}</td>
                                <td>${roo.categoryRoom.description}</td>
                                <td>${roo.categoryRoom.formattedPrice}</td>
                                <td>${roo.categoryRoom.numberOfPerson}</td>      
                                <th><button onclick="location.href = 'deleteRoom/${roo.roomID}'" 
                                            class="btn btn-default">Delete</button></th>                                   
                                <td>
                                    <button onclick="location.href = '/hotelWeb/viewIMG/${roo.picturesList[0].picID}'" class="btn btn-default">view Images</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>              
                </table>
            <!--// search room availible-->
            <c:if test="${action=='searchRoom'}">
                <h2>${title}</h2>
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>IMG</th>                
                            <th>Type</th>
                            <th>Size</th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Number Of Person</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="roo" items="${roomAvailabel}">
                            <tr>
                                <th>${roo.roomID}</th>
                                <th><a data-toggle="modal" href='#${roo.roomID}'><img src="/hotelWeb/${roo.picturesList[0].url_picture}" alt="imgRoom" style="width:169px;
                                                                                      height: 150px;border: 1px dotted #cccccc; padding: 10px"></a></th>
                                <th>${roo.categoryRoom.type}</th>       
                                <td>${roo.categoryRoom.size}</td>
                                <td>${roo.categoryRoom.description}</td>
                                <td>${roo.categoryRoom.formattedPrice}</td>
                                <td>${roo.categoryRoom.numberOfPerson}</td>      
                                <th><button onclick="location.href = 'deleteRoom/${roo.roomID}'" 
                                            class="btn btn-default">Delete</button></th>                                   
                                <td>
                                    <button onclick="location.href = '/hotelWeb/viewIMG/${roo.picturesList[0].picID}'" class="btn btn-default">view Images</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>              
                </table>
                <!--//pop up-->
                <c:forEach var="roo" items="${listRoom}">
                    <div class="modal fade" id="${roo.roomID}">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title">Image ${roo.roomID} </h4>
                                </div>
                                <div class="modal-body">
                                    <img src="/hotelWeb/${roo.picturesList[0].url_picture}" class="img-responsive" alt="Image">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>


            <!--// search booking-->
            <c:if test="${action=='searchBooking'}">
                <h2>${title}</h2>
                <c:if test="${message != null}">
                    <div class="well text-danger text-center">${message}</div>
                </c:if>
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>dateBooking</th>
                            <th>Info customer</th>
                            <th>View Detail</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>                          
                        <c:forEach var="booking" items="${listBooking}">
                            <tr>
                                <td>${booking.bookingID}</td>
                                <td>${booking.dateBooking}</td>	
                                <td><a data-toggle="modal" href='#${booking.bookingID}'>${booking.customer.fullName}</a></td>	                                   		
                                <td><button onclick="location.href = 'viewDetailBook/${booking.bookingID}'" class="btn btn-default">ViewDetail</button></td>	
                                <td><button onclick="location.href = 'deletebook/${booking.bookingID}'" class="btn btn-default">Delete</button></td>	


                            </tr>                               
                        </c:forEach>                                 									                            
                    </tbody>
                </table>

                <c:forEach var="booking" items="${listBooking}">
                    <!-- Thong tin khach hang -->
                    <div class="modal fade" id="${booking.bookingID}">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title">Info Customer</h4>
                                </div>                                        
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>fullName</th>
                                            <th>address</th>
                                            <th>phone</th>
                                            <th>email</th>
                                        </tr>
                                    </thead>
                                    <tbody>                   											
                                        <tr>
                                            <td>${booking.customer.custID}</td>
                                            <td>${booking.customer.fullName}</td>
                                            <td>${booking.customer.address}</td>
                                            <td>${booking.customer.phone}</td>
                                            <td>${booking.customer.email}</td>
                                        </tr>                                  									                            
                                    </tbody>
                                </table>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>

            <!--// search room by id-->
            <c:if test="${action=='roombyid'}">
                <h2>${title}</h2>
                <c:if test="${message != null}">
                    <div class="well text-primary text-center">${message}</div>
                </c:if>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Customer</th>
                            <th>date booking</th>                
                            <th>date From</th>
                            <th>date Leave</th>

                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="bd" items="${bdList}">
                            <tr>
                                <td><a data-toggle="modal" href='#${bd.booking.bookingID}'>${bd.booking.customer.fullName}</a></td>
                                <th>${bd.booking.dateBooking}</th>       
                                <td>${bd.dateFrom}</td>
                                <td>${bd.dateTo}</td>
                            </tr>
                        </c:forEach>
                    </tbody>              
                </table>
                <!--//pop up-->
                <c:forEach var="bd" items="${bdList}">
                    <!-- Thong tin khach hang -->
                    <div class="modal fade" id="${bd.booking.bookingID}">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title">Info Customer</h4>
                                </div>                                        
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>fullName</th>
                                            <th>address</th>
                                            <th>phone</th>
                                            <th>email</th>
                                        </tr>
                                    </thead>
                                    <tbody>                   											
                                        <tr>
                                            <td>${bd.booking.customer.custID}</td>
                                            <td>${bd.booking.customer.fullName}</td>
                                            <td>${bd.booking.customer.address}</td>
                                            <td>${bd.booking.customer.phone}</td>
                                            <td>${bd.booking.customer.email}</td>
                                        </tr>                                  									                            
                                    </tbody>
                                </table>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>

            <!--// search room by name-->
            <c:if test="${action=='roomByName'}">
                <h2>${title}</h2>
                <c:if test="${message != null}">
                    <div class="well text-primary text-center">${message}</div>
                </c:if>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Room</th>
                            <th>date booking</th>                
                            <th>date From</th>
                            <th>date Leave</th>
                            <th>Service</th>

                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="bd" items="${List_bd}">
                            <tr>
                                <td>${bd.room.roomID}</a></td>
                                <th>${bd.booking.dateBooking}</th>       
                                <td>${bd.dateFrom}</td>
                                <td>${bd.dateTo}</td>
                                <td>
                                    <button onclick="location.href = '/hotelWeb/viewServices/${bd.bookDetailID}'" 
                                            class="btn btn-default">view Service</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>              
                </table>
               
            </c:if>
        </div>
    </div>
</div>

</body>
</html>

