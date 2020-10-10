<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add your Property</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="CSS/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<%@include file="navbar.jsp" %>
<%@page import="java.sql.*" import="java.io.IOException"%>
<%
Connection conn=null;
try
{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RealEstate", "root","burlmouse77");
	
	String name=request.getParameter("pname");
	String address=request.getParameter("address");
	String price=request.getParameter("price");
	String sqft=request.getParameter("sqft");
	String details=request.getParameter("details");
	
	if(name!=null && address!=null && price!=null && sqft!=null && details != null)
	{
		PreparedStatement st=conn.prepareStatement("insert into Property values(?,?,?,?,?)");
		st.setString(2,name);
		st.setString(3,address);
		st.setString(5,price);
		st.setString(6,sqft);
		st.setString(7,details);
		int r=st.executeUpdate();
		if(r>0)
		{
			out.println("Record Inserted Successfully");
		}
	}
}
catch(Exception e)
{
	out.println("Some exception here "+e);
}
%>
<section class="my-5">
	<div class="py-5">
		<h2 class="text-center">Add your Property</h2>
	</div>
	<div class="w-50 m-auto">
		<form action="AddProperty.jsp">
			<div class="form-group">
				<label>Property Name</label>
				<input type="text" name="pname" autocomplete="off" class="form-control">
			</div>
			<div class="form-group">
				<label>Property Address</label>
				<input type="text" name="address" autocomplete="off" class="form-control">
			</div>
			 <div class="btn-group">
      <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
   			 Property Type
  			</button>
			<div class="dropdown-menu">
				<a class="dropdown-item"> Industrial</a>
				<a class="dropdown-item"> Commercial</a>
				<a class="dropdown-item"> Flat</a>
				<a class="dropdown-item"> Land</a>
			</div>
		</div>
			<div class="form-group">
				<label>Property Price</label>
				<input type="text" name="price" autocomplete="off" class="form-control">
			</div>
			<div class="form-group">
				<label>Square Feet</label>
				<input type="text" name=sqft autocomplete="off" placeholder="Square Feet" class="form-control">
			</div>
			<div class="form-group">
				<label>Details</label>
				<textarea class="form-control" placeholder="Enter Details"></textarea>
			</div>
			<button type="submit" class="btn btn-success">Submit</button>
		</form>
	</div>
</section>
<%@include file="footer.jsp" %>
</body>
</html>