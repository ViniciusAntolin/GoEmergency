/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.goemergency.dao;

import br.com.goemergency.model.Pessoa;
import br.com.goemergency.util.ConnectionFactory;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.AddressException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
/**
 *
 * @author Aluno
 */
public class PessoaDAOImpl implements GenericDAO {

    private Connection conn;

    public PessoaDAOImpl() throws Exception {
        try {
            conn = ConnectionFactory.conectar();
            System.out.println("Conectado com sucesso");
        } catch (Exception ex) {
            System.out.println("Erro ao Conectar no Banco. Erro:"
                    + ex.getMessage());
            ex.printStackTrace();
            throw new Exception(ex.getMessage());
        }
    }

    @Override
    public Integer cadastrar(Object object) {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Pessoa pessoa = (Pessoa) object;
        Integer idPessoa = null;
        String sql = "INSERT INTO PESSOA"
                + "(cpf, nome, datanascimento, email, senha, telefone, idendereco, isPaciente, isMedico, isAdmin)"
                + " VALUES (?,?,?,?,?,?,?,?,?,?) RETURNING (idpessoa)";

        try {
            stmt = conn.prepareStatement(sql);

            stmt.setString(1, pessoa.getCpf());
            stmt.setString(2, pessoa.getNome());
            stmt.setDate(3, new java.sql.Date(pessoa.getDatanascimento().getTime()));
            stmt.setString(4, pessoa.getEmail());
            stmt.setString(5, pessoa.getSenha());
            stmt.setString(6, pessoa.getTelefone());
            stmt.setInt(7, pessoa.getIdEndereco());
            stmt.setBoolean(8, pessoa.isIsPaciente());
            stmt.setBoolean(9, pessoa.isIsMedico());
            stmt.setBoolean(10, pessoa.isIsAdmin());

            rs = stmt.executeQuery();

            if (rs.next()) {
                idPessoa = rs.getInt("idPessoa");

            }
        } catch (Exception ex) {
            System.out.println("Erro ao SalvarPessoa. Erro:"
                    + ex.getMessage());
            ex.printStackTrace();
        } finally {
            try {
                ConnectionFactory.fechar(conn, stmt, rs);
            } catch (Exception ex) {
                System.out.println("Erro ao Fechar Conexão. Erro:"
                        + ex.getMessage());
                ex.printStackTrace();
            }
        }
        return idPessoa;
    }

    @Override
    public List<Object> listar() {
        List<Object> resultado = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT p.*, e.*"
                + " from pessoa p, Endereco e"
                + " where p.idEndereco = e.idEndereco and p.inactivatedat is null"
                + "  and p.ispaciente is true order by p.idpessoa;";
                
        try {
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Pessoa oPessoa = new Pessoa();
                oPessoa.setIdPessoa(rs.getInt("idpessoa"));
                oPessoa.setNome(rs.getString("nome"));
                
                oPessoa.setCpf(rs.getString("cpf"));
                oPessoa.setDatanascimento(rs.getDate("datanascimento"));
                oPessoa.setEmail(rs.getString("email"));
                
                oPessoa.setTelefone(rs.getString("telefone"));
                oPessoa.setIdEndereco(rs.getInt("idendereco"));
                
                oPessoa.setCreatedAt(rs.getDate("createdat"));
                oPessoa.setUpdatedat(rs.getDate("updatedat"));
                
                resultado.add(oPessoa);
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao Listar PessoaDAOImpl \n Erro: " + ex.getMessage());
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

    @Override
    public void excluir(int idObject) {
        PreparedStatement stmt = null;
        Pessoa oPessoa = new Pessoa();

        String sql = "Update pessoa set inactivatedat = current_timestamp, "
                + "updatedat = current_timestamp where idPessoa=?";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idObject);
            stmt.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Erro ao Exluir PessoaDAOImpl \n Erro: " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            try {
                ConnectionFactory.fechar(conn, stmt, null);
            } catch (Exception ex) {
                System.out.println("Erro ao fechar conexao \n Eroo: " + ex.getMessage());
                ex.printStackTrace();
            }
        }
    }

    @Override
    public Object carregar(int idObject) {
        Pessoa oPessoa = new Pessoa();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "select * from pessoa where idpessoa = ?;";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idObject);
            rs = stmt.executeQuery();

            if (rs.next()) {
                oPessoa.setIdPessoa(rs.getInt("idpessoa"));
                oPessoa.setNome(rs.getString("nome"));
                oPessoa.setCpf(rs.getString("cpf"));
                oPessoa.setDatanascimento(rs.getDate("datanascimento"));
                oPessoa.setEmail(rs.getString("Email"));
                oPessoa.setSenha(rs.getString("senha"));
                oPessoa.setTelefone(rs.getString("telefone"));
                oPessoa.setIdEndereco(rs.getInt("idendereco"));

            }
        } catch (SQLException ex) {
            System.out.println("Erro ao Carregar Medico \n Erro: " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            try {
                ConnectionFactory.fechar(conn, stmt, null);
            } catch (Exception ex) {
                System.out.println("Erro ao Fechar Conexão Erro:" + ex.getMessage());
                ex.printStackTrace();
            }
        }

        return oPessoa;
    }

    public Pessoa carregar(String email) {
        PreparedStatement stmt = null;
        Pessoa oPessoa = new Pessoa();
        ResultSet rs = null;

        String sql = "SELECT * from pessoa WHERE email = ?";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            rs = stmt.executeQuery();

            if (rs.next()) {
                oPessoa.setIdPessoa(rs.getInt("idpessoa"));
                oPessoa.setNome(rs.getString("nome"));
                oPessoa.setCpf(rs.getString("cpf"));
                oPessoa.setDatanascimento(rs.getDate("datanascimento"));
                oPessoa.setEmail(rs.getString("email"));
                oPessoa.setSenha(rs.getString("senha"));      
                oPessoa.setTelefone(rs.getString("telefone"));
                oPessoa.setIdEndereco(rs.getInt("idendereco"));
                oPessoa.setCode(rs.getString("code"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao Carregar PessoaDAOImpl \n Erro: " + ex.getMessage());
            ex.printStackTrace();
        }

        return oPessoa;
    }

    @Override
    public Boolean alterar(Object object) {
        PreparedStatement stmt = null;
        Pessoa oPessoa = (Pessoa) object;

        String sql = "UPDATE pessoa SET "
                + "nome = ?, "
                + "cpf = ?, "
                + "email = ?, "
                + "telefone = ?, "
                + "code = ?, "
                + "senha = ?, "
                + "updatedAt = current_timestamp "
                + " WHERE idpessoa = ?;";

        try {
            stmt = conn.prepareStatement(sql);
            
            stmt.setString(1, oPessoa.getNome());
            stmt.setString(2, oPessoa.getCpf());
            stmt.setString(3, oPessoa.getEmail());
            stmt.setString(4, oPessoa.getTelefone());
            stmt.setString(5, oPessoa.getCode());
            stmt.setString(6, oPessoa.getSenha());
            stmt.setInt(7, oPessoa.getIdPessoa());
            
            stmt.executeUpdate();
            
            return true;
        } catch (Exception ex) {
            System.out.println("Erro ao alterar PessoaDAOImpl. Erro:"
                    + ex.getMessage());
            return false;
        } finally {
            try {
                ConnectionFactory.fechar(conn, stmt, null);
            } catch (Exception ex) {
                System.out.println("Erro ao Fechar Conexão. Erro:"
                        + ex.getMessage());
                ex.printStackTrace();
            }
        }
    }

    public Pessoa logarPessoa(String Email, String senha) throws SQLException {
        PreparedStatement stmt = null;
        Pessoa oPessoa = null;
        ResultSet rs = null;

        String sql = "SELECT * from pessoa"
                + " WHERE email = ? "
                + " AND senha = ? "
                + " AND inactivatedat IS NULL ";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, Email);
            stmt.setString(2, senha);
            rs = stmt.executeQuery();

            if (rs.next()) {
                oPessoa = new Pessoa();
                
                oPessoa.setIdPessoa(rs.getInt("idpessoa"));
                oPessoa.setNome(rs.getString("nome"));
                oPessoa.setEmail(rs.getString("email"));
                oPessoa.setCpf(rs.getString("cpf"));
                oPessoa.setIsAdmin(rs.getBoolean("isadmin"));
                oPessoa.setIsMedico(rs.getBoolean("ismedico"));
                oPessoa.setIsPaciente(rs.getBoolean("ispaciente"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao Logar Pessoa \n Erro: " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            try {
                ConnectionFactory.fechar(conn, stmt, null);
            } catch (Exception ex) {
                System.out.println("Erro ao Fechar Conexão Erro:" + ex.getMessage());
                ex.printStackTrace();
            }
        }
        return oPessoa;
    }

    public boolean enviarEmail(Pessoa pessoa) throws SQLException, MessagingException {
        try {
            String from = "vp259407@gmail.com";

            final String username = "e6b7667169ed6d";

            final String password = "72127b0658ffe0";

            String host = "smtp.mailtrap.io";

            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", "587");
            props.setProperty("mail.transport.protocol", "smtp");

            props.setProperty("mail.smtp.port", "587");
            props.setProperty("mail.smtp.ssl.trust", "*");
            Object requireTls = null;
            props.setProperty("mail.smtp.starttls.enable", String.valueOf(requireTls));
            props.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
            props.setProperty("mail.smtp.timeout", "300000");
            props.setProperty("mail.smtp.connectiontimeout", "300000");
            props.setProperty("mail.smtp.writetimeout", "300000");

            //create the Session object
            Session session = Session.getInstance(props,
                    new jakarta.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });

            try {
                Message message = new MimeMessage(session);

                message.setFrom(new InternetAddress(from));

                message.setRecipients(Message.RecipientType.TO,
                        InternetAddress.parse(pessoa.getEmail()));

                message.setSubject("Recuperação de senha");

                String mensagem = "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n"
                        + "<html xmlns=\"http://www.w3.org/1999/xhtml\">\n"
                        + "  <body style=\"margin: 0; background-color: #cccccc\">\n"
                        + "    <center\n"
                        + "      class=\"wrapper\"\n"
                        + "      style=\"\n"
                        + "        width: 100%;\n"
                        + "        table-layout: fixed;\n"
                        + "        background-image: url(../assets/Background-waves.png);\n"
                        + "        background-size: 100% 100%;\n"
                        + "        background-repeat: no-repeat;\n"
                        + "        padding-bottom: 60px;\n"
                        + "      \"\n"
                        + "    >\n"
                        + "      <table\n"
                        + "        class=\"main\"\n"
                        + "        width=\"100%\"\n"
                        + "        style=\"\n"
                        + "          margin: 0 auto;\n"
                        + "          width: 100%;\n"
                        + "          max-width: 600px;\n"
                        + "          border-spacing: 0;\n"
                        + "          font-family: sans-serif;\n"
                        + "          color: #4a4a4a;\n"
                        + "        \"\n"
                        + "      >\n"
                        + "        <tr>\n"
                        + "          <td height=\"8px\" style=\"padding: 0; background-color: #00aeef\"></td>\n"
                        + "        </tr>\n"
                        + "        <tr>\n"
                        + "          <td style=\"padding: 0\">\n"
                        + "            <table\n"
                        + "              width=\"100%\"\n"
                        + "              style=\"border-spacing: 0; background-color: #ffffff\"\n"
                        + "            >\n"
                        + "              <tr>\n"
                        + "                <td\n"
                        + "                  class=\"one-column\"\n"
                        + "                  style=\"\n"
                        + "                    padding: 0;\n"
                        + "                    padding: 30px 25px 0;\n"
                        + "                    text-align: center;\n"
                        + "                    font-size: 0;\n"
                        + "                  \"\n"
                        + "                >\n"
                        + "                  <table class=\"column\" style=\"border-spacing: 0; width: 100%\">\n"
                        + "                    <tr>\n"
                        + "                      <td style=\"padding: 0; text-align: center\">\n"
                        + "                        <a href=\"http://localhost:8080/GoEmergency/public/views/home.jsp\" target=\"_blank\">\n"
                        + "                          <img\n"
                        + "                            src=\"https://templates.hibotheme.com/teli/default/assets/img/logo.png\"\n"
                        + "                            alt=\"Logo\"\n"
                        + "                            width=\"180\"\n"
                        + "                            title=\"Logo\"\n"
                        + "                            style=\"border: 0\"\n"
                        + "                          />\n"
                        + "                        </a>\n"
                        + "                      </td>\n"
                        + "                    </tr>\n"
                        + "                  </table>\n"
                        + "                </td>\n"
                        + "              </tr>\n"
                        + "            </table>\n"
                        + "          </td>\n"
                        + "        </tr>\n"
                        + "        <!-- TITLE, TEXT & BUTTON -->\n"
                        + "        <tr>\n"
                        + "          <td style=\"padding: 0\">\n"
                        + "            <table\n"
                        + "              width=\"100%\"\n"
                        + "              style=\"border-spacing: 0; background-color: #ffffff\"\n"
                        + "            >\n"
                        + "              <tr>\n"
                        + "                <td style=\"padding: 0; padding: 15px 25px 40px\">\n"
                        + "                  <section>\n"
                        + "                    <h1 style=\"font-size: 32px; font-weight: 300\">Recupere sua conta</h1>\n"
                        + "                    <p style=\"padding-bottom: 20px; margin: 0; font-size: 14px\">\n"
                        + "                     Olá, " + pessoa.getNome()
                        + "                    </p>\n"
                        + "                    <br /><br />\n"
                        + "                    <p style=\"padding-bottom: 20px; margin: 0; font-size: 14px\">\n"
                        + "                      Seja bem-vindo ao GoEmergency!\n"
                        + "                    </p>\n"
                        + "                    <p style=\"padding-bottom: 20px; margin: 0; font-size: 14px\">\n"
                        + "                     Por favor, copie o código a seguir para prosseguir com a recuperação de senha: " + pessoa.getCode()
                        + "                    </p>\n"
                        + "                  </section>\n"
                        + "                </td>\n"
                        + "              </tr>\n"
                        + "            </table>\n"
                        + "          </td>\n"
                        + "        </tr>\n"
                        + "        <tr>\n"
                        + "          <td style=\"padding: 0\">\n"
                        + "            <table width=\"100%\" style=\"border-spacing: 0; padding-top: 150px\">\n"
                        + "              <tr>\n"
                        + "                <td\n"
                        + "                  style=\"padding: 0; text-align: center; padding: 0 25px 20px\"\n"
                        + "                >\n"
                        + "                  <p\n"
                        + "                    style=\"\n"
                        + "                      padding-bottom: 20px;\n"
                        + "                      margin: 0;\n"
                        + "                      padding-bottom: 10px;\n"
                        + "                      font-size: 14px;\n"
                        + "                    \"\n"
                        + "                  >\n"
                        + "                    Este é um e-mail gerado automaticamente. Por favor, não o\n"
                        + "                    responda.\n"
                        + "                  </p>\n"
                        + "                  <p\n"
                        + "                    style=\"\n"
                        + "                      padding-bottom: 20px;\n"
                        + "                      margin: 0;\n"
                        + "                      font-size: 12px;\n"
                        + "                      padding-bottom: 10px;\n"
                        + "                    \"\n"
                        + "                  >\n"
                        + "                    © 2022 Gabriel e Vínicius. Todos os direitos reservados\n"
                        + "                  </p>\n"
                        + "                </td>\n"
                        + "              </tr>\n"
                        + "            </table>\n"
                        + "          </td>\n"
                        + "        </tr>\n"
                        + "      </table>\n"
                        + "    </center>\n"
                        + "  </body>\n"
                        + "</html>";

                message.setContent(mensagem, "text/html;charset=UTF-8");

                Transport.send(message);

            } catch (MessagingException ex) {
                System.out.println("Erro ao Enviar Email(PessoaDAOImpl): Erro:" + ex.getMessage());
                return false;
            }
        } catch (Exception ex) {
            System.out.println("Erro ao Encontrar Email \n Erro: " + ex.getMessage());
            return false;
        }

        return true;
    }

    public boolean isValidEmailAddress(String Email) throws SQLException {
        boolean result = true;
        PreparedStatement stmt = null;
        Pessoa oPessoa = new Pessoa();
        ResultSet rs = null;

        try {
            InternetAddress emailAddr = new InternetAddress(Email);
            emailAddr.validate();
        } catch (AddressException ex) {
            System.out.println("Erro ao Validar email:" + ex.getMessage());
            ex.printStackTrace();
            return false;
        }
        String sql = "SELECT * from pessoa"
                + " WHERE email = ?"
                + " AND inactivatedat IS NULL";
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, Email);
            rs = stmt.executeQuery();
            if (rs.next()) {
                oPessoa.setEmail(Email);
            } else {
                return false;
            }

        } catch (SQLException ex) {
            System.out.println("Erro ao verificar email no banco (PESSOA):" + ex.getMessage());
            ex.printStackTrace();
            return false;
        }
        return result;
    }

    public boolean isValidCPF(String CPF) throws SQLException {
        boolean result = true;
        PreparedStatement stmt = null;
        Pessoa oPessoa = new Pessoa();
        ResultSet rs = null;
        if (CPF.equals("00000000000")
                || CPF.equals("11111111111")
                || CPF.equals("22222222222") || CPF.equals("33333333333")
                || CPF.equals("44444444444") || CPF.equals("55555555555")
                || CPF.equals("66666666666") || CPF.equals("77777777777")
                || CPF.equals("88888888888") || CPF.equals("99999999999")
                || (CPF.length() != 11)) {
            return false;
        }

        char dig10, dig11;
        int sm, i, r, num, peso;

        // "try" - protege o codigo para eventuais erros de conversao de tipo (int)
        try {
            // Calculo do 1o. Digito Verificador
            sm = 0;
            peso = 10;
            for (i = 0; i < 9; i++) {
                // converte o i-esimo caractere do CPF em um numero:
                // por exemplo, transforma o caractere '0' no inteiro 0
                // (48 eh a posicao de '0' na tabela ASCII)
                num = (int) (CPF.charAt(i) - 48);
                sm = sm + (num * peso);
                peso = peso - 1;
            }

            r = 11 - (sm % 11);
            if ((r == 10) || (r == 11)) {
                dig10 = '0';
            } else {
                dig10 = (char) (r + 48); // converte no respectivo caractere numerico
            }
            // Calculo do 2o. Digito Verificador
            sm = 0;
            peso = 11;
            for (i = 0; i < 10; i++) {
                num = (int) (CPF.charAt(i) - 48);
                sm = sm + (num * peso);
                peso = peso - 1;
            }

            r = 11 - (sm % 11);
            if ((r == 10) || (r == 11)) {
                dig11 = '0';
            } else {
                dig11 = (char) (r + 48);
            }

            // Verifica se os digitos calculados conferem com os digitos informados.
            if (!((dig10 == CPF.charAt(9)) && (dig11 == CPF.charAt(10)))) {
                return false;
            }
        } catch (Exception ex) {
            System.out.println("Erro ao validar CPF está incorreto (PESSOA):" + ex.getMessage());
            ex.printStackTrace();
            return false;
        }

        String sql = "SELECT * from pessoa"
                + " WHERE cpf = ?"
                + " AND inactivatedat IS NULL";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, CPF);
            rs = stmt.executeQuery();
            if (rs.next()) {
                return false;
            } else {
                oPessoa.setCpf(CPF);
            }

        } catch (SQLException ex) {
            System.out.println("Erro ao verificar CPF no banco (PESSOA):" + ex.getMessage());
            ex.printStackTrace();
            return false;
        }
        return result;
    }

    public static String imprimeCPF(String CPF) {
        return (CPF.substring(0, 3) + "." + CPF.substring(3, 6) + "."
                + CPF.substring(6, 9) + "-" + CPF.substring(9, 11));
    }
}