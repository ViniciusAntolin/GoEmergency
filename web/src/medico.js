'use strict';

let selectUFCRM = document.getElementById('UFCRM');

(async() => {
  const url = `https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome`;

  const dados = await fetch(url);
  const estados = await dados.json();

  estados.forEach(estado => {
    selectUFCRM.innerHTML += `<option value="${estado.sigla}">${estado.nome} - ${estado.sigla}</option>`;
  })
})();