<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="header.jsp" %>

<div class="container-fluid text-center">    
    <div class="row content">
        <div class="col-sm-12 text-left"> 
            <div class="container">
                <h2>Manage Customer</h2>         
                <table class="table">
                    <thead>
                        <tr>
                            <th>
                                <div>
                                    <button class="btn btn-sm" onclick="location.href = '/hotelWeb/managerCust?pages=${pages}'"><i class="fa fa-caret-up"></i></button>
                                    <button class="btn btn-sm" onclick="location.href = '/hotelWeb/managerCustDesc?pages=${pages}'"><i class="fa fa-caret-down"></i></button>
                                </div>
                            </th>
                            <th>
                                <div>
                                    <button class="btn btn-sm" onclick="location.href = '/hotelWeb/managerCustFN?pages=${pages}'"><i class="fa fa-caret-up"></i></button>
                                    <button class="btn btn-sm" onclick="location.href = '/hotelWeb/managerCustDescFN?pages=${pages}'"><i class="fa fa-caret-down"></i></button>
                                </div>
                            </th>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                        <tr>
                            <th>ID</th>
                            <th>Full Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="cust" items="${listCustomer}">
                            <tr>
                                <td>${cust.custID}</td>
                                <td>${cust.fullName}</td>
                                <td>${cust.email}</td>
                                <td>${cust.phone}</td>
                                <td>${cust.address}</td>
                                <th><button onclick="location.href = 'editCust/${cust.custID}'" class="btn btn-default">Edit </button></th>                                   
                                <th><button onclick="location.href = 'deleteCust/${cust.custID}'" class="btn btn-default">Delete</button></th>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <ul class="pagination">
                    <!--//sort acsending-->
                    <c:if test="${sort=='sortAsc'}">
                        <li><a href="managerCust?pages=1">«</a></li>
                            <c:forEach var="i" begin="1" end="${totalPages}">
                                <c:set var="active" value="${pages}"/>
                            <li <c:if test="${active == i}">class="active"</c:if>>
                                <a href="managerCust?pages=${i}">
                                    <c:out value="${i}"/>
                                </a>
                            </li>
                        </c:forEach>
                        <li><a href="managerCust?pages=${totalPages}">»</a></li>
                        </c:if>

                    <!--sort descending by id-->
                    <c:if test="${sort=='sortDesc'}"> 
                        <li><a href="managerCustDesc?pages=1">«</a></li>
                            <c:forEach var="i" begin="1" end="${totalPages}">
                                <c:set var="active" value="${pages}"/>
                            <li <c:if test="${active == i}">class="active"</c:if>>
                                <a href="managerCustDesc?pages=${i}">
                                    <c:out value="${i}"/>
                                </a>
                            </li>
                        </c:forEach>
                        <li><a href="managerCustDesc?pages=${totalPages}">»</a></li>
                        </c:if>
                        
                    <!--sort asc by fullname-->
                    <c:if test="${sort=='sortAscFN'}"> 
                        <li><a href="managerCustDesc?pages=1">«</a></li>
                            <c:forEach var="i" begin="1" end="${totalPages}">
                                <c:set var="active" value="${pages}"/>
                            <li <c:if test="${active == i}">class="active"</c:if>>
                                <a href="managerCustDesc?pages=${i}">
                                    <c:out value="${i}"/>
                                </a>
                            </li>
                        </c:forEach>
                        <li><a href="managerCustDesc?pages=${totalPages}">»</a></li>
                        </c:if>
                        
                        <!--sort desc by fullname-->
                    <c:if test="${sort=='sortDescFN'}"> 
                        <li><a href="managerCustDesc?pages=1">«</a></li>
                            <c:forEach var="i" begin="1" end="${totalPages}">
                                <c:set var="active" value="${pages}"/>
                            <li <c:if test="${active == i}">class="active"</c:if>>
                                <a href="managerCustDesc?pages=${i}">
                                    <c:out value="${i}"/>
                                </a>
                            </li>
                        </c:forEach>
                        <li><a href="managerCustDesc?pages=${totalPages}">»</a></li>
                        </c:if>
                </ul>
            </div>
        </div>
    </div>


</body>
</html>

