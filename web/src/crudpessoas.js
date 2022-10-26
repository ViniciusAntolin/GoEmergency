const openmenu = document.querySelector("#openmenu");
const menupopup = document.querySelector("#menupopup");
const editmodal = document.querySelector("#editmodal");
const closebuttonmodal = document.querySelector("#closebuttonmodal");
const closebuttoncreatemodal = document.querySelector("#closebuttoncreatemodal");
const criarbotao = document.querySelector("#criarbotao");
const contenteditmodal = document.querySelector("#contenteditmodal");
const contentcreatemodal = document.querySelector("#contentcreatemodal");
const corpodatabela = document.querySelector("tbody");

openmenu.addEventListener("click", ()=>{
    menupopup.classList.toggle("inactive");
})

closebuttonmodal.addEventListener("click", ()=>{
    editmodal.classList.toggle("inactive");
    contenteditmodal.classList.toggle("inactive");
})

closebuttoncreatemodal.addEventListener("click", ()=>{
    editmodal.classList.toggle("inactive");
    contentcreatemodal.classList.toggle("inactive");
})

criarbotao.addEventListener("click", ()=>{
    editmodal.classList.toggle("inactive");
    contentcreatemodal.classList.toggle("inactive");
})

function Editar(element){
   editmodal.classList.toggle("inactive");
   contenteditmodal.classList.toggle("inactive");
}

if(listadepessoas){
    listadepessoas.forEach(pessoa => {
    corpodatabela.innerHTML += `
        <tr>
            <td>${pessoa.idPessoa}</td>
            <td>${pessoa.cpf}</td>
            <td>${pessoa.nome}</td>
            <td>${pessoa.datanascimento}</td>
            <td>${pessoa.email}</td>
            <td>${pessoa.idEndereco}</td>
            <td>${pessoa.Telefone}</td>
            <td>${pessoa.createdAt}</td>
            <td>${pessoa.updatedat}</td>
            <td class="editbutton"><a href="/GoEmergency/CarregarPessoa?idpessoacarregar=${pessoa.idPessoa}"><p>Editar</p></a></td>
            <td class="deletebutton"><a href="/GoEmergency/ExcluirPessoa?idpessoaexcluir=${pessoa.idPessoa}"><p>Deletar</p></a></td>
       </tr>
    `
});
}