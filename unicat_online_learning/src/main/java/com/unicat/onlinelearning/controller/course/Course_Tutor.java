/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.controller.course;

import com.unicat.onlinelearning.dao.CategoryDAO;
import com.unicat.onlinelearning.dao.CoursesDAO;
import com.unicat.onlinelearning.dao.LessonDAO;
import com.unicat.onlinelearning.dto.Lesson;
import com.unicat.onlinelearning.dto.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Hashtable;

/**
 *
 * @author Admin
 */
@WebServlet("/tutor/manager/course")
public class Course_Tutor extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CoursesDAO cd = new CoursesDAO();
        LessonDAO ld = new LessonDAO();
        if (req.getParameter("Request") != null) {
            String Request = req.getParameter("Request");
            int CourseID = Integer.parseInt(req.getParameter("txtCourseID"));
            com.unicat.onlinelearning.dto.Course c = cd.getCourseByCourseID(CourseID);
            if (Request.equals("RequestUnPublish")) {
                c.setRequest("RequestUnPublish");
            }
            if (Request.equals("RequestPublish")) {
                c.setRequest("RequestPublish");
            }
            if (Request.equals("Delete")) {
                c.setRequest("Deleted");
                c.setPublishStatus(0);
            }
            if (Request.equals("Recover")) {
                c.setRequest("None");
                c.setPublishStatus(0);
            }
            cd.updateCourse(c);
            String NowPage = "";
            if (req.getParameter("NowPage") != null) {
                NowPage = req.getParameter("NowPage");
            }
            if (NowPage.equals("View")) {
                resp.sendRedirect(req.getContextPath() + "/tutor/manager/course?page=view&CourseID=" + c.getCourseID());
            } else {
                if (NowPage.equals("UpdatePage")) {
                    resp.sendRedirect(req.getContextPath() + "/tutor/manager/course?page=UpdatingCourse");
                } else {
                    if (NowPage.equals("DeletedPage")) {

                        resp.sendRedirect(req.getContextPath() + "/tutor/manager/course?page=DeletedCourse");
                    } else {
                        resp.sendRedirect(req.getContextPath() + "/tutor/manager/course?page=CoursePublished");
                    }
                }
            }
        } else {

            if (req.getParameter("Update") != null) {
                String Update = req.getParameter("Update");
                if (Update.equals("UpdateCourseInfor")) {
                    int CourseID = Integer.parseInt(req.getParameter("CourseID"));
                    com.unicat.onlinelearning.dto.Course c = cd.getCourseByCourseID(CourseID);
                    int CategoryID = Integer.parseInt(req.getParameter("txtCategoryID"));

                    c.setCategoryID(CategoryID);
                    c.setName(req.getParameter("txtName"));
                    c.setImage(req.getParameter("txtCourseImage"));
                    c.setCourseInfo(req.getParameter("txtCourseInf"));
                    c.setDescription(req.getParameter("txtCourseDescription"));
                    cd.updateCourse(c);
                    resp.sendRedirect(req.getContextPath() + "/tutor/manager/course?page=view&CourseID=" + c.getCourseID());
                }
                if (Update.equals("UpdateLesson")) {
                    int LessonNum = Integer.parseInt(req.getParameter("LessonNum"));
                    int CourseID = Integer.parseInt(req.getParameter("CourseID"));
                    Lesson l = ld.getLesson(LessonNum, CourseID);

                    l.setName(req.getParameter("txtName"));
                    l.setTitle(req.getParameter("txtTitle"));
                    l.setDescription(req.getParameter("txtDescription"));
                    l.setVideo(req.getParameter("txtVideo"));
                    ld.updateLesson(l);
                    resp.sendRedirect(req.getContextPath() + "/tutor/manager/course?page=view&CourseID=" + l.getCourseID());
                }
                if (Update.equals("AddLesson")) {
                    int LessonNum = Integer.parseInt(req.getParameter("LessonNum"));
                    int CourseID = Integer.parseInt(req.getParameter("CourseID"));

                    ld.insertLessonNum(LessonNum, CourseID);
                    resp.sendRedirect(req.getContextPath() + "/tutor/manager/course?page=UpdateCourse&CourseID=" + CourseID + "&Lesson=" + LessonNum);
                }
                if (Update.equals("DeleteLesson")) {
                    int LessonNum = Integer.parseInt(req.getParameter("LessonNum"));
                    int CourseID = Integer.parseInt(req.getParameter("CourseID"));

                    ld.deleteLessonNum(LessonNum, CourseID);
                    resp.sendRedirect(req.getContextPath() + "/tutor/manager/course?page=view&CourseID=" + CourseID);
                }
            }
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String p = req.getParameter("page");
        LessonDAO LessonDAO = new LessonDAO();
        CategoryDAO CategoryDAO = new CategoryDAO();
        req.setAttribute("CategoryDAO", CategoryDAO);
        CoursesDAO cd = new CoursesDAO();
        User user = (User) req.getSession().getAttribute("tutor");
        req.setAttribute("p", p);
        int NumRequest = cd.getTutorRequestPublishCourse(user.getUserID()).size() + cd.getTutorRequestUnPublishCourse(user.getUserID()).size();
        req.setAttribute("NumRequest", NumRequest);
        if (p.equals("CoursePublished")) {
            //View List Published
            ArrayList<com.unicat.onlinelearning.dto.Course> list = cd.getAllTutorCoursePublished(user.getUserID());
            req.setAttribute("list", list);
            req.getRequestDispatcher("/TutorPublishedCourse.jsp").forward(req, resp);
        } else {
            if (p.equals("UpdateCourse")) {
                //Update Course
                int CourseID = 0;
                int LessonNum = 0;
                String check = req.getParameter("Lesson");
                if (check == null) {
                    try {
                        CourseID = Integer.parseInt(req.getParameter("CourseID"));
                        if (CourseID > cd.getCourseByLatestCourseID().getCourseID()) {
                            CourseID = -1;
                        }
                    } catch (NumberFormatException e) {
                        CourseID = -1;
                    }
                } else {
                    try {
                        CourseID = Integer.parseInt(req.getParameter("CourseID"));
                        LessonNum = Integer.parseInt(req.getParameter("Lesson"));
                        if (CourseID > cd.getCourseByLatestCourseID().getCourseID()) {
                            CourseID = -1;
                        }

                    } catch (NumberFormatException e) {
                        CourseID = -1;
                        LessonNum = -1;
                    }
                }
                if (cd.CheckTutorCreatedCourseID(CourseID, user.getUserID()) && CourseID > 0) {
                    com.unicat.onlinelearning.dto.Course c = cd.getCourseByCourseID(CourseID);
                    req.setAttribute("course", c);

                    if (LessonNum <= 0) {
                        //Update Course Information only
                        req.getRequestDispatcher("/course_manager_update_transaction.jsp").forward(req, resp);
                    } else {
                        //Update Lesson of course
                        if (LessonNum > LessonDAO.getNumberOfLessonsOfCourse(CourseID) || LessonNum <= 0) {
                            resp.sendRedirect(req.getContextPath() + "/tutor/manager/course?page=CoursePublished");
                        } else {
                            Lesson lesson = LessonDAO.getLesson(LessonNum, CourseID);
                            req.setAttribute("lesson", lesson);
                            req.getRequestDispatcher("/lesson_manager_update.jsp").forward(req, resp);
                        }
                    }

                } else {

                    resp.sendRedirect(req.getContextPath() + "/tutor/manager/course?page=CoursePublished");
                }
                //End Update   
            } else {
                // View Course
                if (p.equals("view")) {
                    int CourseID = 0;
                    try {
                        CourseID = Integer.parseInt(req.getParameter("CourseID"));
                        if (CourseID > cd.getCourseByLatestCourseID().getCourseID()) {
                            CourseID = -1;
                        }
                    } catch (NumberFormatException e) {
                        CourseID = -1;
                    }

                    if (cd.CheckTutorCreatedCourseID(CourseID, user.getUserID()) && CourseID > 0) {
                        com.unicat.onlinelearning.dto.Course c = cd.getCourseByCourseID(CourseID);
                        ArrayList<Lesson> listlesson = LessonDAO.getAllLessonByCourseID(CourseID);
                        req.setAttribute("c", c);

                        req.setAttribute("listlesson", listlesson);
                        req.getRequestDispatcher("/TutorViewCourse.jsp").forward(req, resp);
                    } else {
                        resp.sendRedirect(req.getContextPath() + "/tutor/manager/course?page=CoursePublished");
                    }

                } else {
                    if (p.equals("UpdatingCourse")) {
                        ArrayList<com.unicat.onlinelearning.dto.Course> list = cd.getTutorUpdatingCourse(user.getUserID());
                        ArrayList<com.unicat.onlinelearning.dto.Course> listcnew = cd.getNewCreatedCourse(user.getUserID());
                        req.setAttribute("listcnew", listcnew);
                        req.setAttribute("list", list);
                        req.getRequestDispatcher("/TutorUpdatingCourse.jsp").forward(req, resp);
                    } else {
                        if (p.equals("DeletedCourse")) {
                            ArrayList<com.unicat.onlinelearning.dto.Course> list = cd.getDeletedCourse(user.getUserID());
                            req.setAttribute("list", list);
                            req.getRequestDispatcher("/TutorDeletedCourse.jsp").forward(req, resp);
                        } else {
                            resp.sendRedirect(req.getContextPath() + "/home");
                        }
                    }
                }

                //End View
            }
        }

    }

}
