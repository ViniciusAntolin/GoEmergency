/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.goemergency.dao;

import br.com.goemergency.model.Doencas;
import br.com.goemergency.util.ConnectionFactory;
import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author windows
 */
public class DoencasDAOImpl {

    private Connection conn;

    public DoencasDAOImpl() throws Exception {
        try {
            conn = ConnectionFactory.conectar();
            System.out.println("Conectado com sucesso");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
    }

    public List<Object> listar(Integer[] ids) {
        List<Object> resultado = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        String sql = ("select distinct(d.iddoenca), d.nomedoenca\n"
                + ", d.descricao\n"
                + ", d.causas\n"
                + ", d.diagnostico\n"
                + ", d.tratamento\n"
                + ", d.medicoespecialista\n"
                + ", d.prevencao\n"
                + ", s.nomesintoma from doenca d \n" 
                + "inner join doencas_sintomas ds on d.iddoenca "
                + "= ds.iddoenca inner join sintomas s on ds.idsintoma = s.idsintoma WHERE s.idsintoma = ANY(ARRAY[?]);");
        try {
            Array anArray = conn.createArrayOf("INTEGER", ids);
            stmt = conn.prepareStatement(sql);
            stmt.setArray(1, anArray);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Doencas oDoenca = new Doencas();
                oDoenca.setIdDoenca(rs.getInt("iddoenca"));
                oDoenca.setNomedoenca(rs.getString("nomedoenca"));
                oDoenca.setDescricao(rs.getString("descricao"));
                oDoenca.setCausas(rs.getString("causas"));
                oDoenca.setDiagnostico(rs.getString("diagnostico"));
                oDoenca.setTratamento(rs.getString("tratamento"));
                oDoenca.setMedicoespecialista(rs.getString("medicoespecialista"));
                oDoenca.setPrevencao(rs.getString("prevencao"));
                oDoenca.setNomesintoma(rs.getString("nomesintoma"));
                resultado.add(oDoenca);
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao Listar DoencaDAOImpl \n Erro: " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            //Fecha a conexão
            try {
                ConnectionFactory.fechar(conn, stmt, rs);
            } catch (Exception ex) {
                System.out.println("Erro ao fechar parametros de conexao \n Erro: " + ex.getMessage());
                ex.printStackTrace();
            }
        }
        return resultado;
    }
}
