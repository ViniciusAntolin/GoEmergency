'use strict';

const limparFormulario = (endereco) =>{
    document.querySelector('#contentcreatemodal #rua').value = '';
    document.querySelector('#contentcreatemodal #bairro').value = '';
    document.querySelector('#contentcreatemodal #cidade').value = '';
    document.querySelector('#contentcreatemodal #estado').value = '';
};

const preencherFormulario = (endereco) =>{
    document.querySelector('#contentcreatemodal #rua').value = endereco.logradouro;
    document.querySelector('#contentcreatemodal #bairro').value = endereco.bairro;
    document.querySelector('#contentcreatemodal #cidade').value = endereco.localidade;
    document.querySelector('#contentcreatemodal #estado').value = endereco.uf;
};

const eNumero = (numero) => /^[0-9]+$/.test(numero);

const cepValido = (cep) => cep.length === 8 && eNumero(cep); 

const pesquisarCep = async() => {
    limparFormulario();
    
    const cep = document.querySelector('#contentcreatemodal #cep').value.replace("-","");
    const url = `https://viacep.com.br/ws/${cep}/json/`;
    if (cepValido(cep)){
        const dados = await fetch(url);
        const endereco = await dados.json();
        if (endereco.hasOwnProperty('erro')){
            document.querySelector('#contentcreatemodal #rua').value = 'CEP não encontrado!';
        }else {
            preencherFormulario(endereco);
        }
    }else{
        document.querySelector('#contentcreatemodal #rua').value = 'CEP incorreto!';
    }
     
};

document.querySelector('#contentcreatemodal #cep').addEventListener('focusout',pesquisarCep);

