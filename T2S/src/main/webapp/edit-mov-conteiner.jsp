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
		<link rel="shortcut icon" href="favicon.ico"/>
		<style>
				#numCon{
					text-transform:uppercase !important;
				}
		</style>
	</head>
	<body>
		<%@ include file="WEB-INF/lib/header.jspf" %>		
	
		<% 
			if(session.getAttribute("num") != null) {
				
				String conteiner = (String)session.getAttribute("num");
				
				if(session.getAttribute("logado") != null) { 
		
		%>
	
		<h1>Editar Movimentação do Conteiner</h1>
		
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
		<br>
		<a href="mov-conteiner.jsp">Voltar</a>
		<script src="https://cdn.jsdelivr.net/npm/vue@2.6.12"></script>
	</body>
	<% 
			}
		} 
	%>
</html>