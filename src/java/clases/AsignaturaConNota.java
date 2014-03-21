/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.io.Serializable;

/**
 *
 * @author CHANGE Gate
 */
public class AsignaturaConNota implements Serializable {

    private Asignatura asignatura;
    private int nota;
    private String codigo;

    public AsignaturaConNota() {
    }

    /**
     *
     * @param asignatura
     * @param nota
     */
    public AsignaturaConNota(Asignatura asignatura, int nota) {
        this.asignatura = new Asignatura(asignatura);
        this.nota = nota;
    }

    public Asignatura getAsignatura() {
        return asignatura;
    }

    public void setAsignatura(Asignatura asignatura) {
        this.asignatura = asignatura;
    }

    public int getNota() {
        return nota;
    }

    public void setNota(int nota) {
        this.nota = nota;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }
}
