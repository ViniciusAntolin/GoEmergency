/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.goemergency.model;

/**
 *
 * @author windows
 */
public class Chat {
    private Integer idchat;
    private Integer idmedico;
    private Integer idpaciente;

    public Chat() {
    }

    public Chat(Integer idchat, Integer idmedico, Integer idpaciente) {
        this.idchat = idchat;
        this.idmedico = idmedico;
        this.idpaciente = idpaciente;
    }

    public Integer getIdchat() {
        return idchat;
    }

    public void setIdchat(Integer idchat) {
        this.idchat = idchat;
    }

    public Integer getIdmedico() {
        return idmedico;
    }

    public void setIdmedico(Integer idmedico) {
        this.idmedico = idmedico;
    }

    public Integer getIdpaciente() {
        return idpaciente;
    }

    public void setIdpaciente(Integer idpaciente) {
        this.idpaciente = idpaciente;
    }

}
