/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.goemergency.model;

/**
 *
 * @author windows
 */
public class Sintomas {
    private Integer idSintoma;
    private String nomesintoma;
    private String partecorpo;

    public Sintomas() {
    }

    public Sintomas(Integer idSintoma, String nomesintoma, String partecorpo) {
        this.idSintoma = idSintoma;
        this.nomesintoma = nomesintoma;
        this.partecorpo = partecorpo;
    }

    public Integer getIdSintoma() {
        return idSintoma;
    }

    public void setIdSintoma(Integer idSintoma) {
        this.idSintoma = idSintoma;
    }

    public String getNomesintoma() {
        return nomesintoma;
    }

    public void setNomesintoma(String nomesintoma) {
        this.nomesintoma = nomesintoma;
    }

    public String getPartecorpo() {
        return partecorpo;
    }

    public void setPartecorpo(String partecorpo) {
        this.partecorpo = partecorpo;
    }

}