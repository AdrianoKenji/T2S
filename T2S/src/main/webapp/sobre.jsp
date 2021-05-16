<%@ page language="java" contentType="text/html"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Sobre n�s</title>
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
			<p>Sobre n�s</p>
			<h1>Hist�rico de Releases</h1>
		</section>
		<main>
			<section id="versoes">			
				<div class="versao">
					<div class="content">
						<h3>Vers�o 1.0</h3>
					</div>
					<div class="description">
						<p>Sistema integrado com o Banco de Dados, acesso login, p�gina inicial p�blica, p�gina sobre p�blica e explorer dispon�vel apenas para os usu�rios logados.</p>
			
						<ul>
							<li>P�gina Principal p�blica</li>
							<li>P�gina Sobre p�blica</li>
							<li>P�gina Explorer privada (apenas logado)</li>
							<li>P�gina de Login</li>
						</ul>
					</div>
				</div>
				
				<div class="versao">
					<div class="content">
						<h3>Vers�o 1.1</h3>
					</div>
					<div class="description">
						<p>Sistema de gerenciamento CRUD para os Cont�ineres com fun��o de adicionar, exibir, deletar e editar.</p>
		
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
						<h3>Vers�o 1.2</h3>
					</div>
					<div class="description">						
						<p>Sistema de gerenciamento CRUD para a Movimenta��o dos cont�ineres com fun��o de adicionar, exibir, deletar e editar.</p>
						
						<ul>
							<li>Criar movimenta��o</li>
							<li>Exibir movimenta��o</li>
							<li>Editar movimenta��o</li>
							<li>Deletar movimenta��o</li>
						</ul>
					</div>
				</div>
				
				<div class="versao">
					<div class="content">
						<h3>Vers�o 2.0</h3>
					</div>
					<div class="description">						
						<p>Sistema de cria��o de relat�rios da Movimenta��o dos cont�ineres e finaliza��o do front-end.</p>
						
						<ul>
							<li>Exibi n�mero do conteiner</li>
							<li>Exibi data de In�cio</li>
							<li>Exibi data de Fim</li>
							<li>Exibi o tipo de movimenta��o</li>
						</ul>
					</div>
				</div>				
			</section>
		</main>
		<%@ include file="WEB-INF/lib/footer.jspf" %>
	</body>
</html>