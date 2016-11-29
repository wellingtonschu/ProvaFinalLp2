/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifcriodosul.lp2.exservlet.conceitual;

import java.io.Serializable;

public class HistoriaEmQuadrinhos implements Serializable, Comparable<HistoriaEmQuadrinhos> {

    private int id;
    private String titulo;
    private int paginas;
    
    
    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }
    
    /**
     * @return the titulo
     */
    public String getTitulo() {
        return titulo;
    }

    /**
     * @param titulo the titulo to set
     */
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    /**
     * @return the paginas
     */
    public int getPaginas() {
        return paginas;
    }

    /**
     * @param paginas the paginas to set
     */
    public void setPaginas(int paginas) {
        this.paginas = paginas;
    }

    public int compareTo(HistoriaEmQuadrinhos o) {
        return Integer.compare(id, o.getId());
    }

    @Override
    public boolean equals(Object obj) {
        return id == ((HistoriaEmQuadrinhos) obj).getId();
    }

}
