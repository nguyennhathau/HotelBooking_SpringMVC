<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form"  %>

<%@include file="header.jsp" %>

<div class="row content">
    <div class="col-sm-6 col-md-4 col-md-offset-1 text-left"> 

        <c:if test="${mess3 != null}">
            <div class="alert alert-success alert-dismissable" style="color:red;">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                ${mess3}
            </div>
        </c:if>
        <form action="/hotelWeb/changepass" method="post" role="form">
            <legend>Change Password</legend>
            <input type="text" name="username" value="${sessionScope.username}">
            <div class="form-group">
                <label for="">Enter Old Password </label>
                <input type="text" class="form-control" name="oldPassword" placeholder="Input password">
                <c:if test="${mess1!=null}">
                    <span class="help-block text-danger" style="color:red;">${mess1}</span> 
                </c:if>  
            </div>
            <div class="form-group">
                <label for="">Enter New Password </label>
                <input type="text" class="form-control" name="newpassword" placeholder="Input password">
            </div>

            <div class="form-group">
                <label for="">Confirm Password</label>
                <input type="text" class="form-control" name="confirm" placeholder="Input again">
                <c:if test="${mess2!=null}">
                    <span class="help-block text-danger" style="color:red;">${mess2}</span> 
                </c:if>                   
            </div>
            <button type="submit" class="btn btn-primary">save</button>
        </form>
    </div>
</div>
</body>
</html>

