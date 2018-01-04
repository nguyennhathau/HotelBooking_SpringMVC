<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="header.jsp" %>
<div class="row content">
    <div class="col-sm-12 text-left"> 
        <div class="container">
            <h2>Manage Account</h2>
            <button onclick="location.href = 'newAcc'" class="btn btn-default">new Acc</button>
            <input class="form-control" id="myInput" type="text" placeholder="Search.." style="width: 300px; float: right;"><br>

            <table class="table">
                <thead>
                    <tr>
                        <th>
                            <div>
                                <button class="btn btn-sm" onclick="location.href = '/hotelWeb/managerAcc?pages=${pages}'"><i class="fa fa-caret-up"></i></button>
                                <button class="btn btn-sm" onclick="location.href = '/hotelWeb/managerAccDes?pages=${pages}'"><i class="fa fa-caret-down"></i></button>
                            </div>
                        </th>
                        <th>
                        </th>
                        <th><div>
                                <button class="btn btn-sm" onclick="location.href = '/hotelWeb/sortbystatus?pages=${pages}'"><i class="fa fa-caret-up"></i></button>
                                <button class="btn btn-sm" onclick="location.href = '/hotelWeb/sortbystatusDesc?pages=${pages}'"><i class="fa fa-caret-down"></i></button>
                            </div></th>
                        <th>
                            <div>
                                <button class="btn btn-sm" onclick="location.href = '/hotelWeb/sortbyrole?pages=${pages}'"><i class="fa fa-caret-up"></i></button>
                                <button class="btn btn-sm" onclick="location.href = '/hotelWeb/sortbyroleDesc?pages=${pages}'"><i class="fa fa-caret-down"></i></button>
                            </div>
                        </th>
                        <th></th>

                    </tr>
                    <tr>
                        <th>ID</th>
                        <th>Username</th>
                        <th>status</th>
                        <th>Role</th>
                        <th>password</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody id="myTable">
                    <c:forEach var="acc" items="${accList}">
                        <tr>
                            <th>${acc.accountID}</th>
                            <th>${acc.userName}</th>
                            <th class="text-primary">${acc.status}</th>
                            <th>${acc.role.roleName}</th>   
                            <th>******</th>
                            <th><button onclick="location.href = 'editAcc/${acc.accountID}'" class="btn btn-default">Edit </button></th>                                   
                            <th><button onclick="location.href = 'deleteAcc/${acc.accountID}'" class="btn btn-default">Delete</button></th>                                   
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <ul class="pagination">
                <!--sort by id asc-->
                <c:if test="${sort=='sortByidAsc'}">
                <li><a href="managerAcc?pages=1">«</a></li>
                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <c:set var="active" value="${pages}"/>
                    <li <c:if test="${active == i}">class="active"</c:if>>
                        <a href="managerAcc?pages=${i}">
                            <c:out value="${i}"/></a></li>

                </c:forEach>
                <li><a href="managerAcc?pages=${totalPages}">»</a></li>
                </c:if>
                
                 <!--sort by id desc-->
                <c:if test="${sort=='sortByidDesc'}">
                <li><a href="managerAccDes?pages=1">«</a></li>
                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <c:set var="active" value="${pages}"/>
                    <li <c:if test="${active == i}">class="active"</c:if>>
                        <a href="managerAccDes?pages=${i}">
                            <c:out value="${i}"/></a></li>

                </c:forEach>
                <li><a href="managerAccDes?pages=${totalPages}">»</a></li>
                </c:if>
                 <!--sort by status-->
                <c:if test="${sort=='sortByStatus'}">
                <li><a href="sortbystatus?pages=1">«</a></li>
                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <c:set var="active" value="${pages}"/>
                    <li <c:if test="${active == i}">class="active"</c:if>>
                        <a href="sortbystatus?pages=${i}">
                            <c:out value="${i}"/></a></li>

                </c:forEach>
                <li><a href="sortbystatus?pages=${totalPages}">»</a></li>
                </c:if>
                 <!--sort by status desc-->
                <c:if test="${sort=='sortByStatusDesc'}">
                <li><a href="sortbystatusDesc?pages=1">«</a></li>
                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <c:set var="active" value="${pages}"/>
                    <li <c:if test="${active == i}">class="active"</c:if>>
                        <a href="sortbystatusDesc?pages=${i}">
                            <c:out value="${i}"/></a></li>

                </c:forEach>
                <li><a href="sortbystatusDesc?pages=${totalPages}">»</a></li>
                </c:if>
                 <!--sort by role-->
                <c:if test="${sort=='sortByRole'}">
                <li><a href="sortbyrole?pages=1">«</a></li>
                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <c:set var="active" value="${pages}"/>
                    <li <c:if test="${active == i}">class="active"</c:if>>
                        <a href="sortbyrole?pages=${i}">
                            <c:out value="${i}"/></a></li>

                </c:forEach>
                <li><a href="sortbyrole?pages=${totalPages}">»</a></li>
                </c:if>
                 <!--sort by role desc-->
                <c:if test="${sort=='sortByRoleDesc'}">
                <li><a href="sortbyroleDesc?pages=1">«</a></li>
                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <c:set var="active" value="${pages}"/>
                    <li <c:if test="${active == i}">class="active"</c:if>>
                        <a href="sortbyroleDesc?pages=${i}">
                            <c:out value="${i}"/></a></li>

                </c:forEach>
                <li><a href="sortbyroleDesc?pages=${totalPages}">»</a></li>
                </c:if>
            </ul>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $("#myInput").on("keyup", function () {
            var value = $(this).val().toLowerCase();
            $("#myTable tr").filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
</script>
</body>
</html>

