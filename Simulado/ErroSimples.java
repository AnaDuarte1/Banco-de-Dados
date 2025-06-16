/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Simulado;

/**
 *
 * @author aluno
 */
public class ErroSimples extends RuntimeException{ //Não Verificada

    private final String mensagem;
    
    public ErroSimples(String mensagem) {
        super(mensagem);
        this.mensagem = mensagem;
    }   

    public String getMensagem() {
        return mensagem;
    }

    @Override
    public String toString() {
        return "Erro simples (" + getMensagem() + ")"; 
    }
}
