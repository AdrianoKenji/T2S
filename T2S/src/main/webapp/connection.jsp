<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<%
	String jdbcURL = "jdbc:postgresql://localhost:5432/db_t2s";
	String username = "postgres";
	String password = "123";
		
	try {
		
		Connection connection = DriverManager.getConnection(jdbcURL, username, password);
		out.println("Conectado com o Banco de Dados <br>");
		
		String sql = "SELECT * FROM seguranca.login";
		
		Statement statement = connection.createStatement();
		
		ResultSet result = statement.executeQuery(sql);
		
		while(result.next()) {
			
			 out.println(result.getString("id") + result.getString("usuario") + result.getString("senha"));
		
		}
		
		connection.close();
		statement.close();
		result.close();
		
	} catch (SQLException e) {	
		out.println("Erro na conexão com o PostgreSQL.." + e);
		e.printStackTrace();
	}
%>