/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.goemergency.model;

import java.util.Date;


public class Pessoa {
    private Integer idPessoa;
    private String cpf;
    private String nome;
    private Date datanascimento;
    private String email;
    private String senha;
    private String code;
    private Integer idEndereco;
    private String Telefone;
    protected Boolean isPaciente = false;
    protected Boolean isMedico = false;
    protected Boolean isAdmin = false;
    private Date inactivatedAt;
    private Date createdAt;
    private Date updatedat;

    public Pessoa() {
    }

    public Pessoa(Integer idPessoa, String cpf, String nome, Date datanascimento, String email, String senha, Integer idEndereco, String Telefone, Boolean isMedico, Boolean isAdmin, Date inactivatedAt, Date createdAt, Date updatedat) {
        this.idPessoa = idPessoa;
        this.cpf = cpf;
        this.nome = nome;
        this.datanascimento = datanascimento;
        this.email = email;
        this.senha = senha;
        this.idEndereco = idEndereco;
        this.Telefone = Telefone;
        this.isMedico = isMedico;
        this.isAdmin = isAdmin;
        this.inactivatedAt = inactivatedAt;
        this.createdAt = createdAt;
        this.updatedat = updatedat;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
    
    public Integer getIdPessoa() {
        return idPessoa;
    }

    public void setIdPessoa(Integer idPessoa) {
        this.idPessoa = idPessoa;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {       
       cpf = cpf.replaceAll("[^a-zA-Z0-9]","");
       
       this.cpf = cpf;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Date getDatanascimento() {
        return datanascimento;
    }

    public void setDatanascimento(Date datanascimento) {
        this.datanascimento = datanascimento;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
     public Integer getIdEndereco() {
        return idEndereco;
    }

    public void setIdEndereco(Integer idEndereco) {
        this.idEndereco = idEndereco;
    }


    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

   
    public String getTelefone() {
        return Telefone;
    }

    public void setTelefone(String Telefone) {
        Telefone = Telefone.replaceAll("[^a-zA-Z0-9]","");
        
        this.Telefone = Telefone;
    }

    public boolean isIsPaciente() {
        return isPaciente;
    }

    public void setIsPaciente(boolean isPaciente) {
        this.isPaciente = isPaciente;
    }

    public boolean isIsMedico() {
        return isMedico;
    }

    public void setIsMedico(boolean isMedico) {
        this.isMedico = isMedico;
    }

    public boolean isIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
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

