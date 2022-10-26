const historico = document.querySelector("#historico");
const inputconteudomensagem = document.querySelector("#conteudomensagem");
const forms = document.querySelector("#enviararea");
const enviarmensagembotao = document.querySelector("#enviarmensagembotao");

let actualdate = null;

listademensagens.forEach(mensagem => {
    let date = new Date(mensagem.datetomili);
    
    const isOtherDay = new Date().getDay() != date.getDay();
    
    if(isOtherDay){
        if(actualdate != date.getDay()){
            historico.innerHTML += `
            <div class="daydate" >
                <span>${date.toLocaleDateString('pt-BR')}</span>
            </div>
        `
            
            actualdate = date.getDay();
        }
    } else {
         if(actualdate != date.getDay()){
            historico.innerHTML += `
            <div class="daydate">
                <span>Hoje</span>
            </div>
        `
            
            actualdate = date.getDay();
        }
    }
    
    let minutes = date.getMinutes();
    let hours = date.getHours();
    
    if(minutes.toString().length == 1){
        minutes = '0' + minutes.toString();
    }
    
    date = `${hours}:${minutes}`;
    
    
    if(mensagem.isadministrative){
        historico.innerHTML += `
        <div class="mensagemmedico">
            <span>${mensagem.conteudo}</span>
            <span>${date}</span>
        </div>
     `;
    } else {
        historico.innerHTML += `
        <div class="mensagempaciente">
            <span>${mensagem.conteudo}</span>
            <span>${date}</span>
        </div>
     `;
    }
    
    
});

historico.scrollTo = historico.scrollTo(0, historico.scrollHeight);

inputconteudomensagem.addEventListener('keypress', (event)=>{
    if(event.key == 'Enter'){
      forms.submit();     
        
      event.target.value = "";
    }
});

enviarmensagembotao.addEventListener('click', (event) =>{
    forms.submit();
})

