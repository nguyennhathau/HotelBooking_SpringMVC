<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="header.jsp" %>
<div class="row content">
    <div class="col-sm-12 text-left"> 
        <div class="container">
            <h2>Manage Category</h2>
            <div class="row">
                <div class="col-md-5">
                    <!--search room by ID-->
                    <div><b>Find By ID Room</b></div>
                    <div>
                        <form action="/hotelWeb/searchRoomByID" method="post" role="form" class="form-inline">
                            <div class="form-group">
                                <input type="text" placeholder="Input code Room" name="idRoom" width="270" class="form-control" >
                            </div>
                            <button type="submit" class="btn btn-primary">Search</button>
                        </form>
                    </div>

                </div>
                <div class="col-md-5">
                    <!--search room availible--> 
                    <div><b>Find By Availible Room</b></div>
                    <div class="row">
                        <form action="/hotelWeb/searchroomempty" method="post" role="form" class="form-inline">
                            <div class="form-group">
                                <input type="text" placeholder="Input Date From" name="fromdate" width="270" class="form-control" >
                                <input type="text" placeholder="Input Date To" name="todate" width="270" class="form-control" >
                            </div>
                            <button type="submit" class="btn btn-primary">Search</button>
                        </form>
                    </div>
                </div>
            </div>
            </br>
            <button onclick="location.href = 'newCategory'" class="btn btn-default">new Category</button>
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Type</th>
                        <th>Size</th>
                        <th>Number Of Person</th>
                        <th>Price</th>
                        <th>List Room</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="category" items="${roomManagement}">
                        <tr>
                            <th>${category.categoryID}</th>
                            <th>${category.type}</th>
                            <th class="text-primary">${category.size}</th>
                            <th>${category.numberOfPerson}</th>                                   
                            <th>${category.formattedPrice}</th>                                   
                            <th><button onclick="location.href = 'viewDetails/${category.categoryID}'" class="btn btn-default">viewListRoom </button></th>                                   
                            <th><button onclick="location.href = 'editCategory/${category.categoryID}'" class="btn btn-default">Edit </button></th>                                   
                            <th><button onclick="location.href = 'delCategory/${category.categoryID}'" class="btn btn-default">Delete</button></th>                                   
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <c:if test="${message!= 'null'}">
                <div class="well text-primary text-center">${message}</div>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>

