/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.goemergency.model;

import java.util.Date;

/**
 *
 * @author VINICIUSP-PC
 */
public class Endereco {
    private Integer idEndereco;
    private String cidade;
    private String estado;
    private String rua;
    private Integer numero;
    private String bairro;
    private String cep;
    private Date inactivatedAt;
    private Date createdAt;
    private Date updatedat;

    public Endereco() {
    }

    public Endereco(Integer idEndereco) {
        this.idEndereco = idEndereco;
    }

    public Endereco(String rua) {
        this.rua = rua;
    }

    public Endereco(Integer idEndereco, String rua) {
        this.idEndereco = idEndereco;
        this.rua = rua;
    }

    public Endereco(Integer idEndereco, String cidade, String estado, String rua, Integer numero, String bairro, String cep, Date inactivatedAt, Date createdAt, Date updatedat) {
        this.idEndereco = idEndereco;
        this.cidade = cidade;
        this.estado = estado;
        this.rua = rua;
        this.numero = numero;
        this.bairro = bairro;
        this.cep = cep;
        this.inactivatedAt = inactivatedAt;
        this.createdAt = createdAt;
        this.updatedat = updatedat;
    }
    
    public Integer getIdEndereco() {
        return idEndereco;
    }

    public void setIdEndereco(Integer idEndereco) {
        this.idEndereco = idEndereco;
    }

     public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public Integer getNumero() {
        return numero;
    }

    public void setNumero(Integer numero) {
        this.numero = numero;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public Date getInactivatedAt() {
        return inactivatedAt;
    }

    public void setInactivatedAt(Date inactivatedAt) {
        this.inactivatedAt = inactivatedAt;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedat() {
        return updatedat;
    }

    public void setUpdatedat(Date updatedat) {
        this.updatedat = updatedat;
    }
    
}
