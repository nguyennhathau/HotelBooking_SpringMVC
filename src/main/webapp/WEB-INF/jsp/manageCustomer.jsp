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
                    <li><a href="managerCust?pages=1">«</a></li>
                        <c:forEach var="i" begin="1" end="${totalPages}">
                            <c:set var="active" value="${pages}"/>
                        <li <c:if test="${active == i}">class="active"</c:if>>
                            <a href="managerCust?pages=${i}">
                                <c:out value="${i}"/></a></li>

                    </c:forEach>
                    <li><a href="managerCust?pages=${totalPages}">»</a></li>
                </ul>
            </div>
        </div>
    </div>


</body>
</html>

