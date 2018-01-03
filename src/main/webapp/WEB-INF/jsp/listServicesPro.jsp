<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="header.jsp" %>
<div class="row content">
    <div class="col-sm-12 text-left"> 
        <div class="container">
            <h2>List Services Promotion</h2>
            <button onclick="location.href = 'newServicesPro'" class="btn btn-default">new Services</button>
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Price Promotion</th>
                        <th>Description</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="ServicesPro" items="${listServicesPro}">
                        <tr>
                            <td>${ServicesPro.serviceProID}</td>
                            <td>${ServicesPro.serviceProName}</td>
                            <td>${ServicesPro.pricePro}%</td>
                            <td>${ServicesPro.description}</td>                                
                            <th><button onclick="location.href = 'editServicesPro/${ServicesPro.serviceProID}'" class="btn btn-default">Edit </button></th>                                   
                            <th><button onclick="location.href = 'deleteServicesPro/${ServicesPro.serviceProID}'" class="btn btn-default">Delete</button></th>                                   
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <c:if test="${message != null}">
            <div class="well text-primary text-center">${message}</div>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>

