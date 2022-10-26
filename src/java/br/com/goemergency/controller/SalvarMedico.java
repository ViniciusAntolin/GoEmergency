/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.goemergency.controller;

import br.com.goemergency.dao.EnderecoDAOImpl;
import br.com.goemergency.dao.GenericDAO;
import br.com.goemergency.dao.MedicoDAOImpl;
import br.com.goemergency.model.Endereco;
import br.com.goemergency.model.Medico;
import br.com.goemergency.util.Conversoes;
import br.com.goemergency.util.Criptografar;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "SalvarMedico", urlPatterns = {"/SalvarMedico"})
public class SalvarMedico extends HttpServlet {

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
        //Entrada
        Medico oMedico = new Medico();
        Endereco oEndereco = new Endereco();

        //Recuperar os dados
        oMedico.setNome(request.getParameter("nome"));
        oMedico.setEmail(request.getParameter("email"));
        oMedico.setCpf(request.getParameter("cpf"));
        oMedico.setDatanascimento(Conversoes.ConverterData(request.getParameter("nascimento")));
        oMedico.setTelefone(request.getParameter("telefone"));
        oMedico.setEspecialidade(request.getParameter("especialidade"));
        oMedico.setSenha(Criptografar.encriptografar(request.getParameter("senha")));
        oMedico.setCrm(request.getParameter("crm"));
        oMedico.setUfcrm(request.getParameter("ufcrm"));
        oMedico.setIsMedico(true);
        
        oEndereco.setBairro(request.getParameter("bairro"));
        oEndereco.setCep(request.getParameter("cep"));
        oEndereco.setEstado(request.getParameter("estado"));
        oEndereco.setCidade(request.getParameter("cidade"));
        oEndereco.setNumero(Integer.parseInt(request.getParameter("numero")));
        oEndereco.setRua(request.getParameter("rua"));
   
        String mensagem = "";
        try{
            GenericDAO medicoDAO = new MedicoDAOImpl();
            GenericDAO endererecoDAO = new EnderecoDAOImpl();
            
            Integer idEndereco = endererecoDAO.cadastrar(oEndereco);

            if(idEndereco != null){
               oMedico.setIdEndereco(idEndereco);
            }else{
                mensagem="Falha ao cadastrar Endereco - Medico";
            }
            
            if(medicoDAO.cadastrar(oMedico) != null){
               request.setAttribute("tipomensagem", "Sucesso");
               request.setAttribute("mensagem", "Médico cadastrado com Sucesso!");
               request.getRequestDispatcher("public/views/login.jsp").forward(request, response);
               return;
               
            }else{
               mensagem="Falha ao cadastrar Medico";
            }
            
        }catch(Exception ex){
            System.out.println("Erro no Servlet SalvarMedico Erro:" + ex.getMessage());
            mensagem = "Erro Interno, entre em contato com o Suporte!";
        }
        
        request.setAttribute("tipomensagem", "Erro");
        request.setAttribute("mensagem", mensagem);
        request.getRequestDispatcher("public/views/medico/cadastromedico.jsp").forward(request, response);
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
