/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.goemergency.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Tassia
 */
public class Conversoes {

    //Método para converter String em Data
    public static Date ConverterData(String data) {
        try {
            if ((data != null) || (!data.trim().equals(""))) {
                String[] arrayString = data.split("-");
                
                String aux = arrayString[0];
                arrayString[0] = arrayString[2];
                arrayString[2] = aux;
                
                String str = String.join("/", arrayString);
                
                Date date = new SimpleDateFormat("dd/MM/yyyy").parse(str); 

                return date;
            }else{
                return null;
            }
        }catch(Exception ex){
            System.out.println("Erro ao converter data: "+ ex.getMessage());
            ex.printStackTrace();
            return null;
        }
    }
}
