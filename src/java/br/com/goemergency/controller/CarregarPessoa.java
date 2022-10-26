/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.goemergency.controller;

import br.com.goemergency.dao.EnderecoDAOImpl;
import br.com.goemergency.dao.PessoaDAOImpl;
import br.com.goemergency.dao.GenericDAO;
import br.com.goemergency.model.Endereco;
import br.com.goemergency.model.Pessoa;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 *
 * @author Aluno
 */
@WebServlet(name = "CarregarPessoa", urlPatterns = {"/CarregarPessoa"})
public class CarregarPessoa extends HttpServlet {

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
        int idPessoa = Integer.parseInt(request.getParameter("idpessoacarregar"));
        
        try{
            GenericDAO daopessoa = new PessoaDAOImpl();
            GenericDAO daoendereco = new EnderecoDAOImpl();
            
            Pessoa pessoa = (Pessoa) daopessoa.carregar(idPessoa);
            
            request.setAttribute("oPessoaCarregada", pessoa);
            
            Endereco ender = (Endereco) daoendereco.carregar(pessoa.getIdEndereco());
            
            request.setAttribute("oEstadoCarregado", ender);
            
            request.getRequestDispatcher("/ListarPessoa").forward(request, response);
        }catch(Exception ex){
            System.out.println("Erro no Servlet CarregarPessoa");
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
