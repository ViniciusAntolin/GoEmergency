/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.goemergency.controller;

import br.com.goemergency.dao.MedicoDAOImpl;
import br.com.goemergency.dao.PessoaDAOImpl;
import br.com.goemergency.filter.FilterAutenticacaoLogin;
import br.com.goemergency.model.Medico;
import br.com.goemergency.util.Criptografar;
import br.com.goemergency.model.Pessoa;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author VINICIUSP-PC
 */
@WebServlet(name = "LogarPessoa", urlPatterns = {"/LogarPessoa"})
public class LogarPessoa extends HttpServlet {

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
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        
        String mensagem = "";

        if(!email.equals("") && !senha.equals("")){
            try{
                PessoaDAOImpl dao = new PessoaDAOImpl();
                Pessoa oPessoa = dao.logarPessoa(email, Criptografar.encriptografar(senha));
                        
                if(oPessoa != null){
                    HttpSession session = request.getSession(true);
                    session.setAttribute("oPessoa", oPessoa);
                    session.setAttribute("idpessoa", oPessoa.getIdPessoa());
                    session.setAttribute("username", oPessoa.getNome());
                    
                    if(oPessoa.isIsMedico()){
                         MedicoDAOImpl medicoDao = new MedicoDAOImpl();
                         
                          Medico oMedico = (Medico) medicoDao.carregar(oPessoa.getIdPessoa());
                          
                          session.setAttribute("idmedico", oMedico.getIdMedico());
                    }
                    
                    response.sendRedirect(request.getContextPath() + "/public/views/login.jsp");
                    return;
                } else {
                    mensagem = "Email ou senha inválidos!";
                }     
            } catch (Exception ex) {
               System.out.println("Erro no Servlet LogarPessoa" + ex.getMessage());
               mensagem = "Erro Interno, entre em contato com o Suporte!";
            }
        }else {
          mensagem = "Usuário ou senha não preenchidos!";
        } 
        
        request.setAttribute("tipomensagem", "Erro");
        request.setAttribute("mensagem", mensagem);
        request.getRequestDispatcher("public/views/login.jsp").forward(request, response);
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
