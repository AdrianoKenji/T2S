<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
	String jdbcURL = "jdbc:postgresql://localhost:5432/db_t2s";
	String usernameBD = "postgres";
	String passwordBD = "123";
		
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	try {
		
		Connection connection = DriverManager.getConnection(jdbcURL, usernameBD, passwordBD);
		
		PreparedStatement statement = connection.prepareStatement("SELECT * FROM seguranca.login where usuario = ? and senha = ?");
		
		statement.setString(1, username);
		statement.setString(2, password);
		
		ResultSet result = statement.executeQuery();
		
		while(result.next()) {
			
			 if(result != null) {
				 out.println("Você está conectado");
				 session.setAttribute("logado", "true");
				 response.sendRedirect("explorer.jsp");
			 }
		}
		
		connection.close();
		statement.close();
		result.close();
		
	} catch (SQLException e) {	
		out.println("Erro na conexão com o PostgreSQL.." + e);
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>Login</title>
	</head>
	<body>
		<h1>Login</h1>
		
		<form method="POST">
			<br><label>Username:</label>
			<input type="text" name="username">
			
			<br>
			
			<br><label>Senha:</label>
			<input type="password" name="password">
			
			<br><br><input type="submit" name="login">
		</form>	
		
		<br>
		
		<a href="index.jsp">Voltar</a>
	</body>
</html>