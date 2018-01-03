<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="header.jsp" %>
<div class="row content">
    <div class="col-sm-12 text-left"> 
        <div class="container">
            <h2>Pictures</h2>
            
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>IMG</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="pic" items="${listPic}">
                        <tr>
                            <td>${pic.picID}</td>
                            <td><img src="/hotelWeb/${pic.url_picture}" alt="room" 
                                     style="width: 100%;height: 100%;border: 
                                     1px dotted #cccccc; padding: 10px"><td>
                            
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            
        </div>
    </div>
</div>
</body>
</html>

