<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form"  %>

<%@include file="header.jsp" %>

        <div class="row content">
            <div class="col-sm-12 text-left"> 
                <div class="container">
                    <mvc:form modelAttribute="servicess" action="/hotelWeb/saveServicess" method="POST" role="form">
                        <legend>${title}</legend>
                        <c:if test="${action=='edit'}">
                            <div class="form-group">
                                <label for="">ID</label>
                                <mvc:input path="servicesID" readonly="true" class="form-control"/>
                            </div>
                        </c:if>
                        <div class="form-group">
                            <label for="">Name Services</label>
                            <mvc:input path="servicesName"  class="form-control"  />
                        </div>

                        <div class="form-group">
                            <label for="">Price Services</label>
                            <mvc:input path="price" class="form-control"/>
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

