<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="header.jsp" %>
<div class="row content">
    <div class="col-sm-12 text-left"> 
        <div class="container">
            <script>
                $(document).ready(function () {
                    $('.datepicker').datepicker({
                        uiLibrary: 'bootstrap'
                    })
                });
            </script>
            <!--            <form action="" method="POST" role="form">
                            <div class="form-group">
                                <input type="text" width="270" class="form-control datepicker" id="" placeholder="Input field">
                            </div>
                            <button type="submit" class="btn btn-primary">Search</button>
                        </form>-->
            <h2>Manager Room</h2>
            <!--<button onclick="location.href = 'newRoom'" class="btn btn-default">new Room</button>-->
            
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>IMG</th>                
                        <th>Type</th>
                        <th>Size</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Number Of Person</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>

                    <c:forEach var="roo" items="${listRoom}">
                        <tr>
                            <th>${roo.roomID}</th>
                            <th><a data-toggle="modal" href='#${roo.roomID}'><img src="/hotelWeb/${roo.picturesList[0].url_picture}" alt="imgRoom" style="width:169px;
                                                                                  height: 150px;border: 1px dotted #cccccc; padding: 10px"></a></th>
                            <th>${roo.categoryRoom.type}</th>       
                            <td>${roo.categoryRoom.size}</td>
                            <td>${roo.categoryRoom.description}</td>
                            <td>${roo.categoryRoom.formattedPrice}</td>
                            <td>${roo.categoryRoom.numberOfPerson}</td>      
                            <th><button onclick="location.href = 'deleteRoom/${roo.roomID}'" 
                                        class="btn btn-default">Delete</button></th>                                   
                            <td>
                                <button onclick="location.href = '/hotelWeb/viewIMG/${roo.picturesList[0].picID}'" class="btn btn-default">view Images</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>              
            </table>            
        </div>
    </div>
</div>
<!--//pop up-->
<c:forEach var="roo" items="${listRoom}">
    <div class="modal fade" id="${roo.roomID}">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Image ${roo.roomID} </h4>
                </div>
                <div class="modal-body">
                    <img src="/hotelWeb/${roo.picturesList[0].url_picture}" class="img-responsive" alt="Image">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</c:forEach>
</body>
</html>

