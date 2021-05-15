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
		<link rel="shortcut icon" href="./img/favicon.ico"/>
		<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,600,700,900&display=swap" rel="stylesheet">
		<style>
			
			body {
				font-family: sans-serif;
				background-color: #f7f7f7;			
			}
			
			h1 {
				margin: 60px;
				margin-bottom: 20px;
				margin-top: 20px;
			}
			
			div {				
				background-color: #87bdd8;	
				position: absolute;
				top: 40%;
				left: 50%;
				transform: translate(-50%, -50%);
				padding: 100px;
				border-radius: 15px;
				color: black;
			}
			
			p {
		    	font-size: 16px;
		    	line-height: 24px;
		    	letter-spacing: 0.1px;
			}
			
			input {
				padding: 15px;
				border: none;
				outline: none;
				font-size: 15px;
			}
			
			button {
				background-color: #034f84;
				border: none;
				padding: 15px;
				width: 100%;
				border-radius: 10px;
				color: white;
				font-size: 15px; 
			}
			
			button:hover {
				background-color: deepskyblue;
				cursor: pointer;
			}
			
			a {
				padding: 95px;
				margin:: 10px;
			}
			
			a:hover {
				text-decoration: underline;
			}
		</style>
	</head>
	<body>
		<div id="container">
			<%@ include file="WEB-INF/lib/header.jspf" %>
		</div>	
		<div class="login">
			<h1>Login</h1>
			<form method="GET">			
				<input type="text" name="username" placeholder="Usuário" value="admin">
				<br><br>
				<input type="password" name="password" placeholder="Senha" value="admin">				
				<br><br>
				<button type="submit">Entrar</button>
			</form>	
			<form action="index.jsp">
				<button href="index.jsp">Sair</button>
			</form>			
		</div>
		<br>		
		<script src="https://cdn.jsdelivr.net/npm/vue@2.6.12"></script>
		<%@ include file="WEB-INF/lib/footer.jspf" %>
	</body>
</html>