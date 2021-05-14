<%@ page language="java" contentType="text/html"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Sobre n�s</title>
		<link rel="shortcut icon" href="favicon.ico"/>
	</head>
	<body>
	
		<%@ include file="WEB-INF/lib/header.jspf" %>
		
		<h1>Sobre n�s</h1>
		
		<h2>Hist�rico de Releases</h2>
		
		<h3>Vers�o 1.0 - T2S</h3>
		
		<p>Sistema integrado com o Banco de Dados, acesso login, p�gina inicial p�blica, p�gina sobre p�blica e explorer dispon�vel apenas para os usu�rios logados.</p>
		
		<ul>
			<li>P�gina Principal p�blica</li>
			<li>P�gina Sobre p�blica</li>
			<li>P�gina Explorer privada (apenas logado)</li>
			<li>P�gina de Login</li>
		</ul>
		
		<h3>Vers�o 1.1 - T2S</h3>
		
		<p>Sistema de gerenciamento CRUD para os Cont�ineres com fun��o de adicionar, exibir, deletar e editar.</p>
		
		<ul>
			<li>Criar conteiner</li>
			<li>Exibir conteiner</li>
			<li>Editar conteiner</li>
			<li>Deletar conteiner</li>
		</ul>
		
		<h3>Vers�o 1.2 - T2S</h3>
		
		<p>Sistema de gerenciamento CRUD para a Movimenta��o dos cont�ineres com fun��o de adicionar, exibir, deletar e editar.</p>
		
		<ul>
			<li>Criar movimenta��o</li>
			<li>Exibir movimenta��o</li>
			<li>Editar movimenta��o</li>
			<li>Deletar movimenta��o</li>
		</ul>
		<script src="https://cdn.jsdelivr.net/npm/vue@2.6.12"></script>
	</body>
</html>