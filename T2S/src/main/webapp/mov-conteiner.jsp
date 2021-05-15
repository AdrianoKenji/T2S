<%@ page language="java" contentType="text/html"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Movimentação Conteiner</title>
		<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,600,700,900&display=swap" rel="stylesheet">
		<link rel="shortcut icon" href="./img/favicon.ico"/>
		
		<link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap5.min.css">
		
   		<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
   		<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
   		<script type="text/Javascript" language="javascript">
			    $(document).ready(function () {
			            $('#mov-conteiner').DataTable({
			            	 "language": {
			                     "lengthMenu": "Mostrando _MENU_ registros por página",
			                     "zeroRecords": "Nada encontrado",
			                     "info": "Mostrando página _PAGE_ de _PAGES_",
			                     "infoEmpty": "Nenhum registro disponível",
			                     "infoFiltered": "(filtrado de from _MAX_ registros no total)"
			                }
			          });
			       });			      
    		</script>
    		
    		<style>
				#container {
				    width: 80%;
				    max-width: 980px;
				
				    margin: 40px auto;
				
				    display: flex;
				}
				
				#movimentacao #container {
				    display: block;
				}
				#movimentacao header {
				    display: flex;
				    justify-content: space-between;
				}
				#movimentacao nav {
				    display: flex;
				    align-items: center;
				}
				#movimentacao nav li {
				    list-style-type: none;
				
				    margin-right: 16px;
				}
				#movimentacao nav li a {
				    color: #034f84;
				}
				#movimentacao nav li a.button {
				    color: #034f84;
				}
				#movimentacao nav li:last-child {
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
					color: black;
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
	<body id="movimentacao">
	
		<div id="container">
			<%@ include file="WEB-INF/lib/header.jspf" %>
		</div>
		
		<% 
			if(session.getAttribute("num") != null) {
				
				String conteiner = (String)session.getAttribute("num");
				
				if(session.getAttribute("logado") != null) { 
		
		%>		
		<section id="title">
			<h1>Movimentação do conteiner <%= conteiner	 %></h1>
		</section>
			<div class="formulario">
				<form action="mov-conteinerDAO.jsp" method="POST">
					<label>Tipo Movimentação:</label>
					<select name="tipoMovimentacao" required>
						<option>Selecione:</option>
						<option value="Embarque">Embarque</option>
						<option value="Descarga">Descarga</option>
						<option value="Gate in">Gate In</option>
						<option value="Gate out">Gate out</option>
						<option value="Posicionamento<%= " " %>Pilha">Posicionamento Pilha</option>
						<option value="Pesagem">Pesagem</option>
						<option value="Scanner">Scanner</option>
					</select>
					<label>Data e hora do início:</label>
					<input type="date" name="dataInicio" value="2020-08-06" required>
					<input type="time" name="horaInicio" value="18:30" required>
					<label>Data e hora do Fim:</label>
					<input type="date" name="dataFim" value="2021-08-06" required>
					<input type="time" name="horaFim" value="20:30" required>
					<input type="text" hidden name="id" value="<%= conteiner %>"> 
					<button type="submit" name="mov-adicionar" value="">Adicionar Movimentação</button>
				</form>
			</div>
			<br>
		<%
		
			String jdbcURL = "jdbc:postgresql://localhost:5432/db_t2s";
			String username = "postgres";
			String password = "123";
			
			int cont = 0;
			int id = 0;
				
			try {
				Connection connection = DriverManager.getConnection(jdbcURL, username, password);
				
				PreparedStatement pstm = connection.prepareStatement("SELECT * FROM operacoes.movimentacao WHERE id_conteiner = ?");					
				pstm.setString(1, conteiner);
				
				ResultSet rset = pstm.executeQuery();
					
		%>	
				
				<table id="mov-conteiner">
					<thead>
						<tr>
							<th>Número Conteiner</th>
							<th>Movimentação</th>
							<th>Data e hora do Início</th>
							<th>Data e hora do Fim</th>	
							<th>Comandos</th>			
						</tr>
					</thead>
					<tbody>
						<tr>											
						<% 
							while(rset.next()) {																
								out.println("<td>" + conteiner + "</td>");
								out.println("<td>" + rset.getString("tipo_movimentacao") + "</td>");
								out.println("<td>" + rset.getString("data_inicio") + "</td>");
								out.println("<td>" + rset.getString("data_fim") + "</td>");
								id = rset.getInt("id");
								String tipoMovimentacao = rset.getString("tipo_movimentacao");								
								String dataInicio = rset.getString("data_inicio");
								String horaInicio = request.getParameter("horaInicio");
								String dataFim = rset.getString("data_fim");			
								String horaFim = request.getParameter("horaFim");
						%>
							<td>
								<form action="mov-conteinerDAO.jsp" method="POST">		
									<button type="submit" name="mov-deletar" value="<%= id %>">Deletar</button>
								</form>
								<form action="edit-mov-conteiner.jsp" method="POST">	
									<input type="hidden" name="tipoMovimentacao" value="<%= tipoMovimentacao %>">
									<input type="hidden" name="dataInicio" value="<%= dataInicio %>">
									<input type="hidden" name="horaInicio" value="<%= horaInicio %>">
									<input type="hidden" name="dataFim" value="<%= dataFim %>">
									<input type="hidden" name="horaFim" value="<%= horaFim %>">
									<input type="hidden" name="idConteiner" value="<%= conteiner %>">
									<button type="submit" name="mov-editar" value="<%= id %>">Editar</button>
								</form>
							</td>
						</tr>												
					</tbody>					
							<% } %>
					<tfoot>
						<tr>
							<th>Número Conteiner</th>
							<th>Movimentação</th>
							<th>Data e hora do Início</th>
							<th>Data e hora do Fim</th>	
							<th>Comandos</th>	
						</tr>
					</tfoot>
				</table>
		<% 
			pstm.close();
			connection.close();
			rset.close();
				
			} catch(Exception e) {
				e.printStackTrace();
			}
		%>
				<br>
				<a href="conteiner.jsp">Voltar</a>
				<script src="https://cdn.jsdelivr.net/npm/vue@2.6.12"></script>
			</body>
		<% } %>
		</html>
		<% 
			} else if(session.getAttribute("logado") == null) {
				out.println("<p>ACESSO NEGADO: Necessário login para ter acesso à página.</p>");
			}
		%>