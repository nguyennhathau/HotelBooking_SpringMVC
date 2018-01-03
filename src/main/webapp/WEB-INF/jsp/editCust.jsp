<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="header.jsp" %>

        <div class="row content">
            <div class="col-sm-12 text-left"> 
                <div class="container">
                    <mvc:form modelAttribute="cust" action="/hotelWeb/savecust" method="post" role="form">
                        <legend>${title}</legend>
                            <div class="form-group">
                                <label for="">ID</label>
                                <mvc:input path="custID" readonly="true" class="form-control"/>
                            </div>
                        
                        <div class="form-group">
                            <label for="">Full Name</label>
                            <mvc:input path="fullName"  class="form-control"  />
                        </div>

                        <div class="form-group">
                            <label for="">Email</label>
                            <mvc:input path="email" class="form-control" type="password" />
                        </div>
                        <div class="form-group">
                            <label for="">Phone</label>
                            <mvc:input path="phone" class="form-control"  />
                        </div>
                        <div class="form-group">
                            <label for="">Address</label>
                            <mvc:input path="address" class="form-control"  />
                        </div>

                        <button type="submit" class="btn btn-primary">Submit</button>
                    </mvc:form>
                </div>
            </div>
        </div>
    </body>
</html>

