/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.goemergency.controller;

import br.com.goemergency.dao.MensagensDAOImpl;
import br.com.goemergency.model.Mensagens;
import br.com.goemergency.model.Pessoa;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


/**
 *
 * @author Aluno
 */
@WebServlet(name = "CriarMensagens", urlPatterns = {"/CriarMensagens"})
public class CriarMensagens extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        
        Mensagens oMensagens = new Mensagens();
        
        HttpSession session = request.getSession();
        
        Pessoa oPessoa = (Pessoa) session.getAttribute("oPessoa");
        
        Integer idchat = Integer.parseInt(request.getParameter("idchat"));
        
        oMensagens.setIdChat(idchat);
        oMensagens.setConteudo(request.getParameter("conteudo"));
        
        if(oPessoa != null && oPessoa.isIsMedico() == true){
             request.setAttribute("nomepaciente", request.getParameter("nomepaciente"));
             
             oMensagens.setIsadministrative(true);
        } else {
            oMensagens.setIsadministrative(false);
        }
        
        String mensagem = "";
        
        try{
            MensagensDAOImpl mensagensDAO = new MensagensDAOImpl();
            
            if(mensagensDAO.cadastrar(oMensagens) != null){
                request.setAttribute("idchat", idchat);
                
                request.getRequestDispatcher("/ListarMensagens").forward(request, response);
                return;
            }
        }catch(Exception ex) {
            System.out.println("Erro no Servlet CriarMensagens Erro:" + ex.getMessage());
            mensagem = "Erro Interno, entre em contato com o Suporte!";
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
