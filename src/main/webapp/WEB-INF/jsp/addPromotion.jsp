<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form"  %>

<%@include file="header.jsp" %>

        <div class="row content">
            <div class="col-sm-12 text-left"> 
                <div class="container">
                    <mvc:form modelAttribute="promotion" action="/hotelWeb/savePro" method="post" role="form">
                        <legend>${title}</legend>
                        <c:if test="${action=='edit'}">
                            <div class="form-group">
                                <label for="">ID</label>
                                <mvc:input path="proID" readonly="true" class="form-control"/>
                            </div>
                        </c:if>
                        <div class="form-group">
                            <label for="">Name Promotion</label>
                            <mvc:input path="proName"  class="form-control"  />
                        </div>

                        <div class="form-group">
                            <label for="">Description</label>
                            <mvc:input path="desctiption" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="">Start Date</label>
                            <mvc:input path="startDate" class="form-control"  />
                        </div>
                        <div class="form-group">
                            <label for="">End Date</label>
                            <mvc:input path="endDate" class="form-control"  />
                        </div>
                        <div class="form-group">
                            <label for="">Discount Price</label>
                            <mvc:input path="discountPrice" class="form-control"  />
                        </div>

                        <button type="submit" class="btn btn-primary">Submit</button>
                    </mvc:form>
                </div>
            </div>
        </div>
    </body>
</html>

