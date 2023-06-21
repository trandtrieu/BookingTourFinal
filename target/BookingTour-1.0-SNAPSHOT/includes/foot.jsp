<%-- 
    Document   : foot.jsp
    Created on : May 20, 2023, 9:56:52 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="fa fa-angle-double-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>
<script src="lib/tempusdominus/js/moment.min.js"></script>
<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

<!-- Contact Javascript File -->
<script src="mail/jqBootstrapValidation.min.js"></script>
<script src="mail/contact.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>
<script src="js/moment.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/css/tempusdominus-bootstrap-4.min.css" integrity="sha512-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" crossorigin="anonymous" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/js/tempusdominus-bootstrap-4.min.js" integrity="sha512-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" crossorigin="anonymous"></script>

<script>
    $(document).ready(function () {
        var today = new Date().toISOString().split('T')[0];
        $("#dateStartSearch").attr('min', today);
    });
</script>
<script>
        function updateCountdown(dateStart, tourId) {
            var countdownElement = document.getElementById('countdown-' + tourId);
            var startDate = moment(dateStart, "YYYY-MM-DD"); // Chuyển đổi ngày bắt đầu thành đối tượng Moment

            function updateTimer() {
                var now = moment();
                var difference = startDate.diff(now); // Tính toán khoảng thời gian còn lại (diff)

                if (difference > 0) {
                    var duration = moment.duration(difference); // Chuyển đổi khoảng thời gian thành đối tượng Duration

                    var days = duration.days();
                    var hours = duration.hours();
                    var minutes = duration.minutes();
                    var seconds = duration.seconds();

                    countdownElement.innerHTML =
                            "Còn " + days + 'd ' + hours + 'h ';
                } else {
                    countdownElement.innerHTML = 'Tour đã bắt đầu!';
                    clearInterval(intervalId);
                }
            }

            // Cập nhật đếm ngược ngay lập tức
            updateTimer();

            // Cập nhật đếm ngược mỗi giây (1000 milliseconds)
            var intervalId = setInterval(updateTimer, 1000);
        }

        function updateAllCountdowns() {
        <c:forEach var="t" items="${myTours}">
            updateCountdown('${t.dateStart}', '${t.tourId}');
        </c:forEach>
        }

        // Gọi hàm updateAllCountdowns sau khi trang đã tải
        document.addEventListener("DOMContentLoaded", function () {
            updateAllCountdowns();
        });





    </script>


