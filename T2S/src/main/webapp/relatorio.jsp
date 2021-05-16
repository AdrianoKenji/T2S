<%@ page language="java" contentType="text/html"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Relatório</title>
		<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,600,700,900&display=swap" rel="stylesheet">
		<link rel="shortcut icon" href="./img/favicon.ico"/>
		
		<link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
           <link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap5.min.css">

   		<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
   		<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
   		<script type="text/Javascript">
			    $(document).ready(function () {
			            $('#relatorio-conteiner').DataTable({
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
				
				#relatorio #container {
				    display: block;
				}
				#relatorio header {
				    display: flex;
				    justify-content: space-between;
				}
				#relatorio nav {
				    display: flex;
				    align-items: center;
				}
				#relatorio nav li {
				    list-style-type: none;
				
				    margin-right: 16px;
				}
				#relatorio nav li a {
				    color: #034f84;
				}
				#relatorio nav li a.button {
				    color: #034f84;
				}
				#relatorio nav li:last-child {
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
		</style>			
	</head>
	<body id="relatorio">
		<div id="container">
			<%@ include file="WEB-INF/lib/header.jspf" %>
		</div>
		<%	
			if(session.getAttribute("logado") != null) { 
		
		%>
		<section id="title">
			<h1>Relatório de Movimentação</h1>
		</section>
		
		<br>
		<%		
			String jdbcURL = "jdbc:postgresql://localhost:5432/db_t2s";
			String username = "postgres";
			String password = "123";
			
			int cont = 0;
			int id = 0;
				
			try {
				Connection connection = DriverManager.getConnection(jdbcURL, username, password);
				
				PreparedStatement pstm = connection.prepareStatement("SELECT * FROM operacoes.movimentacao");					
				
				ResultSet rset = pstm.executeQuery();	
		%>
				<table id="relatorio-conteiner">
					<thead>
						<tr>
							<th>Número Conteiner</th>
							<th>Movimentação</th>
							<th>Data e hora do Início</th>
							<th>Data e hora do Fim</th>				
						</tr>
					</thead>
					<tbody>																	
						<% 
						while(rset.next()) {		
							out.println("<tr><td>" + rset.getString("id_conteiner") + "</td>");
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
						</tr>
						<% } %>
					</tbody>					
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
				<br><br><br><br><br>
				<a href="conteiner.jsp">Voltar</a>
		</body>
	</html>
		<% 
			} else if(session.getAttribute("logado") == null) {
				out.println("<p>ACESSO NEGADO: Necessário login para ter acesso à página.</p>");
			}
		%>
	
