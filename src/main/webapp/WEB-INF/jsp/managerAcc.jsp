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
                        <th><div>
                                <button class="btn btn-sm" type="button"><i class="fa fa-caret-up"></i></button>
                                <button class="btn btn-sm" type="button"><i class="fa fa-caret-down"></i></button>
                            </div></th>
                        <th><div>
                                <button class="btn btn-sm" type="button"><i class="fa fa-caret-up"></i></button>
                                <button class="btn btn-sm" type="button"><i class="fa fa-caret-down"></i></button>
                            </div></th>
                        <th><div>
                                <button class="btn btn-sm" type="button"><i class="fa fa-caret-up"></i></button>
                                <button class="btn btn-sm" type="button"><i class="fa fa-caret-down"></i></button>
                            </div></th>
                        <th><div>
                                <button class="btn btn-sm" type="button"><i class="fa fa-caret-up"></i></button>
                                <button class="btn btn-sm" type="button"><i class="fa fa-caret-down"></i></button>
                            </div></th>

                    </tr>
                    <tr>
                        <th>ID</th>
                        <th>Username</th>
                        <th>password</th>
                        <th>status</th>
                        <th>Role</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody id="myTable">
                    <c:forEach var="acc" items="${accList}">
                        <tr>
                            <th>${acc.accountID}</th>
                            <th>${acc.userName}</th>
                            <th>******</th>
                            <th class="text-primary">${acc.status}</th>
                            <th>${acc.role.roleName}</th>                                   
                            <th><button onclick="location.href = 'editAcc/${acc.accountID}'" class="btn btn-default">Edit </button></th>                                   
                            <th><button onclick="location.href = 'deleteAcc/${acc.accountID}'" class="btn btn-default">Delete</button></th>                                   
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <ul class="pagination">
                <li><a href="managerAcc?pages=1">«</a></li>
                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <c:set var="active" value="${pages}"/>
                    <li <c:if test="${active == i}">class="active"</c:if>>
                        <a href="managerAcc?pages=${i}">
                            <c:out value="${i}"/></a></li>

                </c:forEach>
                <li><a href="managerAcc?pages=${totalPages}">»</a></li>
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

