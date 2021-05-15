<%@ page language="java" contentType="text/html"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Explorer</title>
		<link rel="shortcut icon" href="./img/favicon.ico"/>
		<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,600,700,900&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
		<!-- <script src="https://unpkg.com/element-ui/lib/index.js"></script> -->
		<style>
			#container {
			    width: 80%;
			    max-width: 980px;
			
			    margin: 40px auto;
			
			    display: flex;
			}
			main {
    			width:200%;
    			display: flex;
			    grid-template-columns: 1fr 1fr;
			
				margin-left: 840px;
				margin-right: 500px;
			}	
			
			#page-explorer #container {
			    display: block;
			}
			#page-explorer header {
			    display: flex;
			    justify-content: space-between;
			}
			#page-explorer nav {
			    display: flex;
			    align-items: center;
			}
			#page-explorer nav li {
			    list-style-type: none;
			
			    margin-right: 16px;
			}
			#page-explorer nav li a {
			    color: #034f84;
			}
			#page-explorer nav li a.button {
			    color: #034f84;
			}
			#page-explorer nav li:last-child {
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
			section#title {
			    margin-top: 64px;
			}
			
			button:hover {
				background-color: deepskyblue;
				cursor: pointer;
			}
		</style>
	</head>
	<body id="page-explorer">
		<div id="app">
			<div id="container">
				<%@ include file="WEB-INF/lib/header.jspf" %>
			</div>
			<section id="title">
				<p>Bem-vindo ao</p>
				<h1>Explorer</h1>
				<br><br><br>
			</section>
			<main>							
				<div class="botao">
					<form action="conteiner.jsp">
						<button type="submit">Ir para Container</button>	
					</form>											
					<br>
					<form action="mov-conteiner.jsp">
						<button type="submit">Ir para Movimentação</button>	
					</form>
				</div>																		
			</main>
		</div>		
		<%@ include file="WEB-INF/lib/footer.jspf" %>
		<script src="https://cdn.jsdelivr.net/npm/vue@2.6.12"></script>
		<!-- 
		<script>
			var app = new Vue({
				el: "#app",
				data: {
					titulo: "piroca"
				}
			});
		</script>
		 -->
	</body>
</html>

