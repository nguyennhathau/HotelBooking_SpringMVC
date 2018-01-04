<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="header.jsp" %>

<div class="row content">
    <div class="col-sm-12 text-left"> 
        <div class="container">
            <h2>Manage Booking</h2>
            <div class="row">
                <div class="col-md-5">
                    <!--//search booking-->
                    <div><b>Find By Date Booking</b></div>
                    <div>
                        <form action="/hotelWeb/searchBooking" method="post" role="form" class="form-inline">
                            <div class="form-group">
                                <input type="text" placeholder="Input date from" name="fromdate" width="270" class="form-control" >
                                <input type="text" placeholder="Input date to" name="todate" width="270" class="form-control" >
                            </div>
                            <button type="submit" class="btn btn-primary">Search</button>
                        </form>
                    </div>
                </div>
                <div class="col-md-5">
                    <!--search by name-->
                    <div><b>Find By Name Customer</b></div>
                    <div>
                        <form action="/hotelWeb/findbyname" method="post" role="form" class="form-inline">
                            <div class="form-group">
                                <input type="text" placeholder="Input Name Customer" name="name" width="270" class="form-control" >
                            </div>
                            <button type="submit" class="btn btn-primary">Search</button>
                        </form>
                    </div>
                </div>

            </div>
            </br>
            <table class="table">
                <thead>
                    <tr>
                        <th>
                            <div>
                                <button class="btn btn-sm" onclick="location.href = '/hotelWeb/getBooking?pages=${pages}'"><i class="fa fa-caret-up"></i></button>
                                <button class="btn btn-sm" onclick="location.href = '/hotelWeb/getBookingDesc?pages=${pages}'"><i class="fa fa-caret-down"></i></button>
                            </div>
                        </th>
                        <th>
                            <div>
                                <button class="btn btn-sm" onclick="location.href = '/hotelWeb/sortDatebk?pages=${pages}'"><i class="fa fa-caret-up"></i></button>
                                <button class="btn btn-sm" onclick="location.href = '/hotelWeb/sortDateBKDesc?pages=${pages}'"><i class="fa fa-caret-down"></i></button>
                            </div>
                        </th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
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
                            <td><button onclick="location.href = '/hotelWeb/viewDetailBook/${booking.bookingID}'" class="btn btn-default">ViewDetail</button></td>	
                            <td><button onclick="location.href = '/hotelWeb/deletebook/${booking.bookingID}'" class="btn btn-default">Delete</button></td>	


                        </tr>                               
                    </c:forEach>                                 									                            
                </tbody>
            </table>

            <!--phan trang--> 
            <ul class="pagination">
                <!--sort descending by id-->
                <c:if test="${sort=='sortDescId'}"> 
                    <li><a href="getBookingDesc?pages=1">«</a></li>
                        <c:forEach var="i" begin="1" end="${totalPages}">
                            <c:set var="active" value="${pages}"/>
                        <li <c:if test="${active == i}">class="active"</c:if>>
                            <a href="getBookingDesc?pages=${i}">
                                <c:out value="${i}"/>
                            </a>
                        </li>
                    </c:forEach>
                    <li><a href="getBookingDesc?pages=${totalPages}">»</a></li>
                    </c:if>

                <!--sort asc by id-->
                <c:if test="${sort=='sortId'}"> 
                    <li><a href="getBooking?pages=1">«</a></li>
                        <c:forEach var="i" begin="1" end="${totalPages}">
                            <c:set var="active" value="${pages}"/>
                        <li <c:if test="${active == i}">class="active"</c:if>>
                            <a href="getBooking?pages=${i}">
                                <c:out value="${i}"/></a></li>
                            </c:forEach>
                    <li><a href="getBooking?pages=${totalPages}">»</a></li>
                    </c:if>

                <!--sort asc by date booking-->
                <c:if test="${sort=='sortdate'}"> 
                    <li><a href="sortDatebk?pages=1">«</a></li>
                        <c:forEach var="i" begin="1" end="${totalPages}">
                            <c:set var="active" value="${pages}"/>
                        <li <c:if test="${active == i}">class="active"</c:if>>
                            <a href="sortDatebk?pages=${i}">
                                <c:out value="${i}"/></a></li>
                            </c:forEach>
                    <li><a href="sortDatebk?pages=${totalPages}">»</a></li>
                    </c:if>

                <!--sort desc by date booking-->
                <c:if test="${sort=='sortdateDesc'}"> 
                    <li><a href="sortDateBKDesc?pages=1">«</a></li>
                        <c:forEach var="i" begin="1" end="${totalPages}">
                            <c:set var="active" value="${pages}"/>
                        <li <c:if test="${active == i}">class="active"</c:if>>
                            <a href="sortDateBKDesc?pages=${i}">
                                <c:out value="${i}"/></a></li>
                            </c:forEach>
                    <li><a href="sortDateBKDesc?pages=${totalPages}">»</a></li>
                    </c:if>
            </ul>

            <c:if test="${message != null}">
                <div class="well text-primary text-center">${message}</div>
            </c:if>
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
        </div>
    </div>
</div>
</body>
</html>

