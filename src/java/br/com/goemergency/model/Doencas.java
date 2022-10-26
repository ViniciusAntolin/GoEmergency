/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.goemergency.model;

/**
 *
 * @author windows
 */
public class Doencas {
    private Integer idDoenca;
    private String nomedoenca;
    private String descricao;
    private String causas;
    private String diagnostico;
    private String tratamento;
    private String medicoespecialista;
    private String prevencao;
    private String nomesintoma;

    public Doencas() {
    }

    public Doencas(Integer idDoenca, String nomedoenca, String descricao, String causas, String diagnostico, String tratamento, String medicoespecialista, String prevencao) {
        this.idDoenca = idDoenca;
        this.nomedoenca = nomedoenca;
        this.descricao = descricao;
        this.causas = causas;
        this.diagnostico = diagnostico;
        this.tratamento = tratamento;
        this.medicoespecialista = medicoespecialista;
        this.prevencao = prevencao;
    }

    public Integer getIdDoenca() {
        return idDoenca;
    }

    public void setIdDoenca(Integer idDoenca) {
        this.idDoenca = idDoenca;
    }

    public String getNomedoenca() {
        return nomedoenca;
    }

    public void setNomedoenca(String nomedoenca) {
        this.nomedoenca = nomedoenca;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getCausas() {
        return causas;
    }

    public void setCausas(String causas) {
        this.causas = causas;
    }

    public String getDiagnostico() {
        return diagnostico;
    }

    public void setDiagnostico(String diagnostico) {
        this.diagnostico = diagnostico;
    }

    public String getTratamento() {
        return tratamento;
    }

    public void setTratamento(String tratamento) {
        this.tratamento = tratamento;
    }

    public String getMedicoespecialista() {
        return medicoespecialista;
    }

    public void setMedicoespecialista(String medicoespecialista) {
        this.medicoespecialista = medicoespecialista;
    }

    public String getPrevencao() {
        return prevencao;
    }

    public void setPrevencao(String prevencao) {
        this.prevencao = prevencao;
    }

    public void setNomesintoma(String nomesintoma) {
        this.nomesintoma = nomesintoma;
    }

    public String getNomesintoma() {
        return nomesintoma;
    }

   
}

