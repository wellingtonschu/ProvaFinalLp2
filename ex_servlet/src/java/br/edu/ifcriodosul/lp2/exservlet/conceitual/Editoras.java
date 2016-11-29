/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifcriodosul.lp2.exservlet.conceitual;

import java.io.Serializable;

/**
 *
 * @author Wesley
 */
public class Editoras implements Serializable, Comparable<Editoras> {

    private int id;
    private String nome;

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
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    public int compareTo(Editoras o) {
        return Integer.compare(id, o.getId());
    }

    @Override
    public boolean equals(Object obj) {
        return id == ((Editoras) obj).getId();
    }

}
