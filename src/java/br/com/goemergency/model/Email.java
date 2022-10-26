package br.com.goemergency.model;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author marcelosiedler
 */
public class Email {

    private String emailDestinatario;
    private String assunto;
    private String msg;

    public Email() {
    }

    public Email(String emailDestinatario, String assunto, String msg) {
        this.emailDestinatario = emailDestinatario;
        this.assunto = assunto;
        this.msg = msg;
    }

    public String getEmailDestinatario() {
        return emailDestinatario;
    }

    public void setEmailDestinatario(String emailDestinatario) {
        this.emailDestinatario = emailDestinatario;
    }

    public String getAssunto() {
        return assunto;
    }

    public void setAssunto(String assunto) {
        this.assunto = assunto;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

}
