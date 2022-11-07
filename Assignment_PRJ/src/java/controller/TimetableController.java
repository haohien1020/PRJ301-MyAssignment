/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.TimeSlotDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import model.Lecture;
import model.Session;
import model.TimeSlot;
import util.DateTimeHelper;

/**
 *
 * @author HP
 */
public class TimetableController  extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse respone ) throws ServletException, IOException {
        processRequest(request, respone);
        
    }

    @Override
    protected void doGet(HttpServletRequest request , HttpServletResponse respone ) throws ServletException, IOException {
         processRequest(request, respone);
    }
    protected void processRequest(HttpServletRequest request , HttpServletResponse respone ) throws ServletException, IOException {
         int lid ;
         try {
            lid = Integer.parseInt(request.getParameter("lid"));
        String raw_from = request.getParameter("from");
        String raw_to = request.getParameter("to");
        java.sql.Date from = null;
        java.sql.Date to = null;
        if (raw_from == null || raw_from.length() == 0){
            Date today = new Date();
            int todayOfWeek = DateTimeHelper.getDayOfWeek(today);
            Date e_from = DateTimeHelper.addDays(today, 2 - todayOfWeek);
            Date e_to = DateTimeHelper.addDays(today, 8 - todayOfWeek);
            from = (java.sql.Date) DateTimeHelper.toDateSql(e_from);
            to = (java.sql.Date) DateTimeHelper.toDateSql(e_to);
            
            
            
        }
        else {
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
        ArrayList<Session> sessions = sesDB.filter(lid, from, to);
        request.setAttribute("sessions", sessions);
        
        LecturerDBContext lecDB = new LecturerDBContext();
        Lecture lecture = lecDB.get(lid);
        request.setAttribute("lecture", lecture);
             ServletResponse response = null;
        
        request.getRequestDispatcher("../view/lecture/timetable.jsp").forward(request, response);
        } catch (Exception e) {
        }

   
    }
}
    

