<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Login</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style type="text/css">
            @media ( min-width : 1200px) .container {
                width:1300px;
            }

            @media ( min-width : 992px) .col-md-4 {
                margin-left:330px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-3">
                    <div class="login-panel panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title" align="center">Sign In</h3>
                        </div>
                        <div class="panel-body">
                            <form name="loginForm"
                                  action="login" method="post">
                                <fieldset>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="UserName"
                                               name="username" type="text">
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Password"
                                               name="password" type="password">
                                    </div>
                                    <c:if test="${not empty message}">
                                        <div class="error" style="color: #ff0000">${message}</div>
                                    </c:if>

                                    <!-- Change this to a button or input when using this as a form -->
                                    <div id="button">
                                        <button type="submit" class="btn btn-lg btn-success center-block">Login</button>

                                    </div>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        
    </body>
</html>