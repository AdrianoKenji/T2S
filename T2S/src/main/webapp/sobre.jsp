<%@ page language="java" contentType="text/html"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Sobre nós</title>
		<link rel="shortcut icon" href="favicon.ico"/>
	</head>
	<body>
	
		<%@ include file="WEB-INF/lib/header.jspf" %>
		
		<h1>Sobre nós</h1>
		
		<h2>Histórico de Releases</h2>
		
		<h3>Versão 1.0 - T2S</h3>
		
		<p>Sistema integrado com o Banco de Dados, acesso login, página inicial pública, página sobre pública e explorer disponível apenas para os usuários logados.</p>
		
		<ul>
			<li>Página Principal pública</li>
			<li>Página Sobre pública</li>
			<li>Página Explorer privada (apenas logado)</li>
			<li>Página de Login</li>
		</ul>
		
		<h3>Versão 1.1 - T2S</h3>
		
		<p>Sistema de gerenciamento CRUD para os Contêineres com função de adicionar, exibir, deletar e editar.</p>
		
		<ul>
			<li>Criar conteiner</li>
			<li>Exibir conteiner</li>
			<li>Editar conteiner</li>
			<li>Deletar conteiner</li>
		</ul>
		
		<h3>Versão 1.2 - T2S</h3>
		
		<p>Sistema de gerenciamento CRUD para a Movimentação dos contêineres com função de adicionar, exibir, deletar e editar.</p>
		
		<ul>
			<li>Criar movimentação</li>
			<li>Exibir movimentação</li>
			<li>Editar movimentação</li>
			<li>Deletar movimentação</li>
		</ul>
		<script src="https://cdn.jsdelivr.net/npm/vue@2.6.12"></script>
	</body>
</html>