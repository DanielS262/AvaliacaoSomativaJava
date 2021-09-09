package dao;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

import model.Produto;

public class ProdutoDAO {

	
	public ArrayList<Produto> abrir() {
		
		String arquivo = "D:\\dbs\\produtos.txt";
		
		String linha;
		
		ArrayList<Produto> produto = new ArrayList<>();
		
		try(BufferedReader br = new BufferedReader(new FileReader(arquivo))){
			
			
			linha = br.readLine();
			
			while(linha != null) {
			
				
				
				String vetor[] = linha.split(";");
				int id = Integer.parseInt(vetor[0]);
				String nome = vetor[1];
				String descricao = vetor[2];
				String valor = vetor[3];
				String quantidade = vetor[4];
				
				
				Produto pd = new Produto(id,nome,descricao,Float.parseFloat(valor),Integer.parseInt(quantidade));
				
				produto.add(pd);
				
				linha = br.readLine();
				
			}
			
			
			
		}
		catch(IOException e) {
			System.out.println(e.getMessage());
		}
		
		
		
		return produto;
		
	}
	
	
	public String salvar(Produto ps) {
		
		String arquivo = "D:\\dbs\\produtos.txt";
		
		ArrayList<Produto> ar = abrir();
		String line = "";
		
		ar.add(ps);
		
		for(Produto pd:ar) {
			line += String.valueOf(pd.toCSV());
		}
		
		
		try(BufferedWriter bw = new BufferedWriter(new FileWriter(arquivo,false))){
			
			bw.write(line);
		}
		
		catch(IOException e) {
			System.out.println(e.getMessage());
		}
		
		
		
		
		return line;
		
	}
	
	
	
	
	
	
}
