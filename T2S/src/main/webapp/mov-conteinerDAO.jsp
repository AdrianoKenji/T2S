<%@ page language="java" contentType="text/html"%>
<%@ page import="java.sql.*"%>

<%
	String jdbcURL = "jdbc:postgresql://localhost:5432/db_t2s";
	String username = "postgres";
	String password = "123";
	
	String idConteiner = request.getParameter("idConteiner");
	String tipoMovimentacao = request.getParameter("tipoMovimentacao");
	String dataInicio = request.getParameter("dataInicio");
	String horaInicio = request.getParameter("horaInicio");
	String dataFim = request.getParameter("dataFim");
	String horaFim = request.getParameter("horaFim");
	
	String conteiner = request.getParameter("id");
	String conteiner1 = request.getParameter("mov-editar");
	
	int id = 1;
	String num = "";
		
	try {
		
		Connection connection = DriverManager.getConnection(jdbcURL, username, password);
			
		if(request.getParameter("mov-adicionar") != null) {
				num = request.getParameter("mov-adicionar");
				PreparedStatement pstm = connection.prepareStatement("INSERT INTO operacoes.movimentacao VALUES (?, ?, ?, ?)");		
						
				pstm.setString(1, tipoMovimentacao);
				pstm.setTimestamp(2, Timestamp.valueOf(dataInicio + " " + horaInicio + ":00"));
				pstm.setTimestamp(3, Timestamp.valueOf(dataFim + " " + horaFim + ":00"));
				pstm.setString(4, conteiner);
				
				int rset = pstm.executeUpdate();
				
				if(rset > 0) {
					response.sendRedirect("mov-conteiner.jsp");
				}
				
				pstm.close();
				connection.close();
				
		} else if(request.getParameter("mov-editar") != null) {
			num = request.getParameter("mov-editar");
			PreparedStatement pstm = connection.prepareStatement("UPDATE operacoes.movimentacao SET tipo_movimentacao = ?, data_inicio = ?, data_fim = ?, id_conteiner = ?  WHERE id = ?");
			
			pstm.setString(1, tipoMovimentacao);
			pstm.setTimestamp(2, Timestamp.valueOf(dataInicio + " " + horaInicio + ":00"));
			pstm.setTimestamp(3, Timestamp.valueOf(dataFim + " " + horaFim + ":00"));
			pstm.setString(4, conteiner1);
			pstm.setInt(5, id);
			
			int rset = pstm.executeUpdate();
			
			if(rset > 0) {
				response.sendRedirect("mov-conteiner.jsp");
			}
			
			pstm.close();
			connection.close();
			
		} else if(request.getParameter("mov-deletar") != null) {
			id = Integer.parseInt(request.getParameter("mov-deletar"));
			PreparedStatement pstm = connection.prepareStatement("DELETE FROM operacoes.movimentacao WHERE id = ?");
			pstm.setInt(1, id);
			
			int rset = pstm.executeUpdate();
			
			if(rset > 0) {
				response.sendRedirect("mov-conteiner.jsp");
			}
			
			pstm.close();
			connection.close();
			
		}
		
	} catch (SQLException e) {	
		out.println("Erro na conexão com o PostgreSQL.." + e);
		e.printStackTrace();
	}
%>