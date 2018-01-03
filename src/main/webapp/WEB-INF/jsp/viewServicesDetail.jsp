<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="header.jsp" %>

<div class="row content">
    <div class="col-sm-12 text-left"> 
        <div class="container">
            <h2>View Service Booking</h2>
           
            <!--chi tiet service--> 
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Date Start</th>
                        <th>Date End</th>
                        <th>Service Name</th>
                        <th>Price</th>
                        <th>Promotion</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody> 
                    <c:forEach var="servicedt" items="${servicedtList}">                          
                        <tr>
                            <td>${servicedt.serviceDetailID}</td>
                            <td>${servicedt.dateStart}</td>	
                            <td>${servicedt.dateEnd}</td>	
                            <td>${servicedt.servicess.servicesName}</td>		
                            <td>${servicedt.servicess.getFormattedPrice()}</td>
                            <td>${servicedt.servicess.servicesPro.pricePro}%</td>
                            <td><button onclick="location.href = '/hotelWeb/editServicedt/${servicedt.serviceDetailID}'"
                                    type="button" class="btn btn-default">Edit</button></td>
                            <td><button onclick="location.href = '/hotelWeb/deleteServicedt/${servicedt.serviceDetailID}'" 
                                        type="button" class="btn btn-default">delele</button></td>
                        </tr>  
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>




