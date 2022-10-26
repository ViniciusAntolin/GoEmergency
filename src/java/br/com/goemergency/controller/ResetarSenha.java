/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.goemergency.controller;

import br.com.goemergency.dao.PessoaDAOImpl;
import br.com.goemergency.model.Pessoa;
import br.com.goemergency.util.Criptografar;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author moretti
 */
@WebServlet(name = "ResetarSenha", urlPatterns = {"/ResetarSenha"})
public class ResetarSenha extends HttpServlet {

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
        String novasenha = request.getParameter("novasenha");
        String confirmacao = request.getParameter("confirmacao");

        String email = request.getParameter("email");

        try {
            PessoaDAOImpl pessoaDAO = new PessoaDAOImpl();
            Pessoa oPessoa = pessoaDAO.carregar(email);
            
            if (!novasenha.equals(confirmacao)) {
                request.setAttribute("tipomensagem", "Erro");
                request.setAttribute("mensagem", "Senhas não coincidem!");
                request.getRequestDispatcher("WEB-INF/resetarsenha.jsp").forward(request, response);
                return;
            }
            
            
            oPessoa.setSenha(Criptografar.encriptografar(novasenha));
            
            if(pessoaDAO.alterar(oPessoa)){
                request.setAttribute("tipomensagem", "Sucesso");
                request.setAttribute("mensagem", "Senha alterada com sucesso!");
                request.getRequestDispatcher("public/views/login.jsp").forward(request, response);
                return;
            }          
        } catch (Exception ex) {
            System.out.println("Erro no Servlet ResetarSenha\n Erro:" + ex.getMessage());
            ex.printStackTrace();
        }
        
        request.setAttribute("tipomensagem", "Erro");
        request.setAttribute("mensagem", "Não foi possível resetar a senha, tente novamente");
        request.getRequestDispatcher("WEB-INF/resetarsenha.jsp").forward(request, response);
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
