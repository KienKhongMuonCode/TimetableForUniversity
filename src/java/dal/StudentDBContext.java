/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Student;

/**
 *
 * @author T490
 */
public class StudentDBContext extends DBContext<Student> {
    

    public Student get(String username) {
        Student s = new Student();
        try {
            String sql = "select s.stdid, s.stdname from Account a inner join Student s\n"
                    + "on a.username = s.stdid where a.username = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                s.setId(rs.getString("stdid"));
                s.setName(rs.getString("stdname"));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(LecturerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Student> getlist(int gid) {
        try {
            ArrayList<Student> students = new ArrayList<>();
            String sql = "SELECT DISTINCT s.stdid,s.stdname\n"
                    + "FROM [Session] ses \n"
                    + "LEFT JOIN [Group] g ON g.gid = ses.gid\n"
                    + "INNER JOIN [Student_Group] stdg ON stdg.gid = g.gid\n"
                    + "INNER JOIN Student s ON stdg.stdid = s.stdid\n"
                    + "WHERE g.gid = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student student = new Student();
                student.setId(rs.getString("stdid"));
                student.setName(rs.getString("stdname"));
                students.add(student);
            }
            return students;

        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public void insert(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Student get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Student> list() {
        ArrayList<Student> students = new ArrayList<>();
        String sql = "SELECT stdid, stdname FROM Student";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getString("stdid"));
                s.setName(rs.getString("stdname"));
                students.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return students;

    }
//    public static void main(String[] args) {
//        Student s = new Student();
//        StudentDBContext sdb = new StudentDBContext();
//        s= sdb.get("DungNTHE131615");
//        System.out.println(s.toString());
//        
//    }

}
