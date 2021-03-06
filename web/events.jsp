<!DOCTYPE html>
<%@page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>PUBNGO</title>
    <meta name="description" content="We provide platform where public and NGO can communicate with each other on a same platform.">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css">
</head>
<% 
    Class.forName("org.sqlite.JDBC");
    Connection con=DriverManager.getConnection("jdbc:sqlite:D://a.db");
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("Select * from evt");
%>
<body>
    
    <nav class="navbar navbar-light navbar-expand-lg fixed-top" id="mainNav" style="background-color: #807c7c;">
        <div class="container"><a class="navbar-brand js-scroll-trigger" href="#page-top">Public NGO</a><button data-toggle="collapse" data-target="#navbarResponsive" class="navbar-toggler navbar-toggler-right" type="button" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation"><i class="fa fa-align-justify"></i></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="index.jsp">Home</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="#services">Services</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="#">About</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="#contact">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <section>
		<h1 align="center">Watch The Events</h1>
		<button class="btn btn-primary" type="button" style="margin: 0% 2% 0% 40% ;">Create</button>
		<button class="btn btn-primary" type="button">See Locations</button>
        <div class="container" style="margin: 3% 2%;"></div>
        <table border="2" width="80%" align="center">
            <tr>
                <td>Event Name</td>
                <td>Location</td>
                <td>Date</td>
            </tr>
            <% while(rs.next()){%> 
            <tr>
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(2)%></td>
            </tr>
            <%}%>
        </table>
    </section>
    <section class="text-center">
        <div class="container"><label class="text-center" style="font-size: 24px;">Create An Event</label></div>
        <div class="form-group">
            <form action="create" method="post">
                <label style="margin: 0px 0px 18px 5px;">Name: &nbsp; &nbsp;<input type="text" style="background-color: rgb(255,248,248);" name="uname"></label>
                <label style="margin: 0px 0px 18px 5px;">Event Name: &nbsp;<input type="text" style="background-color: rgb(255,248,248);" name="ename"></label><br><br>
                <label style="margin: 0px 10px 18px 5px;">Location: &nbsp;<input type="text" style="background-color: rgb(255,248,248);" name="loc"></label>
                <label style="margin: 0px 10px 18px 5px;">Date(MM-DD-YYYY): &nbsp;<input type="text" style="background-color: rgb(255,248,248);" name="dt"></label><br><br>
	        <label style="margin: 0px 10px 18px 5px;">Description: &nbsp;<br><textarea rows="7" cols="50" style="background-color: rgb(255,248,248);"></textarea></label><br><br>
		<button class="btn btn-primary" type="submit">Create</button>
            </form>
	</div>
    </section>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
    <script src="assets/js/creative.js"></script>
</body>

</html>