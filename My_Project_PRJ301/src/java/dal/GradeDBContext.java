/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Assessment;
import entity.Exame;
import entity.Grade;
import entity.Student;
import entity.Subject;
import java.util.ArrayList;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class GradeDBContext extends DBContext<Grade> {

    public ArrayList<Grade> getGradeStudent(int sid, int subid) {
        ArrayList<Grade> grades = new ArrayList<>();
        try {
            String sql = "select \n"
                    + "g.grid, g.score,\n"
                    + "e.eid, e.startdate, e.enddate,\n"
                    + "a.asid, a.asname, a.weight, a.comment,\n"
                    + "s.subid, s.suname, s.credit,\n"
                    + "st.sid, st.sname\n"
                    + "from Grade g \n"
                    + "	inner join Exame e on g.eid = e.eid\n"
                    + "	inner join Assessment a on a.asid = e.asid\n"
                    + "	inner join Subject s on s.subid = a.subid\n"
                    + "	inner join Student st on st.sid = g.sid\n"
                    + "where st.sid = ? and s.subid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sid);
            stm.setInt(2, subid);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Grade g = new Grade();
                Exame e = new Exame();
                Assessment a = new Assessment();
                Subject sub = new Subject();
                Student s = new Student();

                g.setId(rs.getInt("grid"));
                g.setScore(rs.getFloat("score"));

                s.setId(rs.getInt("sid"));
                s.setName(rs.getString("sname"));
                g.setStudent(s);

                e.setId(rs.getInt("eid"));
                e.setStarDate(rs.getDate("startdate"));
                e.setEndDate(rs.getDate("enddate"));
                g.setExame(e);

                a.setId(rs.getInt("asid"));
                a.setName(rs.getString("asname"));
                a.setWeight(rs.getFloat("weight"));
                a.setComment(rs.getString("comment"));
                e.setAssessment(a);
                g.setExame(e);

                sub.setId(rs.getInt("subid"));
                sub.setName(rs.getString("suname"));
                a.setSubject(sub);
                e.setAssessment(a);
                g.setExame(e);

                grades.add(g);

            }
        } catch (SQLException ex) {
            Logger.getLogger(LessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return grades;
    }

    @Override
    public ArrayList<Grade> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
