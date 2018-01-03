<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form"  %>

<%@include file="header.jsp" %>

        <div class="row content">
            <div class="col-sm-12 text-left"> 
                <div class="container">
                    <mvc:form modelAttribute="categoryRoom" action="/hotelWeb/savecategoryRoom" method="post" role="form">
                        <legend>${title}</legend>
                        <c:if test="${action=='edit'}">
                            <div class="form-group">
                                <label for="">ID</label>
                                <mvc:input path="categoryID" readonly="true" class="form-control"/>
                            </div>
                        </c:if>
                        <div class="form-group">
                            <label for="">Type</label>
                            <mvc:input path="type"  class="form-control"  />
                        </div>

                        <div class="form-group">
                            <label for="">Size</label>
                            <mvc:input path="size" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="">Description</label>
                            <mvc:input path="description" class="form-control"  />
                        </div>
                        <div class="form-group">
                            <label for="">number Of Person</label>
                            <mvc:input path="numberOfPerson" class="form-control"  />
                        </div>
                        <div class="form-group">
                            <label for="">Price</label>
                            <mvc:input path="price" class="form-control"  />
                        </div>
                     <button type="submit" class="btn btn-primary">Submit</button>
                    </mvc:form>
                </div>
            </div>
        </div>
    </body>
</html>

