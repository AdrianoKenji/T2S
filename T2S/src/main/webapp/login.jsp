<%@ page language="java" contentType="text/html"%>
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
		
		if(request.getParameter("direcionar") != null) {
			session.setAttribute("num", String.valueOf(request.getParameter("numeroConteiner")));
			response.sendRedirect("mov-conteiner.jsp");
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
		<meta charset="UTF-8">
		<title>Login</title>
		<link rel="shortcut icon" href="favicon.ico"/>
	</head>
	<body>
		<h1>Login</h1>
		
		<form method="GET">
			<br><label>Username:</label>
			<input type="text" name="username">
			
			<br>
			
			<br><label>Senha:</label>
			<input type="password" name="password">
			
			<br><br><input type="submit" name="login">
		</form>	
		
		<br>
		
		<a href="index.jsp">Voltar</a>
		<script src="https://cdn.jsdelivr.net/npm/vue@2.6.12"></script>
	</body>
</html>