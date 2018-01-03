<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form"  %>

<%@include file="header.jsp" %>

<div class="row content">
    <div class="col-sm-12 text-left"> 
        <div class="container">
            <mvc:form modelAttribute="servicesdt" action="/hotelWeb/saveServicdt" method="post" role="form">
                <legend>${title}</legend>
                <c:if test="${action=='edit'}">
                    <div class="form-group">
                        <label for="">ID</label>
                        <mvc:input path="serviceDetailID" readonly="true" class="form-control"/>
                    </div>
                </c:if>
                <div class="form-group">
                    <label for="">Date Start</label>
                    <mvc:input path="dateStart" type="text" class="form-control" />
                </div>

                <div class="form-group">
                    <label for="">Date End</label>
                    
                    <mvc:input path="dateEnd" type="text" class="form-control"  />
                </div>

                <div class="form-group">
                    <label for="" style="margin-right:10px;">Service Name</label>
                    <mvc:select path="servicess.servicesID">
                        <c:forEach var="service" items="${listService}">  
                            <mvc:option value="${service.servicesID}">
                                <c:if  test="${servicesdt.servicess.servicesID}}=${service.servicesID}">selected</c:if>
                                ${service.servicesName}
                            </mvc:option>
                        </c:forEach>
                    </mvc:select>
                </div>
                <mvc:input type="hidden" path="bookingDetail.bookDetailID" name="bookDetailID"/>
                <button type="submit" class="btn btn-primary">Submit</button>
            </mvc:form>
        </div>
    </div>
</div>
</body>
</html>

