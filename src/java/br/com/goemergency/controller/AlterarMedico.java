/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.goemergency.controller;

import br.com.goemergency.dao.EnderecoDAOImpl;
import br.com.goemergency.dao.GenericDAO;
import br.com.goemergency.dao.MedicoDAOImpl;
import br.com.goemergency.dao.PessoaDAOImpl;
import br.com.goemergency.model.Endereco;
import br.com.goemergency.model.Medico;
import br.com.goemergency.model.Pessoa;
import br.com.goemergency.util.Conversoes;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author windows
 */
@WebServlet(name = "AlterarMedico", urlPatterns = {"/AlterarMedico"})
public class AlterarMedico extends HttpServlet {

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
        
        Medico oMedico = new Medico();
        Pessoa oPessoa = new Pessoa();
        Endereco oEndereco = new Endereco();
        
        oMedico.setCrm(request.getParameter("crm"));
        oMedico.setUfcrm(request.getParameter("ufcrm"));
        oMedico.setEspecialidade(request.getParameter("especialidade"));
        oMedico.setIdPessoa(Integer.parseInt(request.getParameter("idpessoa")));
         
        oPessoa.setNome(request.getParameter("nome"));
        oPessoa.setEmail(request.getParameter("email"));
        oPessoa.setCpf(request.getParameter("cpf"));
        oPessoa.setDatanascimento(Conversoes.ConverterData(request.getParameter("nascimento")));
        oPessoa.setTelefone(request.getParameter("telefone"));

        oEndereco.setBairro(request.getParameter("bairro"));
        oEndereco.setCep(request.getParameter("cep"));
        oEndereco.setEstado(request.getParameter("estado"));
        oEndereco.setCidade(request.getParameter("cidade"));
        oEndereco.setNumero(Integer.parseInt(request.getParameter("numero")));
        oEndereco.setRua(request.getParameter("rua"));
                
        try {
            GenericDAO dao = new MedicoDAOImpl();
            GenericDAO dao1 = new PessoaDAOImpl();
            GenericDAO dao2 = new EnderecoDAOImpl();

            oMedico.setIdMedico(Integer.parseInt(request.getParameter("idmedico")));
            oPessoa.setIdPessoa(Integer.parseInt(request.getParameter("idpessoa")));
            oEndereco.setIdEndereco(Integer.parseInt(request.getParameter("idendereco")));
            
            if (dao.alterar(oMedico) &&  dao1.alterar(oPessoa) && dao2.alterar(oEndereco)) {
                request.setAttribute("tipomensagem", "Sucesso");
                request.setAttribute("mensagem", "Pessoa alterada com sucesso!");
                request.getRequestDispatcher("/ListarMedico").forward(request, response);
                return;
            }
        } catch (Exception ex) {
            System.out.println("Erro ao AlterarMedico Erro:" + ex.getMessage());
            ex.printStackTrace();
        }
        request.getRequestDispatcher("/ListarMedico").forward(request, response);
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
