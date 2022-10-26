const chatmedicosespecialistas = document.querySelector("#chatmedicosespecialistas");


listademedicos.forEach(medico => {
    chatmedicosespecialistas.innerHTML += `
  <a href="/GoEmergency/CriarChat?idmedico=${medico.idMedico}&idpaciente=${idpessoa}&nomemedico=${medico.nome}&especialidade=${medico.especialidade}" style="color: #222;">
    <div class="cardmedico" >
    <img src='https://ui-avatars.com/api/?background=0D8ABC&color=fff&bold=true&size=128&name=${medico.nome}' alt="avatar"/>
    <div class="profilemedico">
        <p>${medico.nome}</p>
        <p>${medico.especialidade}</p>
    </div>
   </div>
  </a>
`
});