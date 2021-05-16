<%@ page language="java" contentType="text/html"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Sobre nós</title>
		<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,600,700,900&display=swap" rel="stylesheet">
		<link rel="shortcut icon" href="./img/favicon.ico"/>
		
		<style>
			#container {
			    width: 80%;
			    max-width: 980px;
			
			    margin: 40px auto;
			
			    display: flex;
			}
			main {
    			margin: 32px 0;
			}
			
			.content {
				margin-top: 80px;
				width: 35%;
			}
			
			p, .description{
		    	font-size: 16px;
		    	line-height: 24px;
		    	letter-spacing: 0.1px;
		    	
		    	margin-top: 50px;
			}
			.versao {
			    display: flex;
			
			    background-color: #87bdd8;
			    box-shadow: 0 4px 16px -8px rgba(1, 1, 1, 0.1);
			    border-radius: 8px;
			
			    padding: 32px;
			    
			    margin-bottom: 32px;
			}
			.versao img {
		    	width: 60px;
		    	height: 60px;
		
		    	margin-right: 32px;
			}			
			.versao h3 {
			    margin: 8px;
			}			
			.versao p {
			    margin: 8px;
			    color: #25282B;
			}			
			.versao .description {
			    margin: 16px 0;
			}
			#page-version #container {
			    display: block;
			}
			#page-version header {
			    display: flex;
			    justify-content: space-between;
			}
			#page-version nav {
			    display: flex;
			    align-items: center;
			}
			#page-version nav li {
			    list-style-type: none;
			
			    margin-right: 16px;
			}
			#page-version nav li a {
			    color: #034f84;
			}
			#page-version nav li a.button {
			    color: #034f84;
			}
			#page-version nav li:last-child {
			    margin: 0;
			}
			section#title {
			    text-align: center;
			}
			section#title p {
			    opacity: 0.9;
			    margin: 0;
			}
			section#title h1 {
			    margin: 0;
				color: #034f84;
			    font-size: 28px;
			}			
			section#versoes {
			    display: grid;
			    grid-template-columns: 1fr 1fr;
			
			    gap: 20px;
			}
			section#versoes .versao {
			    margin: 0;
			}
			section#title, section#versoes {
			    margin-top: 64px;
			}
		</style>
	</head>
	<body id="page-version">
		<div id="container">
			<%@ include file="WEB-INF/lib/header.jspf" %>
		</div>
		<section id="title">
			<p>Sobre nós</p>
			<h1>Histórico de Releases</h1>
		</section>
		<main>
			<section id="versoes">			
				<div class="versao">
					<div class="content">
						<h3>Versão 1.0</h3>
					</div>
					<div class="description">
						<p>Sistema integrado com o Banco de Dados, acesso login, página inicial pública, página sobre pública e explorer disponível apenas para os usuários logados.</p>
			
						<ul>
							<li>Página Principal pública</li>
							<li>Página Sobre pública</li>
							<li>Página Explorer privada (apenas logado)</li>
							<li>Página de Login</li>
						</ul>
					</div>
				</div>
				
				<div class="versao">
					<div class="content">
						<h3>Versão 1.1</h3>
					</div>
					<div class="description">
						<p>Sistema de gerenciamento CRUD para os Contêineres com função de adicionar, exibir, deletar e editar.</p>
		
						<ul>
							<li>Criar conteiner</li>
							<li>Exibir conteiner</li>
							<li>Editar conteiner</li>
							<li>Deletar conteiner</li>
						</ul>
					</div>
				</div>
				
				<div class="versao">
					<div class="content">
						<h3>Versão 1.2</h3>
					</div>
					<div class="description">						
						<p>Sistema de gerenciamento CRUD para a Movimentação dos contêineres com função de adicionar, exibir, deletar e editar.</p>
						
						<ul>
							<li>Criar movimentação</li>
							<li>Exibir movimentação</li>
							<li>Editar movimentação</li>
							<li>Deletar movimentação</li>
						</ul>
					</div>
				</div>
				
				<div class="versao">
					<div class="content">
						<h3>Versão 2.0</h3>
					</div>
					<div class="description">						
						<p>Sistema de criação de relatórios da Movimentação dos contêineres e finalização do front-end.</p>
						
						<ul>
							<li>Exibi número do conteiner</li>
							<li>Exibi data de Início</li>
							<li>Exibi data de Fim</li>
							<li>Exibi o tipo de movimentação</li>
						</ul>
					</div>
				</div>				
			</section>
		</main>
		<%@ include file="WEB-INF/lib/footer.jspf" %>
	</body>
</html>