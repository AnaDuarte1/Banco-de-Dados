
package Simulado;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class Estoque {

        private Map<Livro, Integer> estoque;
        
        public Estoque(){
            estoque = new HashMap();
        }
        
        public synchronized boolean adicionar(Livro livro){
            if(estoque.containsKey(livro)){
                int aux = estoque.get(livro);
                estoque.put(livro, aux + 1);
            }else{
                estoque.put(livro, 1);
            }
            return true;
        }
        
        public synchronized boolean remover(Livro livro){ // sincronizar aquilo que é alterado
            if(estoque.containsKey(livro)){
                int aux = estoque.get(livro);
                
                if(aux == 0) return false;
                
                estoque.put(livro, aux - 1);
            }else{
                return false;
            }
            return true;
        }
        
        public Set<Livro> getLivros(){
            return estoque.keySet();
        }

        @Override
        public String toString() {
            return estoque.toString();
        }

    }
