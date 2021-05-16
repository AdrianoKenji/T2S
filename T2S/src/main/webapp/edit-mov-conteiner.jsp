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
			<title>Editar Movimentação do Conteiner</title>
			<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,600,700,900&display=swap" rel="stylesheet">
			<link rel="shortcut icon" href="./img/favicon.ico"/>
		<style>
				#container {
				    width: 80%;
				    max-width: 980px;
				
				    margin: 40px auto;
				
				    display: flex;
				}
				
				#edit-movimentacao #container {
				    display: block;
				}
				#edit-movimentacao header {
				    display: flex;
				    justify-content: space-between;
				}
				#edit-movimentacao nav {
				    display: flex;
				    align-items: center;
				}
				#edit-movimentacao nav li {
				    list-style-type: none;
				
				    margin-right: 16px;
				}
				#edit-movimentacao nav li a {
				    color: #034f84;
				}
				#edit-movimentacao nav li a.button {
				    color: #034f84;
				}
				#edit-movimentacao nav li:last-child {
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
	<body id="edit-movimentacao">
		<div id="container">
			<%@ include file="WEB-INF/lib/header.jspf" %>
		</div>
		<% 
			if(session.getAttribute("num") != null) {
				
				String conteiner = (String)session.getAttribute("num");
				
				if(session.getAttribute("logado") != null) { 
		
		%>
		<section id="title">
			<h1>Editar Movimentação do Conteiner</h1>
		</section>
	
		<br><br>
	
		<div class="formulario">
			<form action="mov-conteinerDAO.jsp" method="POST">
				<label>Número Conteiner</label>
				<br>
				<input type="text" name="id" value="<%= conteiner %>" disabled>
				<br><br>
				<label>Tipo Movimentação:</label>
				<br>
				<select name="tipoMovimentacao" required>
					<option value="<%= request.getParameter("tipoMovimentacao") %>" selected><%= request.getParameter("tipoMovimentacao") %></option>
					<option value="Embarque">Embarque</option>
					<option value="Descarga">Descarga</option>
					<option value="Gate in">Gate In</option>
					<option value="Gate out">Gate out</option>
					<option value="Posicionamento Pilha">Posicionamento Pilha</option>
					<option value="Pesagem">Pesagem</option>
					<option value="Scanner">Scanner</option>
				</select>
				<br><br>
				<label>Data e hora do Ínicio</label>
				<br>
				<input type="date" name="dataInicio" value="<%= request.getParameter("dataInicio") %>" required>
				<input type="time" name="horaInicio" value="<%= request.getParameter("horaInicio") %>" required>
				<br><br>
				<label>Data e hora do Fim</label>	
				<br>
				<input type="date" name="dataFim" value="<%= request.getParameter("dataFim") %>" required>
				<input type="time" name="horaFim" value="<%= request.getParameter("horaFim") %>" required>
				<br><br>
				<input type="number" name="editar" hidden value="<%= request.getParameter("mov-editar") %>">
				<br>
				<button type="submit" value="<%= conteiner %>" name="mov-editar">Editar Movimentação</button>
			</form>
		</div>
		<br><br><br>
		<a href="mov-conteiner.jsp">Voltar</a>
	</body>
	<% 
			}
		} 
	%>
</html>