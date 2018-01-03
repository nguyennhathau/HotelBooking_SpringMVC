<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="header.jsp" %>
<div class="row content">
    <div class="col-sm-12 text-left"> 
        <div class="container">
            <h2>List Room Promotion</h2>
            <button onclick="location.href = 'addProForRoom'" class="btn btn-default">New Promotion for Room</button>
            <table class="table">
                <tr>
                    <th>ID Room</th>
                    <th>Name Promotion</th>
                    <th>Description</th>
                    <th>Start Day</th>
                    <th>End Day</th>
                    <th>Discount Price</th>
                    <!--<th>Edit</th>-->
                    <th>Delete</th>
                </tr>

                <c:forEach var="roomLi" items="${listRoomPro}">
                    <tr>
                        <td>${roomLi.room.roomID}</td>
                        <td>${roomLi.promotion.proName}</td>
                        <td>${roomLi.promotion.desctiption}</td>
                        <td>${roomLi.promotion.startDate}</td>
                        <td>${roomLi.promotion.endDate}</td>
                        <td>${roomLi.promotion.discountPrice}</td>
                        <!--<th><button onclick="location.href = 'editRoompro/${roomLi.room.roomID}'" class="btn btn-default">Edit </button></th>-->                                   
                        <td>
                            <form action="deleteRoompro" method="post">
                                <input type="hidden" name="id" value="${roomLi.id}">
                                <input class="btn btn-default" type="submit" value="delete">
                            </form>
                        </td>
                    </tr>
                </c:forEach>

            </table>
            <h2><a href="getAllPromotion">List Promotion</a></h2>
            <c:if test="${message != null}">
            <div class="well text-primary text-center">${message}</div>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>