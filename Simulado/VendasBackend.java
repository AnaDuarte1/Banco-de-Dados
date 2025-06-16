package Simulado;

public class VendasBackend {
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
                .filter( (l) -> l.getNome().matches(".*java.*")) 
                .forEach( (l) -> System.out.println(l)); 
        
        //classe anônima
        Thread ponto1 = new Thread( new Runnable() {
            public void run(){
                
                System.out.println("Ponto 1: " + saraiva.remover(l1));
                System.out.println("Ponto 1: " + saraiva.remover(l2));
                System.out.println("Ponto 1: " + saraiva.remover(l3));
            }
        });
        
        Thread ponto2 = new Thread( () -> {
            
                System.out.println("Ponto 2: " + saraiva.remover(l1));
                System.out.println("Ponto 2: " + saraiva.remover(l2));
                System.out.println("Ponto 2: " + saraiva.remover(l3));
        });
        
        Thread ponto3 = new Thread( () -> {
            
                System.out.println("Ponto 3: " + saraiva.remover(l1));
                System.out.println("Ponto 3: " + saraiva.remover(l2));
                System.out.println("Ponto 3: " + saraiva.remover(l3));
        });
        
        ponto1.start();
        ponto2.start();
        ponto3.start();
        
                
    }
  
}
