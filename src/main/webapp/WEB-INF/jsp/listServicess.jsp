<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="header.jsp" %>
<div class="row content">
    <div class="col-sm-12 text-left"> 
        <div class="container">
            <h2>List Services</h2>
            <button onclick="location.href = 'newServicess'" class="btn btn-default">new Services</button>
            <table class="table">
                <thead>
                    <tr>
                        <th>ID Services</th>
                        <th>Name Services</th>
                        <th>Price</th>
                        <th>Description</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="servicess" items="${listServicess}">
                        <tr>
                            <td>${servicess.servicesID}</td>
                            <td>${servicess.servicesName}</td>
                            <td>${servicess.formattedPrice}</td>
                            <td>${servicess.description}</td>                                
                            <th><button onclick="location.href = 'editServices/${servicess.servicesID}'" class="btn btn-default">Edit </button></th>                                   
                            <th><button onclick="location.href = 'deleteServicess/${servicess.servicesID}'" class="btn btn-default">Delete</button></th>                                   
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

