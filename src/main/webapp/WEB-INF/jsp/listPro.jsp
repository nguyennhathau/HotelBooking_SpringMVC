<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="header.jsp" %>
<div class="row content">
    <div class="col-sm-12 text-left"> 
        <div class="container">
            <h2>List Room Promotion</h2>
            <button onclick="location.href = 'newPromotion'" class="btn btn-default">new Promotion</button>
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Start Day</th>
                        <th>End Day</th>
                        <th>Discount Price</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="roomPro" items="${listRoomPro}">
                        <tr>
                            <td>${roomPro.proID}</td>
                            <td>${roomPro.proName}</td>
                            <td>${roomPro.desctiption}</td>
                            <td>${roomPro.startDate}</td>
                            <td>${roomPro.endDate}</td>
                            <td>${roomPro.discountPrice}</td>                                 
                            <th><button onclick="location.href = 'editpro/${roomPro.proID}'" class="btn btn-default">Edit </button></th>                                   
                            <th><button onclick="location.href = 'deletepro/${roomPro.proID}'" class="btn btn-default">Delete</button></th>                                   
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

