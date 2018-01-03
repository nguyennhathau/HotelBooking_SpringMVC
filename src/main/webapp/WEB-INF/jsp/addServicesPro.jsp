<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form"  %>

<%@include file="header.jsp" %>

<div class="row content">
    <div class="col-sm-12 text-left"> 
        <div class="container">
            <mvc:form modelAttribute="ServicesPro" action="/hotelWeb/saveServicesPro" method="post" role="form">
                <legend>${title}</legend>
                <c:if test="${action=='edit'}">
                    <div class="form-group">
                        <label for="">ID</label>
                        <mvc:input path="serviceProID" readonly="true" class="form-control"/>
                    </div>
                </c:if>
                <div class="form-group">
                    <label for="">Name Service Promotion</label>
                    <mvc:input path="serviceProName"  class="form-control" type="text" />
                </div>

                <div class="form-group">
                    <label for="">Price Promotion</label>
                    <mvc:input path="pricePro" class="form-control" type="text" />
                </div>
                <div class="form-group">
                    <label for="">Description</label>
                    <mvc:input path="description" class="form-control"  />
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </mvc:form>
        </div>
    </div>
</div>
</body>
</html>

