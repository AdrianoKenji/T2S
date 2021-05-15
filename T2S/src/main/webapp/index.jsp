<%@ page language="java" contentType="text/html"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Página Inicial</title>
		<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,600,700,900&display=swap" rel="stylesheet">
		<link rel="shortcut icon" href="./img/favicon.ico"/>
		
		<style>
			#container {
			    width: 80%;
			    max-width: 980px;
			
			    margin: 40px auto;
			
			    display: flex;
			}
			#intro {
			    width: 300px;
			
			    margin-right: 64px;
			}
			main {
    			margin: 32px 0;
			}
			p, .description{
		    	font-size: 16px;
		    	line-height: 24px;
		    	letter-spacing: 0.1px;
			}
			.funcao {
			    display: flex;
			
			    background-color: #87bdd8;
			    box-shadow: 0 4px 16px -8px rgba(1, 1, 1, 0.1);
			    border-radius: 8px;
			
			    padding: 32px;
			    
			    margin-bottom: 32px;
			}
			.funcao img {
		    	width: 60px;
		    	height: 60px;
		
		    	margin-right: 32px;
			}			
			.funcao h3 {
			    margin: 0;
			}			
			.funcao p {
			    margin: 8px 0;
			    color: #25282B;
			}			
			.funcao .description {
			    margin: 16px 0;
			}
			#page-home #container {
			    display: block;
			}
			#page-home header {
			    display: flex;
			    justify-content: space-between;
			}
			#page-home nav {
			    display: flex;
			    align-items: center;
			}
			#page-home nav li {
			    list-style-type: none;
			
			    margin-right: 16px;
			}
			#page-home nav li a {
			    color: #034f84;
			}
			#page-home nav li a.button {
			    color: #034f84;
			}
			#page-home nav li:last-child {
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
			    font-size: 64px;
			}			
			section#funcoes {
			    display: grid;
			    grid-template-columns: 1fr 1fr;
			
			    gap: 20px;
			}
			section#funcoes .funcao {
			    margin: 0;
			}
			section#title, section#funcoes {
			    margin-top: 64px;
			}
		</style>
	</head>
	<body id="page-home">
		<div id="container">
			<%@ include file="WEB-INF/lib/header.jspf" %>
		</div>
		<section id="title">
			<p>Bem-vindo ao<p>
			<p>Software de Gerenciamento de</p>
			<h1>Contêineres</h1>
		</section>
		<main>		
			<section id="funcoes">
			
				<div class="funcao">
					<img 
						src="./img/crane.png"
						alt="Imagem de Conteiner">
					<div class="content">
						<h3>Gerenciamento de Conteiner</h3>
						<p>Conteiner</p>
						<div class="description">
							Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem ab aspernatur quos hic repellendus? Similique mollitia, corrupti a quas in eum nulla atque laudantium facere, voluptas earum et officiis dicta.
						</div>
					</div>
				</div>
				
				<div class="funcao">
					<img 
						src="./img/shipping.png"
						alt="Imagem de Movimentação">				
					<div class="content">
						<h3>Gerenciamento da Movimentação</h3>
						<p>Movimentação</p>
						<div class="descripti	on">
							Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem ab aspernatur quos hic repellendus? Similique mollitia, corrupti a quas in eum nulla atque laudantium facere, voluptas earum et officiis dicta.
						</div>
					</div>
				</div>
				
				<div class="funcao">
					<img 
						src="./img/inventory.png"
						alt="Imagem de Conteiner">
					<div class="content">
						<h3>Relatório da Movimentação</h3>
						<p>Relatório</p>
						<div class="description">
							Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem ab aspernatur quos hic repellendus? Similique mollitia, corrupti a quas in eum nulla atque laudantium facere, voluptas earum et officiis dicta.
						</div>
					</div>
				</div>
				
				<div class="funcao">
					<img 
						src="./img/enter.png"
						alt="Imagem de Conteiner">
					<div class="content">
						<h3>Autenticação</h3>
						<p>Segurança</p>
						<div class="description">
							Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem ab aspernatur quos hic repellendus? Similique mollitia, corrupti a quas in eum nulla atque laudantium facere, voluptas earum et officiis dicta.
						</div>
					</div>
				</div>
			</section>
		</main>
		<script src="https://cdn.jsdelivr.net/npm/vue@2.6.12"></script>
		<%@ include file="WEB-INF/lib/footer.jspf" %>
	</body>
</html>