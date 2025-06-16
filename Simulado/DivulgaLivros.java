package Simulado;

import java.util.Comparator;
import java.util.stream.Collectors;

public class DivulgaLivros {
    public static void main(String[] args) {
        Estoque saraiva = new Estoque();
        
        Livro l1 = new Livro("java", 2020, 350.2, LivroGenero.DIDATICO);
        Livro l2 = new Livro("livro 2", 2021, 350.2, LivroGenero.ROMANCE);
        Livro l3 = new Livro("ana", 2022, 350.2, LivroGenero.BIOGRAFIAS);
        
        
        saraiva.adicionar(l1);
        
        saraiva.adicionar(l2);
        saraiva.adicionar(l2);
        saraiva.adicionar(l2);
        
        saraiva.adicionar(l3);
        saraiva.adicionar(l3);
        saraiva.adicionar(l3);
        
        System.out.println(saraiva);
        
        System.out.println("\n-------\n");
        
        saraiva.getLivros().stream()
                .sorted()
                .forEach( (l) -> System.out.println(l));
        
        System.out.println("\n-------\n");

                
        saraiva.getLivros().stream()
                .filter( (l) -> l.getAno() >= 2021)
                .forEach( (l) -> System.out.println(l)); 
        
        System.out.println("\n-------\n");

        saraiva.getLivros().stream()
                .filter( (l) -> l.getNome().matches(".*java.*")) // . * qualquer coisa
                .forEach( (l) -> System.out.println(l)); 
                
        
    }
}
