<%@page import="java.util.ArrayList"%>
<%@page import="model.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel = "stylesheet" href = "estilo.css">
<title>Insert title here</title>
</head>
<body>
	<%
	
		ProdutoDAO pd = new ProdutoDAO();
		
		String campoId = request.getParameter("id");
		String campoNome = request.getParameter("campoNome");
		String campoDescricao = request.getParameter("descricao");
		String campoPreco = request.getParameter("preco");
		String campoQuantidade = request.getParameter("quantidade");
		
		if(campoId != null && campoNome != null && campoDescricao != null && campoPreco != null && campoQuantidade != null){
			
			Produto ps = new Produto(Integer.parseInt(campoId),campoNome,campoDescricao,Float.parseFloat(campoPreco),Integer.parseInt(campoQuantidade));
			
			pd.salvar(ps);
			
		}
		
	%>
	<form action="" method = "POST">
	
		<input type="text" name="id" placeholder="Id">
		<input type="text" name="campoNome" placeholder="Nome do produto">
		<input type="text" name="descricao" placeholder="Descrição">
		<input type="text" name="preco" placeholder="Preço">
		<input type="text" name="quantidade" placeholder="Quantidade">
		
		<input type="reset" id="apagar" value="Apagar">
		<input type="submit" id="enviar" value="Enviar">
		
	</form>
	
	<table>
		<thead>
			<tr>
				<th>Id</th>
				<th>Nome do Produto</th>
				<th>Descrição</th>
				<th>Preço</th>
				<th>Quantidade</th>
			</tr>
			
		</thead>
		
			<%
			
				ProdutoDAO pdDao = new ProdutoDAO();
			
				ArrayList<Produto> ar1 = pd.abrir();
				
				ArrayList<String> ar2 = new ArrayList<>();
				
				String line = "";
				
				for(Produto pdt: ar1){
					line = String.valueOf(pdt.toCSV());
					ar2.add(line);
				}
				
				for(String linha: ar2){
					String item[] = linha.split(";"); 
					System.out.println("Esta é a variavel linha " + linha);
					out.print("<tr>");
					out.print("<td>" + item[0] + "</td>");//id
					out.print("<td>" + item[1] + "</td>");//nome do produto
					out.print("<td>" + item[2] + "</td>");//descrição
					out.print("<td>" + item[3] + "</td>");//preço
					out.print("<td>" + item[4] + "</td>");//quantidade
					out.print("</tr>");
				}
			
			
			%>
		
		<tbody>
		
		</tbody>
	
	</table>
</body>
</html>