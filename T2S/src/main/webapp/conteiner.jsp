<%@ page language="java" contentType="text/html"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>Conteiner</title>
			<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,600,700,900&display=swap" rel="stylesheet">
			<link rel="shortcut icon" href="./img/favicon.ico"/>
			
			<link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
            <link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap5.min.css">

    		<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    		<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    		<script type="text/Javascript">
			    $(document).ready(function () {
			            $('#tabela').DataTable({
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
				#page-conteiner #container {
				    display: block;
				}
				#page-conteiner header {
				    display: flex;
				    justify-content: space-between;
				}
				#page-conteiner nav {
				    display: flex;
				    align-items: center;
				}
				#page-conteiner nav li {
				    list-style-type: none;
				
				    margin-right: 16px;
				}
				#page-conteiner nav li a {
				    color: #034f84;
				}
				#page-conteiner nav li a.button {
				    color: #034f84;
				}
				#page-conteiner nav li:last-child {
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
	<body id="page-conteiner">
		<div id="container">
			<%@ include file="WEB-INF/lib/header.jspf" %>
		</div>
		
		<% if(session.getAttribute("logado") != null) { %>
			
		<section id="title">
			<h1>Conteiner</h1>
		</section>	
		
		<br>
		<div class="formulario">
			<form action="conteinerDAO.jsp" method="POST">
				<label>Cliente:</label>
				<input type="text" name="nomeCliente" placeholder="Insira o nome do Cliente" size="25" style="color:white;" required>
				<label>Número do conteiner:</label>
				<input type="text" name="numeroConteiner" id="numCon" maxlength="11" placeholder="Insira o número do cliente" size="25" pattern="[A-Za-z]{4}-[0-9]{7}{11}" title="Insira 4 letras e 7 números." required>
				<label>Tipo do conteiner:</label>
				<select name="tipoConteiner" required>
					<option>Selecione:</option>
					<option value="20">20</option>
	                <option value="40">40</option>
				</select>	
				<label>Status do conteiner:</label>
				<select name="statusConteiner" required>
					<option>Selecione:</option>
					<option value="Cheio">Cheio</option>
	                <option value="Vazio">Vazio</option>
				</select>
				<label>Categoria do conteiner:</label>
				<select name="categoriaConteiner" required>
					<option>Selecione:</option>
					<option value="Exportação">Exportação</option>
	                <option value="Importação">Importação</option>
				</select>
				<button type="submit" name="adicionar" value="adicionar">Adicionar Conteiner</button>
			</form>	
		</div>		
		<br><br>
		<%
			String jdbcURL = "jdbc:postgresql://localhost:5432/db_t2s";
			String username = "postgres";
			String password = "123";
			
			int cont = 0;
			int id = 0;
			
			try {
				Connection connection = DriverManager.getConnection(jdbcURL, username, password);
				
				PreparedStatement pstm = connection.prepareStatement("SELECT * FROM conteiner.propriedades");
				
				ResultSet rset = pstm.executeQuery();	 
		 %> 
		<br>
		<div class=conteiner>
			<table id="tabela">
				<thead>
					<tr>
						<th>Número Conteiner</th>
						<th>Cliente</th>						
						<th>Tipo</th>
						<th>Status</th>
						<th>Categoria</th>
						<th>Comandos</th>
					</tr>
				</thead>	
				<tbody>										
				<%
					while(rset.next()) {
						out.println("<tr><td>" + rset.getString("numero_conteiner") + "</td>");
						out.println("<td>" + rset.getString("nome_cliente") + "</td>");
						out.println("<td>" + rset.getString("tipo_conteiner") + "</td>");
						out.println("<td>" + rset.getString("status_conteiner") + "</td>");
						out.println("<td>" + rset.getString("categoria_conteiner") + "</td>");
						id = rset.getInt("id");
						String nomeCliente = rset.getString("nome_cliente");
						String numeroConteiner = rset.getString("numero_conteiner");
						String tipoConteiner = rset.getString("tipo_conteiner");
						String statusConteiner = rset.getString("status_conteiner");
						String categoriaConteiner = rset.getString("categoria_conteiner");
				%>										
						<td>
							<form action="conteinerDAO.jsp" method="POST">	
								<button type="submit" name="deletar" value="<%= id %>">Deletar</button>
							</form>
						
							<form action="editConteiner.jsp" method="POST">	
								<input type="hidden" name="nomeCliente" value="<%= nomeCliente %>">
								<input type="hidden" name="numeroConteiner" value="<%= numeroConteiner %>">
								<input type="hidden" name="tipoConteiner" value="<%= tipoConteiner %>">
								<input type="hidden" name="statusConteiner" value="<%= statusConteiner %>">
								<input type="hidden" name="categoriaConteiner" value="<%= categoriaConteiner %>">
								<button type="submit" name="editar" value="<%= id %>">Editar</button>
							</form>
							<form action="login.jsp" method="POST">
								<input type="text" name="numeroConteiner" value="<%= numeroConteiner %>" hidden>
								<button type="submit" name="direcionar">Movimentação</button>
							</form>							
						</td>
					</tr>					
				<% } %>	
				</tbody>
				<tfoot>
					<tr>
						<th>Número Conteiner</th>
						<th>Cliente</th>
						<th>Tipo</th>
						<th>Status</th>
						<th>Categoria</th>
						<th>Comandos</th>
					</tr>
				</tfoot>				
			</table>
		</div>					
		<form action="relatorio.jsp">
			<input type="submit" name="relatorio" value="Gerar Relatório"> 
		</form>				
		<% 
			pstm.close();
			connection.close();
			rset.close();
				
			} catch(Exception e) {
				e.printStackTrace();
			}
		%>
		<br>
		<a href="explorer.jsp">Voltar</a>
	</body>
</html>		
		<% 
			} else if(session.getAttribute("logado") == null) {
				out.println("<p>ACESSO NEGADO: Necessário login para ter acesso à página.</p>");
			}
		%>
	
