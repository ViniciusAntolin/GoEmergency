/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.goemergency.dao;

import java.util.List;


public interface GenericDAO {
    //assinatura de um método;
    public List<Object> listar();
    //Adicionar import java.util.List;
    //void - Não tem retorno
    public void excluir(int idObject);
    //idObject é para especificar o elemento
    //Carregar dados para navegador antes de alterar
    public Object carregar(int idObject);
    public Boolean alterar(Object object);

    public Integer cadastrar(Object object);
}
