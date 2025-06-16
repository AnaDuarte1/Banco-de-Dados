package Simulado;

public class ErroSistematico extends Exception{ //Verificada
    
   private final String mensagem;
   
    public ErroSistematico(String mensagem) {
        super(mensagem);
        this.mensagem = mensagem;
    }  

    public String getMensagem() {
        return mensagem;
    }
    
    @Override
    public String toString() {
        return "Erro sistemático (" + getMensagem() + ")"; 
    }
}

