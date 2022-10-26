/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.goemergency.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Tassia
 */
public class ConnectionFactory {
    //Sempre adicionar a biblioteca do JDBC
    //Botão Direito Bibliotecas >> Adicionar Bibliotecas > Driver JDBC do PostgreSQL

    //Método de conexão
    //metododeacesso TIPODERETORNO
    public static Connection conectar() throws Exception {
        //Caminho do BD
        String url = "jdbc:postgresql://localhost:5432/goemergency";
        String user = "postgres";
        String password = "postdba";

        //Conectar
        try { //Tentativa de conectar
            Class.forName("org.postgresql.Driver");
            return DriverManager.getConnection(url, user, password);
        } catch (SQLException ex) {//Mensagem caso dê erro
            throw new Exception("Erro ao conectar" + ex.getMessage());
        }
    }

    //Fechar a conexão
    public static void fechar(Connection conn, Statement stmt, ResultSet rs) throws Exception {
        try {
            if (conn != null) {
                conn.close(); //Fecha a conexao
            }

            if (stmt != null) {
                stmt.close(); //Fecha quem manipula SQL
            }
            if (rs != null) {
                rs.close(); //Fecha os dados que estão no ResultSet(armazena dados do BD)
            }
        } catch (SQLException ex) {
            throw new Exception("Erro ao conectar" + ex.getMessage());
        }
    }
}
