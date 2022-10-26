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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author VINICIUSP-PC
 */
@WebServlet(name = "ValidarCode", urlPatterns = {"/ValidarCode"})
public class ValidarCode extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        String digito1 = request.getParameter("digito1");
        String digito2 = request.getParameter("digito2");
        String digito3 = request.getParameter("digito3");
        String digito4 = request.getParameter("digito4");
        String digito5 = request.getParameter("digito5");
        String digitos = digito1 + digito2 + digito3 + digito4 + digito5;
        String email = request.getParameter("email");

        try {
            PessoaDAOImpl pessoaDAO = new PessoaDAOImpl();
            Pessoa oPessoa = pessoaDAO.carregar(email);
            
            if (!digitos.equals(oPessoa.getCode())) {
                request.setAttribute("tipomensagem", "Erro");
                request.setAttribute("email", email);
                request.setAttribute("mensagem", "Digitos invalido, por favor, digite o certo.");
                request.getRequestDispatcher("WEB-INF/validarcode.jsp").forward(request, response);
                return;
            }
        } catch (Exception ex) {
            System.out.println("Erro no Servlet ValidarCode\n Erro:" + ex.getMessage());
            ex.printStackTrace();
        }

        request.setAttribute("email", email);
        request.setAttribute("tipomensagem", "Sucesso");
        request.setAttribute("mensagem", "Código correto, estamos redirecionando para trocar sua senha");
        request.getRequestDispatcher("WEB-INF/resetarsenha.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ValidarCode.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ValidarCode.class.getName()).log(Level.SEVERE, null, ex);
        }
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
