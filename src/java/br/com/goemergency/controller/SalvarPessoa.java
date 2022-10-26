/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.goemergency.controller;

import br.com.goemergency.dao.EnderecoDAOImpl;
import br.com.goemergency.dao.GenericDAO;
import br.com.goemergency.dao.PessoaDAOImpl;
import br.com.goemergency.util.Criptografar;
import br.com.goemergency.model.Endereco;
import br.com.goemergency.model.Pessoa;
import br.com.goemergency.util.Conversoes;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SalvarPessoa", urlPatterns = {"/SalvarPessoa"})
public class SalvarPessoa extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Pessoa oPessoa = new Pessoa();
        Endereco oEndereco = new Endereco();
                
        oPessoa.setNome(request.getParameter("nome"));
        oPessoa.setEmail(request.getParameter("email"));
        oPessoa.setCpf(request.getParameter("cpf"));
        oPessoa.setDatanascimento(Conversoes.ConverterData(request.getParameter("nascimento")));
        oPessoa.setTelefone(request.getParameter("telefone"));
        oPessoa.setSenha(Criptografar.encriptografar(request.getParameter("senha")));
        
         if(request.getParameter("profile") == null){
             oPessoa.setIsPaciente(true);
         } else {
            String profile = request.getParameter("profile");
            
            if(profile.equals("administrador")){
                oPessoa.setIsAdmin(true);
            } else {
                oPessoa.setIsPaciente(true);
            }
         }
         

        oEndereco.setBairro(request.getParameter("bairro"));
        oEndereco.setCep(request.getParameter("cep"));
        oEndereco.setEstado(request.getParameter("estado"));
        oEndereco.setCidade(request.getParameter("cidade"));
        oEndereco.setNumero(Integer.parseInt(request.getParameter("numero")));
        oEndereco.setRua(request.getParameter("rua"));

        String mensagem = "";
        
        try {
            PessoaDAOImpl pessoaDAO = new PessoaDAOImpl();
            GenericDAO endererecoDAO = new EnderecoDAOImpl();

            Integer idEndereco = endererecoDAO.cadastrar(oEndereco);

            if (!pessoaDAO.isValidCPF(oPessoa.getCpf())) {
                request.setAttribute("tipomensagem", "Erro");
                request.setAttribute("mensagem", "CPF Invalido");
                
                 if(request.getParameter("profile") == null){
                     request.getRequestDispatcher("public/views/paciente/cadastropaciente.jsp").forward(request, response);
                 }else{
                     request.getRequestDispatcher("/ListarPessoa").forward(request, response);
                 }
                
                return;
            }
            
            if (pessoaDAO.isValidEmailAddress(oPessoa.getEmail())) {
                request.setAttribute("tipomensagem", "Erro");
                request.setAttribute("mensagem", "Email já existente na base de dados");
                
                 if(request.getParameter("profile") == null){
                      request.getRequestDispatcher("public/views/paciente/cadastropaciente.jsp").forward(request, response);
                 }else{
                    request.getRequestDispatcher("/ListarPessoa").forward(request, response);
                 }
               
                return;
            }

            if (idEndereco != null) {
                oPessoa.setIdEndereco(idEndereco);
            } else {
                request.setAttribute("tipomensagem", "Erro");
                request.setAttribute("mensagem", "Falha ao cadastrar endereco da Pessoa!");
                
                 if(request.getParameter("profile") == null){
                      request.getRequestDispatcher("public/views/paciente/cadastropaciente.jsp").forward(request, response);
                 }else{
                    request.getRequestDispatcher("/ListarPessoa").forward(request, response);
                 }
                
                return;
            }

            if (pessoaDAO.cadastrar(oPessoa) != null) {
                request.setAttribute("tipomensagem", "Sucesso");
                request.setAttribute("mensagem", "Pessoa cadastrada com Sucesso!");
                
                 if(request.getParameter("profile") == null){
                     request.getRequestDispatcher("public/views/login.jsp").forward(request, response);
                 }else{
                    request.getRequestDispatcher("/ListarPessoa").forward(request, response);
                 }
                
                return;
            } else {
                mensagem = "Falha ao Cadastrar Pessoa!";
            }

        } catch (Exception ex) {
            System.out.println("Erro no Servlet SalvarPaciente Erro:" + ex.getMessage());
            mensagem = "Erro Interno, entre em contato com o Suporte!";
        }
        
        request.setAttribute("tipomensagem", "Erro");
        request.setAttribute("mensagem", mensagem);
        
        if(request.getParameter("profile") == null){
           request.getRequestDispatcher("public/views/paciente/cadastropaciente.jsp").forward(request, response);
        }else{
           request.getRequestDispatcher("/ListarPessoa").forward(request, response);
        }
        
        return;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
