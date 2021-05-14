<%@ page language="java" contentType="text/html"%>
<%@ page import="java.sql.*"%>

<%
	String jdbcURL = "jdbc:postgresql://localhost:5432/db_t2s";
	String username = "postgres";
	String password = "123";
	
	int id = 0;
	
	String nomeCliente = request.getParameter("nomeCliente");
	String numeroConteiner = request.getParameter("numeroConteiner");
	String tipoConteiner = request.getParameter("tipoConteiner");
	String statusConteiner = request.getParameter("statusConteiner");
	String categoriaConteiner = request.getParameter("categoriaConteiner");
		
	try {
		
		Connection connection = DriverManager.getConnection(jdbcURL, username, password);
			
		if(request.getParameter("adicionar") != null) {
				PreparedStatement pstm = connection.prepareStatement("INSERT INTO conteiner.propriedades(nome_cliente, numero_conteiner, tipo_conteiner, status_conteiner, categoria_conteiner) VALUES (?, ?, ?, ?, ?)");		
				
				pstm.setString(1, nomeCliente);
				pstm.setString(2, numeroConteiner);
				pstm.setString(3, tipoConteiner);
				pstm.setString(4, statusConteiner);
				pstm.setString(5, categoriaConteiner);
				
				int rset = pstm.executeUpdate();
				
				if(rset > 0) {
					response.sendRedirect("conteiner.jsp");
				}
				
				pstm.close();
				connection.close();
				
		} else if(request.getParameter("editar") != null) {
			id = Integer.parseInt(request.getParameter("editar"));
			PreparedStatement pstm = connection.prepareStatement("UPDATE conteiner.propriedades SET nome_cliente = ?, numero_conteiner = ?, tipo_conteiner = ?, status_conteiner = ?, categoria_conteiner = ? WHERE id = ?");
			
			pstm.setString(1, nomeCliente);
			pstm.setString(2, numeroConteiner);
			pstm.setString(3, tipoConteiner);
			pstm.setString(4, statusConteiner);
			pstm.setString(5, categoriaConteiner);
			pstm.setInt(6, id);
			
			int rset = pstm.executeUpdate();
			
			if(rset > 0) {
				response.sendRedirect("conteiner.jsp");
			}
			
			pstm.close();
			connection.close();
			
		} else if(request.getParameter("deletar") != null) {
			id = Integer.parseInt(request.getParameter("deletar"));
			PreparedStatement pstm = connection.prepareStatement("DELETE FROM conteiner.propriedades WHERE id = ?");
			pstm.setInt(1, id);
			
			int rset = pstm.executeUpdate();
			
			if(rset > 0) {
				response.sendRedirect("conteiner.jsp");
			}
			
			pstm.close();
			connection.close();
	
		}
		
	} catch (SQLException e) {	
		out.println("Erro na conexão com o PostgreSQL.." + e);
		e.printStackTrace();
	}
%>