const closebutton = document.querySelector("#closebutton");
const modal = document.querySelector("#modalbox");
const tipomensagem = document.querySelector("#tipomensagem");
const mensagem = document.querySelector("#mensagem");
const iconmodal = document.querySelector("#iconmodal");
const checktoggle = document.querySelector("#chk");
const loadingElement = document.querySelector("#load");

const enabledDarkMode = window.localStorage.getItem('isDarkEnabled');

window.onload = () => {
    loadingElement.style.display = "none"
    
    DarkReader.setFetchMethod(window.fetch);
    
    if(enabledDarkMode){
        checktoggle.checked = true;
        
        DarkReader.enable({
            rightness: 100,
            contrast: 90,
            sepia: 10
        });
    } 

    checktoggle.addEventListener('change', (e) => {
      const isEnabled = DarkReader.isEnabled();      
      
      if(isEnabled){
         window.localStorage.removeItem("isDarkEnabled"); 
          
         DarkReader.disable();
      } else {
        window.localStorage.setItem("isDarkEnabled", true);
            
         DarkReader.enable({
            rightness: 100,
            contrast: 90,
            sepia: 10
        });
      }
    });

    closebutton.addEventListener("click", () => {
      modal.classList.toggle("inactive");
    });

    if(tipomensagem.textContent === 'Erro') {
        iconmodal.setAttribute('src', '/GoEmergency/public/assets/warning(1).png');    

        modal.classList.remove('inactive');
        modal.classList.add('erro');
    }else if(tipomensagem.textContent === 'Sucesso'){
        iconmodal.setAttribute('src', '/GoEmergency/public/assets/check(1).png');  

        modal.classList.remove("inactive");
        modal.classList.add('sucesso');
    } 
    
    if(!modal.classList.contains('inactive')){
        setTimeout(()=>{
           modal.classList.add('inactive');
        }, 5000);
    }
}
