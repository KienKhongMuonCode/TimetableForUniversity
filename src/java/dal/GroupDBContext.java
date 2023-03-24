/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author T490
 */
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Group;
import model.Session;
import model.Subject;

public class GroupDBContext extends DBContext<Group> {

    public ArrayList<Group> getSubject(String stdid) {
        ArrayList<Group> groups = new ArrayList<>();
        try {
            String sql = "Select g.gid,sub.subid, sub.subname from [Group] g\n"
                    + "INNER JOIN Student_Group stdg ON stdg.gid = g.gid\n"
                    + "Inner join Student st on st.stdid = stdg.stdid\n"
                    + "inner join [Subject] sub on sub.subid = g.subid\n"
                    + "Where stdg.stdid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, stdid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Group g = new Group();
                Subject s = new Subject();
                g.setId(rs.getInt("gid"));
                s.setId(rs.getInt("subid"));
                s.setName(rs.getString("subname"));
                g.setSubject(s);
                groups.add(g);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return groups;
    }

    public Group fliter(int gid, String lid, int subid) {

        try {
            String sql = "SELECT DISTINCT ses.sesid\n"
                    + "                     FROM [Session] ses\n"
                    + "                     LEFT JOIN [Group] g ON g.gid = ses.gid\n"
                    + "                     INNER JOIN [Student_Group] stdg ON stdg.gid = g.gid\n"
                    + "                     INNER JOIN Student s ON stdg.stdid = s.stdid\n"
                    + "                     INNER JOIN Lecturer l ON l.lid = ses.lid\n"
                    + "                     INNER JOIN [Subject] sub ON sub.subid = g.subid\n"
                    + "                     WHERE g.gid = ? and l.lid = ? and sub.subid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            stm.setString(2, lid);
            stm.setInt(3, subid);
            ResultSet rs = stm.executeQuery();
            ArrayList<Session> sessions = new ArrayList<>();
            while (rs.next()) {
                SessionDBContext sesDB = new SessionDBContext();
                Session ses = sesDB.get(rs.getInt("sesid"));
                sessions.add(ses);
            }
            Group group = new Group();
            group.setId(gid);
            group.setSessions(sessions);
            StudentDBContext stddb = new StudentDBContext();
            group.setStudents(stddb.getlist(gid));
            return group;
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public void insert(Group model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Group model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Group model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Group get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Group> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
        GroupDBContext gdb = new GroupDBContext();
        ArrayList<Group> g = gdb.getSubject("HoangTVHE131415");
        for (Group group : g) {
            System.out.println(group);
        }
    }

}