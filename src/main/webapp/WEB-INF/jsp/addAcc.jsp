<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form"  %>

<%@include file="header.jsp" %>

        <div class="row content">
            <div class="col-sm-12 text-left"> 
                <div class="container">
                    <mvc:form modelAttribute="acc" action="/hotelWeb/saveAcc" method="POST" role="form">
                        <legend>${title}</legend>
                        <c:if test="${action=='edit'}">
                            <div class="form-group">
                                <label for="">ID</label>
                                <mvc:input path="accountID" readonly="true" class="form-control"/>
                            </div>
                        </c:if>
                        <div class="form-group">
                            <label for="">userName</label>
                            <mvc:input path="userName"  class="form-control"  />
                        </div>

                        <div class="form-group">
                            <label for="">password</label>
                            <mvc:input path="password" class="form-control" type="password" />
                        </div>
                        <div class="form-group">
                            <label for="">status</label>
                            <mvc:input path="status" class="form-control"  />
                        </div>

                        <div class="form-group">
                            <label for="" style="margin-right:10px;">Role</label>
                            <mvc:select path="role.roleID">
                            <c:forEach var="role" items="${listRole}">  
                                <mvc:option value="${role.roleID}">
                                    <c:if  test="${acc.role.roleID}=${role.roleID}">selected</c:if>
                                    ${role.roleName}
                                </mvc:option>
                            </c:forEach>
                        </mvc:select>
                        </div>
                        

                        <button type="submit" class="btn btn-primary">Submit</button>
                    </mvc:form>
                </div>
            </div>
        </div>
    </body>
</html>

