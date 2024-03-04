/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.lecturer;

import dal.LessionDBContext;
import entity.Attendance;
import entity.Lession;
import entity.Student;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author PC
 */
public class AttendanceTaking extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int leid = Integer.parseInt(request.getParameter("id"));
        LessionDBContext db = new LessionDBContext();
        ArrayList<Attendance> atts = db.getAttendencesByLession(leid);
        request.setAttribute("atts", atts);
        request.getRequestDispatcher("../view/lecturer/attendance.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int leid = Integer.parseInt(request.getParameter("id"));
        LessionDBContext db = new LessionDBContext();
        ArrayList<Student> students = db.getStudentsByLession(leid);
        ArrayList<Attendance> atts = new ArrayList<>();
        Lession lession = new Lession();
        lession.setId(leid);
        for (Student student : students) {
            Attendance a = new Attendance();
            a.setLession(lession);
            a.setStudent(student);
            a.setDescription(request.getParameter("description" + student.getId()));
            a.setPresent(request.getParameter("present" + student.getId()).equals("yes"));
            atts.add(a);
        }
        db.takeAttendances(leid, atts);
        response.sendRedirect("attendance?id=" + leid);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
