/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.goemergency.controller;

import br.com.goemergency.dao.ChatDAOImpl;
import br.com.goemergency.dao.MedicoDAOImpl;
import br.com.goemergency.dao.MensagensDAOImpl;
import br.com.goemergency.model.Chat;
import br.com.goemergency.model.Mensagens;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


/**
 *
 * @author Aluno
 */
@WebServlet(name = "ListarMensagens", urlPatterns = {"/ListarMensagens"})
public class ListarMensagens extends HttpServlet {

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
        
        Mensagens oMessage = new Mensagens();
        
        oMessage.setIdChat(Integer.parseInt(request.getParameter("idchat")));
       
        try {

            MensagensDAOImpl mensagensDAO = new MensagensDAOImpl();
            MedicoDAOImpl daoMedico = new MedicoDAOImpl();
            
            HttpSession session = request.getSession(true);
            
            List<Object> mensagens = mensagensDAO.listar(oMessage);
            
            
            String mensagensJson = new Gson().toJson(mensagens);
            
            if(session.getAttribute("especialidade") != null){
               List<Object> medicos = daoMedico.listar((String) session.getAttribute("especialidade"));
                          
               String medicosJson = new Gson().toJson(medicos);

               request.setAttribute("listademedicos", medicosJson);
               request.setAttribute("listademensagens", mensagensJson);
               request.setAttribute("idchat", request.getParameter("idchat"));
               
               request.getRequestDispatcher("public/views/principal/paciente/mensagens.jsp")
                    .forward(request, response);
               return;

            } else {                
                Chat oChat = new Chat();

                oChat.setIdmedico((Integer) session.getAttribute("idmedico"));
        
                ChatDAOImpl chatDAO = new ChatDAOImpl();
                
                List<Object> chats = chatDAO.listar(oChat);
                    
                String chatsJson = new Gson().toJson(chats);

                request.setAttribute("listadechats", chatsJson);
                request.setAttribute("listademensagens", mensagensJson);
                request.setAttribute("idchat", request.getParameter("idchat"));
                session.setAttribute("nomepaciente", request.getParameter("nomepaciente"));

                request.getRequestDispatcher("public/views/principal/medico/mensagensmedico.jsp")
                        .forward(request, response);
                return;
            }
        } catch (Exception ex) {
            System.out.println("Erro ao ListarMensagens");
            ex.printStackTrace();
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
