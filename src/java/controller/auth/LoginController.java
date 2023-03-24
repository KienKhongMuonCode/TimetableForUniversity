/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.auth;

/**
 *
 * @author T490
 */
import dal.AccountDBContext;
import dal.GroupDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Account;
import model.Group;

public class LoginController extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie[] listCookie = request.getCookies();
        if (listCookie != null) {
            for (Cookie c : listCookie) {
                if (c.getName().equals("u")) {
                    request.setAttribute("username", c.getValue());
                }
                if (c.getName().equals("p")) {
                    request.setAttribute("password", c.getValue());
                }
            }
        }
        request.getRequestDispatcher("view/auth/login.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        AccountDBContext db = new AccountDBContext();
        Account account = db.get(username, password);
        GroupDBContext gdb = new GroupDBContext();
        ArrayList<Group> groups = gdb.getSubject(username);
        if (account == null) {
//            response.getWriter().println("login failed!");
            response.sendRedirect("login");
        } else {
            Cookie cookieUser = new Cookie("u", username);
            Cookie cookiePassword = new Cookie("p", password);
            cookieUser.setMaxAge(60 * 60 * 24);

            if (remember != null) {
                cookiePassword.setMaxAge(60 * 60 * 24);
            } else {
                cookiePassword.setMaxAge(0);
            }
            response.addCookie(cookieUser);
            response.addCookie(cookiePassword);
            request.setAttribute("groups", groups);
            request.getSession().setAttribute("account", account);
            request.getRequestDispatcher("/view/home.jsp").forward(request, response);
//            response.getWriter().println("login successful!");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
