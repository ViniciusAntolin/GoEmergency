/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.goemergency.controller;

import br.com.goemergency.dao.EnderecoDAOImpl;
import br.com.goemergency.dao.MedicoDAOImpl;
import br.com.goemergency.dao.GenericDAO;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Aluno
 */
@WebServlet(name = "ListarMedico", urlPatterns = {"/ListarMedico"})
public class ListarMedico extends HttpServlet {

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
        String especialidade = request.getParameter("especialidade");
        
        try{
            MedicoDAOImpl daoMedico = new MedicoDAOImpl();
            
             List<Object> medicos = null;
             
             if(especialidade != null){
               medicos = daoMedico.listar(especialidade);
            } else {
               medicos = daoMedico.listar();
            }
            
            String medicosJson = new Gson().toJson(medicos);
            
            request.setAttribute("listademedicos", medicosJson);
            
            if(especialidade != null){
                request.getRequestDispatcher("/public/views/principal/paciente/chat.jsp")
                    .forward(request, response);
                return;
            } else {
                request.getRequestDispatcher("/public/views/administrador/crudmedicos.jsp")
                    .forward(request, response);   
                return;
            }
        }catch(Exception ex){
            System.out.println("Erro no Servlet ListarMedico");
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
