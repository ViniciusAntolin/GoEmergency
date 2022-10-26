/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.goemergency.controller;

import br.com.goemergency.dao.ChatDAOImpl;
import br.com.goemergency.model.Chat;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author windows
 */
@WebServlet(name = "CriarChat", urlPatterns = {"/CriarChat"})
public class CriarChat extends HttpServlet {

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
        Chat oChat = new Chat();

        oChat.setIdmedico(Integer.parseInt(request.getParameter("idmedico")));
        oChat.setIdpaciente(Integer.parseInt(request.getParameter("idpaciente")));
        
        HttpSession session = request.getSession(true);
        session.setAttribute("nomemedico", request.getParameter("nomemedico"));
        session.setAttribute("especialidade", request.getParameter("especialidade"));

        String mensagem = "";
        try {
            ChatDAOImpl chatDAO = new ChatDAOImpl();
            
            Integer idchat = chatDAO.isValidChat(oChat);

            if (idchat == null) {
                idchat = chatDAO.cadastrar(oChat);
                
                if (idchat == null) {
                    request.setAttribute("tipomensagem", "Erro");
                    request.setAttribute("mensagem", "Erro ao Cadastrar Chat");
                    request.getRequestDispatcher("/public/views/principal/paciente/categories.jsp").forward(request, response);
                    return;
                }
            }
            
            request.getRequestDispatcher("ListarMensagens?idchat=" + idchat).forward(request, response);
            return;

        } catch (Exception ex) {
            System.out.println("Erro no Servlet CriarChat Erro:" + ex.getMessage());
            mensagem = "Erro Interno, entre em contato com o Suporte!";
        }

        request.setAttribute("tipomensagem", "Erro");
        request.setAttribute("mensagem", mensagem);
        request.getRequestDispatcher("/public/views/principal/paciente/categories.jsp").forward(request, response);
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
