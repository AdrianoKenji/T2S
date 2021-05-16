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
		<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,600,700,900&display=swap" rel="stylesheet">
		<link rel="shortcut icon" href="./img/favicon.ico"/>
		<style>
				#numCon{
					text-transform:uppercase !important;
				}
				#container {
				    width: 80%;
				    max-width: 980px;
				
				    margin: 40px auto;
				
				    display: flex;
				}
				
				#edit-conteiner #container {
				    display: block;
				}
				#edit-conteiner header {
				    display: flex;
				    justify-content: space-between;
				}
				#edit-conteiner nav {
				    display: flex;
				    align-items: center;
				}
				#edit-conteiner nav li {
				    list-style-type: none;
				
				    margin-right: 16px;
				}
				#edit-conteiner nav li a {
				    color: #034f84;
				}
				#edit-conteiner nav li a.button {
				    color: #034f84;
				}
				#edit-conteiner nav li:last-child {
				    margin: 0;
				}
				section#title {
				    text-align: center;
				}				
				section#title h1 {
				    margin: 0;
					color: #034f84;
				    font-size: 64px;
				}			
				section#title {
				    margin-top: 64px;
				}					
				input {
					padding: 15px;
					border: none;
					outline: none;
					font-size: 15px;
					background-color: #034f84;
					border-radius: 10px;
					color: white;
					font-size: 15px;					
					margin:30px;
					
					align-content: center;
				}			
				
				div.formulario {
					text-align: center;
					background-color: #f7f7f7;
					border-radius: 8px;
					
				}			
		</style>
	</head>
	<body id="edit-conteiner">
	
		<div id="container">
			<%@ include file="WEB-INF/lib/header.jspf" %>
		</div>
		
		<section id="title">
			<h1>Editar Conteiner</h1>
		</section>
		<br>
		<div class="formulario">
			<form action="conteinerDAO.jsp" method="POST">
				<label>Cliente:</label>
				
				<input type="text" name="nomeCliente" value="<%= request.getParameter("nomeCliente") %>" size="25" required>
				<label>Número do conteiner:</label>
				<input type="text" id="numCon" name="numeroConteiner" maxlength="11" value="<%= request.getParameter("numeroConteiner") %>" size="25" pattern="[A-Za-z]{4}-[0-9]{7}{11}" required>
				<br>
				<label>Tipo do conteiner:</label>
		
				<select name="tipoConteiner" required>
					<option value="<%= request.getParameter("tipoConteiner") %>" selected><%= request.getParameter("tipoConteiner") %></option>
					<option value="20">20</option>
					<option value="40">40</option>
				</select>
	
				<label>Status do conteiner:</label>
	
				<select name="statusConteiner" required>
					<option value="<%= request.getParameter("statusConteiner") %>" selected><%= request.getParameter("statusConteiner") %></option>
					<option value="Cheio">Cheio</option>
					<option value="Vazio">Vazio</option>
				</select>
		
				<label>Categoria do conteiner:</label>
			
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
		</div>
	</body>
</html>