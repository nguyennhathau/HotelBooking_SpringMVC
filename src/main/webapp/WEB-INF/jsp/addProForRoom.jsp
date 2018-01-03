<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form"  %>

<%@include file="header.jsp" %>

        <div class="row content">
            <div class="col-sm-12 text-left"> 
                <div class="container">
                    <mvc:form modelAttribute="promotionDe" action="/hotelWeb/save" method="POST" role="form">
                        <legend>${title}</legend>
                        <c:if test="${action=='edit'}">
                            <div class="form-group">
                                <label for="">ID</label>
                                <mvc:input path="id" readonly="true" class="form-control"/>
                            </div>
                        </c:if>
                        <div class="form-group">
                            <label for="">ID Room</label>
                            
                            
                            <mvc:select path="room.roomID">
                            <c:forEach var="room" items="${roomList}">  
                                <mvc:option value="${room.roomID}">
                                    <c:if  test="${promotionDe.room.roomID}=${room.roomID}">selected</c:if>
                                    ${room.roomID}
                                </mvc:option>
                            </c:forEach>
                        </mvc:select>
                        </div>

                        <div class="form-group">
                            <label for="">ID Promotion</label>
                            
                            
                            <mvc:select path="promotion.proID">
                            <c:forEach var="promotion" items="${promotionList}">  
                                <mvc:option value="${promotion.proID}">
                                    <c:if  test="${promotionDe.promotion.proID}=${promotion.proID}">selected</c:if>
                                    ${promotion.proID}
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

