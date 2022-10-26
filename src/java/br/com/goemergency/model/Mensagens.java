/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.goemergency.model;

import java.util.Date;

/**
 *
 * @author windows
 */
public class Mensagens extends Chat{
    private Integer idmensagem;
    private Integer idChat;
    private String conteudo;
    private Boolean isadministrative;
    private Date createdat;
    private long datetomili;

    public Mensagens() {
    }

    public Mensagens(Integer idmensagem, Integer idChat, String conteudo, Boolean isadministrative, Date createdat) {
        this.idmensagem = idmensagem;
        this.idChat = idChat;
        this.conteudo = conteudo;
        this.isadministrative = isadministrative;
        this.createdat = createdat;
    }

    public Mensagens(Integer idmensagem, Integer idChat, String conteudo, Boolean isadministrative, Date createdat, Integer idchat, Integer idmedico, Integer idpaciente) {
        super(idchat, idmedico, idpaciente);
        this.idmensagem = idmensagem;
        this.idChat = idChat;
        this.conteudo = conteudo;
        this.isadministrative = isadministrative;
        this.createdat = createdat;
    }

    public Integer getIdmensagem() {
        return idmensagem;
    }

    public void setIdmensagem(Integer idmensagem) {
        this.idmensagem = idmensagem;
    }

    public Integer getIdChat() {
        return idChat;
    }

    public void setIdChat(Integer idChat) {
        this.idChat = idChat;
    }

    public String getConteudo() {
        return conteudo;
    }

    public void setConteudo(String conteudo) {
        this.conteudo = conteudo;
    }

    public Boolean getIsadministrative() {
        return isadministrative;
    }

    public void setIsadministrative(Boolean isadministrative) {
        this.isadministrative = isadministrative;
    }

    public Date getCreatedat() {
        return createdat;
    }

    public void setCreatedat(Date createdat) {
        this.createdat = createdat;
    }

    public long getDatetomili() {
        return datetomili;
    }

    public void setDatetomili(long datetomili) {
        this.datetomili = datetomili;
    }
    
    
}
