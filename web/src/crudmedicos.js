'use strict';

let selectsUFCRM = document.querySelectorAll('.UFCRM');

(async() => {
  const url = `https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome`;

  const dados = await fetch(url);
  const estados = await dados.json();

  estados.forEach(estado => {
    selectsUFCRM.forEach(selectUFCRM =>{ 
        selectUFCRM.innerHTML += `<option value="${estado.sigla}">${estado.nome} - ${estado.sigla}</option>`;
     });
  });
})();

if (listademedicos){
    listademedicos.forEach(medico => {
    corpodatabela.innerHTML += `
        <tr>
            <td>${medico.idMedico}</td>
            <td>${medico.nome}</td>
            <td>${medico.cpf}</td>
            <td>${medico.crm}</td>
            <td>${medico.ufcrm}</td>
            <td>${medico.especialidade}</td>
            <td>${medico.datanascimento}</td>
            <td>${medico.email}</td>
            <td>${medico.idEndereco}</td>
            <td>${medico.Telefone}</td>
            <td>${medico.createdAt}</td>
            <td>${medico.updatedat}</td>
            <td class="editbutton"><a href="/GoEmergency/CarregarMedico?idmedicocarregar=${medico.idPessoa}"><p>Editar</p></a></td>
            <td class="deletebutton"><a href="/GoEmergency/ExcluirMedico?idmedicoexcluir=${medico.idPessoa}"><p>Deletar</p></a></td>
       </tr>
    `
});
}
