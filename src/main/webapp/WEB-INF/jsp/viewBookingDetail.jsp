<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="header.jsp" %>

<div class="row content">
    <div class="col-sm-12 text-left"> 
        <div class="container">
            <h2>Booking Detail</h2>


            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>dateFrom</th>
                        <th>To date</th>
                        <th>Service</th>
                        <th> RoomID</th>
                        <!--<th>Total</th>-->
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>   
                    <c:forEach var="bookdt" items="${bdList}">                       
                        <tr>
                            <td>${bookdt.bookDetailID}</td>
                            <td>${bookdt.dateFrom}</td>	
                            <td>${bookdt.dateTo}</td>	
                            <td>
                                <button onclick="location.href = '/hotelWeb/viewServices/${bookdt.bookDetailID}'" class="btn btn-default">view Service</button>
                            </td>		
                            <td>${bookdt.room.roomID}</td>
                            <!--<td>Total</td>-->
                            <td>
                                <button onclick="location.href = 'deleteBookdt/'${bookdt.bookDetailID}'" 
                                        type="button" class="btn btn-default">delete
                                </button>
                            </td>
                        </tr> 
                    </c:forEach>
                </tbody>
            </table>
            

        </div>
    </div>
</div>

</body>
</html>

