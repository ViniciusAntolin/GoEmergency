/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.goemergency.util;

import java.math.BigInteger;
import java.security.MessageDigest;

/**
 *
 * @author VINICIUSP-PC
 */
public class Criptografar {
    
    public static String encriptografar(String senha){
        String retorno = "";
        MessageDigest md;
        try{
            md = MessageDigest.getInstance("MD5");
            BigInteger hash = new BigInteger(1,md.digest(senha.getBytes()));
            retorno = hash.toString(16);
        }catch (Exception ex){
            System.out.println("Erro ao criptografar" + ex.getMessage());
            ex.printStackTrace();
        }
        return retorno;
    }
    
}
