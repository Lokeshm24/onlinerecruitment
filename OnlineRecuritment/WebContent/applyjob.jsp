<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% if(session.getAttribute("usernameu")==null){
	response.sendRedirect("index.html");} %>
<%@ include file="userside.html" %>  
<%@ include file="usernav.html" %>  
<%@ page import="java.sql.*" %>
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    

    <title>Apply For Job</title>

    <!-- Bootstrap core CSS -->
    <link href="./dashboard%20files/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="./dashboard%20files/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="./dashboard%20files/dashboard.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="./dashboard%20files/ie-emulation-modes-warning.js.download"></script>

	<!-- custom css for side bar -->
	<link rel="stylesheet" href="dashboard%20files/sidebar.css">

  </head>

  <body>

            
            <!-- Main Dashboard -->
            
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">Apply For JOB</h1>
          </div>
          
          <!--  Database Connection -->
       <%! String url="jdbc:oracle:thin:@localhost:1521:xe";
       String id="hr";
       String pass="abc";
       %>
  <%   
    try{
    	
  	  Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection(url,id,pass);
        PreparedStatement ps=con.prepareStatement("select * from company");
        ResultSet rs=ps.executeQuery();
        %>        
          
          
<div class="col-md-10 col-md-offset-2">
  <table class="table table-striped">
     <tr>
   <th>Company Registered</th>
   <th>company Address</th>
   <th>Email</th>
   <th>Phone</th>
   <th>Post Available</th>
   <th>Cutoff(%)</th>
   <th>Apply
    </tr>
 <% 
        while(rs.next()){
      %>  	
        	<tr>
        	<tr>
        	<td><%=rs.getString("company_name").toUpperCase() %></td>
        	<td><%= rs.getString("company_address")%></td>
        	<td><%= rs.getString("email")%></td>
        	<td><%= rs.getString("phone")%></td>
        	<td><%= rs.getString("post").toUpperCase() %></td>
        	<td><%= rs.getString("cutoff")%></td>
        	
        	<form action="applyjob" method="Post">
        	<input type="hidden"name="compname" value=<%=rs.getString("company_name")%> />
        	<input type="hidden"name="compaddr" value=<%=rs.getString("company_address")%> />
        	<input type="hidden"name="email" value=<%=rs.getString("email")%> />
        	<input type="hidden"name="phone" value=<%=rs.getString("phone")%> />
        	<input type="hidden"name="post" value=<%=rs.getString("post")%> />
        	<input type="hidden"name="cutoff" value=<%=rs.getString("cutoff")%> />
        	<th><input type="submit" class="btn btn-info" value="Apply"></th>
        	</form>
        	</tr>
   
   <%  
} 

				 }
catch(Exception e){
                   out.println(e);
                  }				 
%>
 




    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="./dashboard%20files/jquery.min.js.download"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="./dashboard%20files/bootstrap.min.js.download"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="./dashboard%20files/holder.min.js.download"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="./dashboard%20files/ie10-viewport-bug-workaround.js.download"></script>
  

</body></html>