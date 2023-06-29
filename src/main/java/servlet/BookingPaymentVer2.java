package servlet;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vnpay.common.Config;
import connection.DbCon;
import dao.OrderDao;
import dao.TourDao;
import jakarta.mail.MessagingException;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AccountDTO;
import model.BookTour;
import model.EmailSender;
import model.Tour;
import servlet.BookingServlet;

/**
 *
 * @author thong
 */
public class BookingPaymentVer2 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");

        // Tiếp tục xử lý địa chỉ
        // Ví dụ: In ra giá trị địa chỉ
        String address = city + ", " + district + ", " + ward;
//        String address = request.getParameter("address");
        int adults = Integer.parseInt(request.getParameter("adults"));
        int children = Integer.parseInt(request.getParameter("children"));
        String note = request.getParameter("note");
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();

        AccountDTO acc = (AccountDTO) request.getSession().getAttribute("acc");

        if (acc != null) {
            try {
                request.setAttribute("acc", acc);
                String tourId = request.getParameter("id");
                BookTour orderModel = new BookTour();
                orderModel.setOrderId(Integer.parseInt(tourId));
                orderModel.setUser_id(acc.getId());
                orderModel.setQuantityAd(adults);
                orderModel.setQuantityChildren(children);
                orderModel.setAddress(address);
                orderModel.setName(fullName);
                orderModel.setPhone(phone);
                orderModel.setEmail(email);
                orderModel.setNote(note);
                orderModel.setDate(formatter.format(date));

                // Calculate and set the total amount
                TourDao tourDao = new TourDao(DbCon.getConnection());
                int tId = Integer.parseInt(tourId);
                Tour tour = tourDao.getSingleTour(tId);
                int remainingSeats = tour.getSeat();

                float adultPrice = tour.getPrice();
                float childrenPrice = adultPrice / 2;
                float totalAmount = (adultPrice * adults) + (childrenPrice * children);
                if ((adults + children) > remainingSeats) {
                    response.getWriter().println("The number of adults and children exceeds the available seats.");
                    request.setAttribute("exceedSeats", true);
                    return;
                }

                orderModel.setTotalAmount(totalAmount);

                // Insert the order into the database
                OrderDao orderDao = new OrderDao(DbCon.getConnection());
                boolean result = orderDao.insertOrder(orderModel);

                if (result) {
                    // Update the remaining seats in the tour
                    remainingSeats = tour.getSeat();
                    remainingSeats -= (adults + children);
                    tour.setSeat(remainingSeats);

                    String vnp_Version = "2.1.0";
                    String vnp_Command = "pay";
                    String orderType = "Booking payment";
                    long amount = 200000 * 100;
//        String bankCode = "VNPAYQR";
//        String bankCode = "VNBANK";
                    String bankCode = "";
//        String bankCode = "INTCARD";
//        String bankCode = "NCB";
                    String vnp_TxnRef = Config.getRandomNumber(8);
                    String vnp_IpAddr = Config.getIpAddress(request);
                    String vnp_TmnCode = Config.vnp_TmnCode;

                    Map<String, String> vnp_Params = new HashMap<>();
                    vnp_Params.put("vnp_Version", vnp_Version);
                    vnp_Params.put("vnp_Command", vnp_Command);
                    vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
                    vnp_Params.put("vnp_Amount", String.valueOf(amount));
                    vnp_Params.put("vnp_CurrCode", "VND");

                    if (bankCode != null && !bankCode.isEmpty()) {
                        vnp_Params.put("vnp_BankCode", bankCode);
                    }
                    vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
                    vnp_Params.put("vnp_OrderInfo", "Thanh toan don dat ban an :" + vnp_TxnRef);
                    vnp_Params.put("vnp_OrderType", orderType);

                    String locate = "en";
                    if (locate != null && !locate.isEmpty()) {
                        vnp_Params.put("vnp_Locale", locate);
                    } else {
                        vnp_Params.put("vnp_Locale", "vn");
                    }
                    vnp_Params.put("vnp_ReturnUrl", Config.vnp_Returnurl);
                    vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

                    Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
//                    SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
//                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

                    String vnp_CreateDate = formatter.format(cld.getTime());
                    vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

                    cld.add(Calendar.MINUTE, 15);
                    String vnp_ExpireDate = formatter.format(cld.getTime());
                    vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

                    List fieldNames = new ArrayList(vnp_Params.keySet());
                    Collections.sort(fieldNames);
                    StringBuilder hashData = new StringBuilder();
                    StringBuilder query = new StringBuilder();
                    Iterator itr = fieldNames.iterator();
                    while (itr.hasNext()) {
                        String fieldName = (String) itr.next();
                        String fieldValue = (String) vnp_Params.get(fieldName);
                        if ((fieldValue != null) && (fieldValue.length() > 0)) {
                            //Build hash data
                            hashData.append(fieldName);
                            hashData.append('=');
                            hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                            //Build query
                            query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                            query.append('=');
                            query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                            if (itr.hasNext()) {
                                query.append('&');
                                hashData.append('&');
                            }
                        }
                    }
                    String queryUrl = query.toString();
                    String vnp_SecureHash = Config.hmacSHA512(Config.vnp_HashSecret, hashData.toString());
                    queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
                    String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
                    com.google.gson.JsonObject job = new JsonObject();
                    job.addProperty("code", "00");
                    job.addProperty("message", "success");
                    job.addProperty("data", paymentUrl);
                    Gson gson = new Gson();
                    response.getWriter().write(gson.toJson(job));

                    tourDao.updateTour(tour);
//                    EmailSender.sendConfirmationEmail(email, orderModel, tour);
//                                        request.getRequestDispatcher("confirmPage.jsp").forward(request, response);

//                    request.getRequestDispatcher("orderNoti.jsp").forward(request, response);
                } else {
                    response.getWriter().println("Order failed");
                }
                return;
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(BookingServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(BookingServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            // Người dùng chưa đăng nhập, chuyển hướng đến trang đăng nhập
            response.sendRedirect("Login");
            return;
        }
    }

}
