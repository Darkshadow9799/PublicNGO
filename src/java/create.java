import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
public class create extends HttpServlet {
    public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
    {
        res.setContentType("text/html");
        try {
            Class.forName("org.sqlite.JDBC");
            Connection con=DriverManager.getConnection("jdbc:sqlite:D://a.db");
            String ename=req.getParameter("ename"); // ename ==> Event Organizer Name
            String loc=req.getParameter("loc"); // loc ==> Location
            String dt=req.getParameter("dt"); // dt ==> Date and Time
            int nat=1; // NAT ==> Number of Attendies
            Statement st=con.createStatement();
            String q="insert into evt values('"+ename+"','"+dt+"','"+nat+"','"+loc+"')"; // q ==> Query for Database
            st.executeUpdate(q);
            RequestDispatcher rd=req.getRequestDispatcher("events.jsp");
            rd.forward(req, res);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(create.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
