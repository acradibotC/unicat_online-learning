package com.unicat.onlinelearning.controller.blog;

import com.unicat.onlinelearning.dao.BlogDAO;
import com.unicat.onlinelearning.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/blog")
public class Blog extends HttpServlet {

    public static BlogDAO BlogDAO = new BlogDAO();
    public static UserDAO UserDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("StatusHome", 4);
        req.setAttribute("BlogDAO", BlogDAO);
        req.setAttribute("UserDAO", UserDAO);

        //Paging (category.jsp)
        ArrayList<com.unicat.onlinelearning.dto.Blog> AllBlog = BlogDAO.getAllBlogg();
        int page, numPerPage = 6;
        int size = AllBlog.size();
        int number = (size % numPerPage == 0 ? (size / numPerPage) : ((size / numPerPage) + 1));
        String xpage = req.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start = (page - 1) * numPerPage;
        int end = Math.min(page * numPerPage, size);
        ArrayList<com.unicat.onlinelearning.dto.Blog> list;
        if (AllBlog.isEmpty()) {
            list = null;
        } else {
            list = BlogDAO.getListBySearching(AllBlog, start, end);
        }
        req.setAttribute("list", list);
        req.setAttribute("page", page);
        req.setAttribute("number", number);
        req.setAttribute("AllBlog", AllBlog);
        req.getRequestDispatcher("/blog.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

}
