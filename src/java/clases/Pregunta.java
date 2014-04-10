/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

/**
 *
 * @author Change Gate C.A.
 */



public class Pregunta  {

    String enunciado;
    String respuesta;
    
    public Pregunta(String enunciado){
        this.enunciado = enunciado;
    }
    
   public Pregunta(String enunciado, String respuesta){
        this.enunciado = enunciado;
        this.respuesta = respuesta;
    }

    public void setEnunciado(String enunciado) {
        this.enunciado = enunciado;
    }

    public String getEnunciado() {
        return enunciado;
    }

    public String getRespuesta() {
        return respuesta;
    }    
    
}
