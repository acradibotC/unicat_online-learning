/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.controller;

import com.unicat.onlinelearning.utils.Mail;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.mail.MessagingException;

/**
 *
 * @author Anhnt206
 */
@WebServlet(urlPatterns = {"forgotpassword"})
public class ForgotPassword extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        req.setAttribute("email", email);

        Mail mail = new Mail();
        String newPassword = mail.RandomPass();
        String subject = "Recover Unicat password";
        String message = "<!doctype html>\n"
                + "<html lang=\"en-US\">\n"
                + "\n"
                + "<head>\n"
                + "    <meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\" />\n"
                + "    <meta name=\"description\" content=\"Reset Password Email Template.\">\n"
                + "    <style type=\"text/css\">\n"
                + "        a:hover {text-decoration: underline !important;}\n"
                + "    </style>\n"
                + "</head>\n"
                + "\n"
                + "<body marginheight=\"0\" topmargin=\"0\" marginwidth=\"0\" style=\"margin: 0px; background-color: #f2f3f8;\" leftmargin=\"0\">\n"
                + "    <!--100% body table-->\n"
                + "    <table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"#f2f3f8\"\n"
                + "        style=\"@import url(https://fonts.googleapis.com/css?family=Rubik:300,400,500,700|Open+Sans:300,400,600,700); font-family: 'Open Sans', sans-serif;\">\n"
                + "        <tr>\n"
                + "            <td>\n"
                + "                <table style=\"background-color: #f2f3f8; max-width:670px;  margin:0 auto;\" width=\"100%\" border=\"0\"\n"
                + "                    align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\n"
                + "                    <tr>\n"
                + "                        <td style=\"height:80px;\">&nbsp;</td>\n"
                + "                    </tr>\n"
                + "                    <tr>\n"
                + "                        <td style=\"text-align:center;\">\n"
                + "                        </td>\n"
                + "                    </tr>\n"
                + "                    <tr>\n"
                + "                        <td style=\"height:20px;\">&nbsp;</td>\n"
                + "                    </tr>\n"
                + "                    <tr>\n"
                + "                        <td>\n"
                + "                            <table width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"\n"
                + "                                style=\"max-width:670px;background:#fff; border-radius:3px; text-align:center;-webkit-box-shadow:0 6px 18px 0 rgba(0,0,0,.06);-moz-box-shadow:0 6px 18px 0 rgba(0,0,0,.06);box-shadow:0 6px 18px 0 rgba(0,0,0,.06);\">\n"
                + "                                <tr>\n"
                + "                                    <td style=\"height:40px;\">&nbsp;</td>\n"
                + "                                </tr>\n"
                + "                                <tr>\n"
                + "                                    <td style=\"padding:0 35px;\">\n"
                + "                                        <h1 style=\"color:#1e1e2d; font-weight:500; margin:0;font-size:32px;font-family:'Rubik',sans-serif;\">You have\n"
                + "                                            requested to reset your password</h1>\n"
                + "                                        <span\n"
                + "                                            style=\"display:inline-block; vertical-align:middle; margin:29px 0 26px; border-bottom:1px solid #cecece; width:100px;\"></span>\n"
                + "                                        <p style=\"color:#455056; font-size:15px;line-height:24px; margin:0;\">\n"
                + "                                            We cannot simply send you your old password. A new password is\n"
                + "                                            password has been generated for you. To change your password, please login with new password and change in your profile\n"
                + "                                        </p>\n"
                + "                                        <p\n"
                + "                                            style=\"background:#20e277;text-decoration:none !important; font-weight:500; margin-top:35px; color:#fff;text-transform:uppercase; font-size:14px;padding:10px 24px;display:inline-block;border-radius:50px;\">"+newPassword+"\n"
                + "                                            </p>\n"
                + "                                    </td>\n"
                + "                                </tr>\n"
                + "                                <tr>\n"
                + "                                    <td style=\"height:40px;\">&nbsp;</td>\n"
                + "                                </tr>\n"
                + "                            </table>\n"
                + "                        </td>\n"
                + "                    <tr>\n"
                + "                        <td style=\"height:20px;\">&nbsp;</td>\n"
                + "                    </tr>\n"
                + "                    <tr>\n"
                + "                        <td style=\"text-align:center;\">\n"
                + "                        </td>\n"
                + "                    </tr>\n"
                + "                    <tr>\n"
                + "                        <td style=\"height:80px;\">&nbsp;</td>\n"
                + "                    </tr>\n"
                + "                </table>\n"
                + "            </td>\n"
                + "        </tr>\n"
                + "    </table>\n"
                + "    <!--/100% body table-->\n"
                + "</body>\n"
                + "\n"
                + "</html>";
        try {
            mail.sendEmail("anhnthe153221@fpt.edu.vn", "Nta020601", email, subject, message);
        } catch (MessagingException ex) {
            System.out.println("Send OTP error");
        }

        RequestDispatcher dis = req.getRequestDispatcher("/forgot.jsp");
        dis.forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("/forgot.jsp");
    }

}
