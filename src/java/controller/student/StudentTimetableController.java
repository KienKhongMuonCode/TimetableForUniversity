/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.student;

import controller.auth.BaseRoleController;
import dal.SessionDBContext;
import dal.StudentDBContext;
import dal.TimeSlotDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import model.Account;
import model.Session;
import model.Student;
import model.TimeSlot;
import util.DateTimeHelper;

/**
 *
 * @author T490
 */
public class StudentTimetableController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String stdid = request.getParameter("stdid");
        String raw_from = request.getParameter("from");
        String raw_to = request.getParameter("to");
        java.sql.Date from = null;
        java.sql.Date to = null;
        if (raw_from == null || raw_from.length() == 0) {
            Date today = new Date();
            int todayOfWeek = DateTimeHelper.getDayofWeek(today);
            Date e_from = DateTimeHelper.addDays(today, 2 - todayOfWeek);
            Date e_to = DateTimeHelper.addDays(today, 8 - todayOfWeek);
            from = DateTimeHelper.toDateSql(e_from);
            to = DateTimeHelper.toDateSql(e_to);
        } else {
            from = java.sql.Date.valueOf(raw_from);
            to = java.sql.Date.valueOf(raw_to);
        }

        request.setAttribute("from", from);
        request.setAttribute("to", to);
        request.setAttribute("dates", DateTimeHelper.getDateList(from, to));

        TimeSlotDBContext slotDB = new TimeSlotDBContext();
        ArrayList<TimeSlot> slots = slotDB.list();
        request.setAttribute("slots", slots);

        SessionDBContext sesDB = new SessionDBContext();
        ArrayList<Session> sessions = sesDB.getStudentTimetable(stdid, from, to);
        request.setAttribute("sessions", sessions);

        StudentDBContext sDB = new StudentDBContext();
        Student student = sDB.get(stdid);
        request.setAttribute("student", student);

        request.getRequestDispatcher("../view/student/timetable.jsp").forward(request, response);

    }

//    @Override
//    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
//        processRequest(req, resp, account);
//    }
//
//    @Override
//    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
//        processRequest(req, resp, account);
//    }

   
}
