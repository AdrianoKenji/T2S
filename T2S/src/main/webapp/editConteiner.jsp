<%@ page language="java" contentType="text/html"%>
<%@ page import="java.sql.*"%>

<%
	String jdbcURL = "jdbc:postgresql://localhost:5432/db_t2s";
	String username = "postgres";
	String password = "123";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Editar Conteiner</title>
		<link rel="shortcut icon" href="favicon.ico"/>
		<style>
				#numCon{
					text-transform:uppercase !important;
				}
		</style>
	</head>
	<body>
		<%@ include file="WEB-INF/lib/header.jspf" %>		
	
		<h1>Editar Conteiner</h1>
		
		<form action="conteinerDAO.jsp" method="POST">
			<label>Cliente:</label>
			<br>
			<input type="text" name="nomeCliente" value="<%= request.getParameter("nomeCliente") %>" size="25" required>
			<br>
			<label>Número do conteiner:</label>
			<br>
			<input type="text" id="numCon" name="numeroConteiner" maxlength="11" value="<%= request.getParameter("numeroConteiner") %>" size="25" pattern="[A-Za-z]{4}-[0-9]{7}{11}" required>
			<br>	
			<label>Tipo do conteiner:</label>
			<br>
			<select name="tipoConteiner" required>
				<option value="<%= request.getParameter("tipoConteiner") %>" selected><%= request.getParameter("tipoConteiner") %></option>
				<option value="20">20</option>
				<option value="40">40</option>
			</select>
			<br>
			<label>Status do conteiner:</label>
			<br>
			<select name="statusConteiner" required>
				<option value="<%= request.getParameter("statusConteiner") %>" selected><%= request.getParameter("statusConteiner") %></option>
				<option value="Cheio">Cheio</option>
				<option value="Vazio">Vazio</option>
			</select>
			<br>
			<label>Categoria do conteiner:</label>
			<br>
			<select name="categoriaConteiner" required>
				<option value="<%= request.getParameter("categoriaConteiner") %>" selected><%= request.getParameter("categoriaConteiner") %></option>
				<option value="Exportação">Exportação</option>
				<option value="Importação">Importação</option>
			</select>
			<input type="number" name="editar" hidden value="<%= request.getParameter("editar") %>">
			<br><br>
			<button type="submit" name="editar">Editar Conteiner</button>
		</form>
		<br>
		<a href="conteiner.jsp">Voltar</a>
		<script src="https://cdn.jsdelivr.net/npm/vue@2.6.12"></script>
	</body>
</html>