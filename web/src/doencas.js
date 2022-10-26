const closebuttondoenca = document.querySelector("#closebuttondoenca");
const modaldoenca = document.querySelector("#modaldoenca");
const pagina = document.querySelector("html");
const doencaspossiveis = document.querySelector("#doencaspossiveis");
const doencadetalhes = document.querySelector("#doencadetalhes");
const nomedoencatitle = document.querySelector("#nomedoencatitle");

let listadedoencasIds = listadedoencas.map(doenca => doenca.idDoenca);

const doencasComSintomas = [];

listadedoencasIds = listadedoencasIds.filter((value, index, self) => {
   return self.indexOf(value) === index;
});

listadedoencasIds.forEach(idunico => {
    const doencaunica = listadedoencas.find(doenca => doenca.idDoenca === idunico);
    
    const sintomaspossiveis = [];
    
   listadedoencas.forEach(doenca => {
        if(doenca.idDoenca === idunico){
            sintomaspossiveis.push(doenca.nomesintoma);
        }
    })
    
    doencasComSintomas.push({
        id: idunico,
        sintomas: sintomaspossiveis
    })
    
    doencaspossiveis.innerHTML += `
    <div class="doencacard" id=${idunico} onclick="VerDetalhesDoenca(this)">
        <p>${doencaunica.nomedoenca}</p>
        <div class="niveldeevidencia">
            <div class="tipodeevidencia">
                <img src="/GoEmergency/public/assets/carregar (1).png" alt="barradeprogresso">
                <span>Evidência moderada</span>
            </div>
            <div class="verdetalheasicon">
                <span>Ver detalhes</span>
                <img src="/GoEmergency/public/assets/svgexport-5.svg" alt="verdetalhesseta">
            </div>
        </div>
    </div>
    `   
})


closebuttondoenca.addEventListener("click", ()=>{
    modaldoenca.classList.add("inactive")
    pagina.classList.remove("overflowhidden")
})

function VerDetalhesDoenca(element){
    modaldoenca.classList.remove("inactive");
    pagina.classList.add("overflowhidden");
    
    const doenca = listadedoencas.find(doenca => doenca.idDoenca == element.id);
    
    const doencasintomas = doencasComSintomas.find(doencasintoma => doencasintoma.id == element.id);
    
    const sintomas = doencasintomas.sintomas.map(sintoma => `<li>${sintoma}</li>`).join("");
    
    
    nomedoencatitle.innerText = `${doenca.nomedoenca}`;
        
    doencadetalhes.innerHTML = `
        <h5>Descrição</h5>
        <pre>${doenca.descricao}</pre>
        <h5>Sintomas</h5>
        <ul>
           ${sintomas}
        </ul>
         <h5>Causas</h5>
        <pre>${doenca.causas}</pre>
        <h5>Diagnóstico</h5>
        <pre>${doenca.diagnostico}</pre>
        <h5>Tratamento</h5>
        <pre>${doenca.tratamento}</pre>
        <h5>Prevenção</h5>
        <pre>${doenca.prevencao}</pre>
        <h5>Medico Especialista</h5>
        <pre>${doenca.medicoespecialista}</pre>
    `
}
