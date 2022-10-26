const chatpacientes = document.querySelector("#chatpacientes");


listadechats.forEach(paciente => {
    chatpacientes.innerHTML += `
  <a href="/GoEmergency/ListarMensagens?idchat=${paciente.idchat}&nomepaciente=${paciente.nome}" style="color: #222;">
    <div class="cardpessoa" >
    <img src='https://ui-avatars.com/api/?background=0D8ABC&color=fff&bold=true&size=128&name=${paciente.nome}' alt="avatar"/>
    <div class="profilepessoa">
        <p>${paciente.nome}</p>
    </div>
   </div>
  </a>
`
});