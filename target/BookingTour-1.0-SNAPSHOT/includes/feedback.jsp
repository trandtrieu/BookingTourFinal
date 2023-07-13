<%-- 
    Document   : feedback.jsp
    Created on : Jul 12, 2023, 3:17:07 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
        <div class="modal fade col-md-12" role="dialog" id="feedback">
            <div class="modal-dialog">
                <div class="modal-content" style="border-radius: 10px; margin-top: 60px;">
                    <div class="modal-header">
                        <h2 style="margin-left: 35%">Bình luận</h2>
                    </div>
                    <div class="modal-body">
                        <form action="feedback">
                            <input type="hidden" name="tid" value="${detail.tourId}"/>
                            <b>Viết bình luận:</b>&nbsp;&nbsp;
                            <div class="form-group">
                                <textarea name="subject" placeholder="Viết bình luận.." style="height:200px ; width: 460px;" required="" ></textarea>
                            </div>

                            <b>Đánh giá:</b>&nbsp;&nbsp;
                            <div class="form-group" >
                                <select name = "star" style="border-radius: 100px;" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example " required="">
                                    <option >Ðánh giá sao cho tour </option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5" selected>5</option>
                                </select>
                            </div>
                            <br>


                            <center><button type="submit" class="btn" style="padding-right: 160px;padding-left: 160px; border-radius: 100px; background-color: #7AB730">Bình luận</button></center>

                        </form>
                        <br><br>
                    </div>
                </div>
            </div>
        </div>

        <c:if test="${total == 0}">
            <h3 style="text-align: center; font-style: oblique;">Không có bình luận</h3>
        </c:if>        
        <div class="bg-white" style="padding: 30px; margin-bottom: 30px;">
            <h4 class="text-uppercase mb-4" style="letter-spacing: 5px;">${total} Comments</h4>
            <c:if test="${acc != null}">

                <a data-toggle="modal" data-dismiss="modal" data-target="#feedback">
                    <h4 >
                        Viết nhận xét của bạn
                    </h4>
                </a>
            </c:if>
            <c:forEach items="${listfeedbackbyproduct}" var="f">
                <div class="media mb-4">
                    <img src="img/${f.avatar}" alt="Image" class="img-fluid mr-3 mt-1" style="width: 65px;">

                    <br/>
                    <div class="media-body">
                        <h6><a href="">${f.username}</a> <small><i>${f.date}</i></small></h6>
                        <c:if test="${f.u_id eq acc.id}">
                            <a href="delete-feedback?id=${f.id}" class="float-right btn btn-outline-danger">Xóa</a>

                        </c:if>                          
                        <p class="mb-0">${f.feedback}</p>

                        <c:forEach var="i" begin="0" end="4">
                            <c:if test="${(f.rated_star - i) >= 1}">
                                <div class="reviews-rating__star is-active"></div> 
                            </c:if>    
                            <c:if test="${(f.rated_star - i) < 1 && (f.rated_star - i) > 0}">
                                <div class="reviews-rating__star is-active is-half"></div> 
                            </c:if>
                            <c:if test="${(f.rated_star - i) <= 0}">
                                <div class="reviews-rating__star"></div> 
                            </c:if>
                        </c:forEach>
                    </div>

                </div>
            </c:forEach>


        </div>