/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.goemergency.controller;

import br.com.goemergency.dao.PessoaDAOImpl;
import br.com.goemergency.model.Pessoa;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author VINICIUSP-PC
 */
@WebServlet(name = "EnviarEmail", urlPatterns = {"/EnviarEmail"})
public class EnviarEmail extends HttpServlet {

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
        
        if (!email.equals("") && !email.equals(null)) {
            try {
                PessoaDAOImpl pessoaDAO = new PessoaDAOImpl();                

                if (!pessoaDAO.isValidEmailAddress(email)) {
                    request.setAttribute("tipomensagem", "Erro");
                    request.setAttribute("mensagem", "Email invalido");
                    request.getRequestDispatcher("public/views/esqueceusenha.jsp").forward(request, response);
                    return;
                }
                
                Pessoa oPessoa = pessoaDAO.carregar(email);
                
                oPessoa.setCode(Double.toString(Math.floor(Math.random() * 90000) + 10000).replace(".0", ""));

                if (!pessoaDAO.enviarEmail(oPessoa)) {
                    request.setAttribute("tipomensagem", "Erro");
                    request.setAttribute("mensagem", "Falha ao enviar email, tente novamente!");
                    request.getRequestDispatcher("public/views/esqueceusenha.jsp").forward(request, response);
                    return;
                }
                
                pessoaDAO.alterar(oPessoa);
                
                request.setAttribute("email", email);
                request.setAttribute("tipomensagem", "Sucesso");
                request.setAttribute("mensagem", "Email Enviado com sucesso!");
                request.getRequestDispatcher("WEB-INF/validarcode.jsp").forward(request, response);
            } catch (Exception ex) {
                System.out.println("Erro no Servlet EnviarEmail Erro:" + ex.getMessage());
                ex.printStackTrace();
            }
        }
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
