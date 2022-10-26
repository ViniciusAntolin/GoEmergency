<%-- 
    Document   : home
    Created on : Jul 22, 2022, 10:59:10 AM
    Author     : moretti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/public/assets/favicon-removebg-preview.png" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/styles/comum.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/styles/home.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css" rel="stylesheet">
        <script src="https://unpkg.com/darkreader@4.9.44/darkreader.js" async></script>
        <title>GoEmergency</title>
    </head>
    <body>
        <header>
            <ul>
              <a href="${pageContext.request.contextPath}/public/views/home.jsp"><img id="logo" src="${pageContext.request.contextPath}/public/assets/logo.png" alt="Logo"></a>
              <div id="positionright">
                <li><div id="google_translate_element"></div></li>
                <li><a href="${pageContext.request.contextPath}/public/views/login.jsp"><img src="https://medico24hs.com.br/wp-content/uploads/2022/05/Icone_Usuario_Menu_22.svg">Entrar</a></li>
                <li id="cadastrohome"><a href="${pageContext.request.contextPath}/public/views/paciente/cadastropaciente.jsp" id="linkcadastro" class="whitecolor">Cadastro</a></li>
              </div>
            </ul>
        </header>
        <main>
          <div id="telaprincipal">
            <div id="maincontent" class="whitecolor">
              <h1>Está se sentindo incomodado com a sua saúde?</h1>
              <p>Verifique seus sintomas e descubra as possíveis causas. É rápido, gratuito e anônimo.</p>
              <a href="${pageContext.request.contextPath}/public/views/termodeadesao.jsp">
                <button class="whitecolor" id="verificarsintomas" >
                  <img src="${pageContext.request.contextPath}/public/assets/lupa.png" alt="Lupa">
                  <p class="whitecolor">Verificar sintomas</p>
                </button>
              </a>
            </div>
          </div>
          <div id="especialistas">
            <h2>Converse com médicos especialistas</h2>
            <p>Selecione a especialidade e o profissional mais conveniente para saber mais sobre seus sintomas.</p>
            <div id="especialistascards">
              <div class="especialistacard">
                <img src="${pageContext.request.contextPath}/public/assets/especialidades/cardiologia-2.png" alt="cardiologistaicon">
                <p>Cardiologista</p>
              </div>
              <div class="especialistacard">
                <img src="${pageContext.request.contextPath}/public/assets/especialidades/endocrionologia.png" alt="endocrionologia">
                <p>Endocrinologista</p>
              </div>
              <div class="especialistacard">
                <img src="${pageContext.request.contextPath}/public/assets/especialidades/clinica-geral-2.png" alt="clinica-geral-2">
                <p>Clínico Geral</p>
              </div>
              <div class="especialistacard">
                <img src="${pageContext.request.contextPath}/public/assets/especialidades/esdoscopia.png" alt="esdoscopia">
                <p>Esdoscopista</p>
              </div>
              <div class="especialistacard">
                <img src="${pageContext.request.contextPath}/public/assets/especialidades/Gastro.png" alt="Gastro">
                <p>Gastroenterologista</p>
              </div>
              <div class="especialistacard">
                <img src="${pageContext.request.contextPath}/public/assets/especialidades/Nutricionista.png" alt="Nutricionista">
                <p>Nutricionista</p>
              </div>
               <div class="especialistacard">
                <img src="${pageContext.request.contextPath}/public/assets/especialidades/neuro.png" alt="neuro">
                <p>Neurologista</p>
              </div>
              <div class="especialistacard">
                <img src="${pageContext.request.contextPath}/public/assets/especialidades/orto.png" alt="orto">
                <p>Ortopedista</p>
              </div>
              <div class="especialistacard">
                <img src="${pageContext.request.contextPath}/public/assets/especialidades/otorrino.png" alt="otorrino">
                <p>Otorrinolaringologista</p>
              </div>
              <div class="especialistacard">
                <img src="${pageContext.request.contextPath}/public/assets/especialidades/pneumo.png" alt="pneumo">
                <p>Pneumologista</p>
              </div>
              <div class="especialistacard">
                <img src="${pageContext.request.contextPath}/public/assets/especialidades/Proctologia.png" alt="Proctologia">
                <p>Proctologia</p>
              </div>
            </div>
          </div>
          <div class="linhadivisoria"></div>
          <div id="sobre">
            <img src="${pageContext.request.contextPath}/public/assets/Modelo-de-Currículo-para-área-de-Medicina.jpg" alt="ImagemMedicina">
            <div id="textosobre">
              <h5 class="greycolor">Inovando no mercado de telessaúde</h5>
              <h3  class="greycolor">O GoEmergency é um projeto acadêmico-científico</h3>
              <p  class="greycolor">Fundado em 2021, na cidade de Jales, pelos alunos Gabriel Moretti e
                Vinicius Antolin diante das adversidades causadas pela pandêmia do coronavírus </p>
              <p  class="greycolor">Foi criado com o objetivo de ajudar no diagnóstico de doenças e  para fins acadêmicos.</p>
            </div>
          </div>
        </main>
        <footer>
          Copyright @ Gabriel e Vinicius 2022. Todos os direitos reservados.
        </footer>
        <div id="modalbox" class="inactive">
            <div id="contentmodal">
                <img id="iconmodal" src="${pageContext.request.contextPath}/public/assets/check(1).png" alt="IconModal">
                <div id="textmodal">
                    <p><strong id="tipomensagem">${tipomensagem}</strong></p>
                    <p id="mensagem">${mensagem}</p>
                </div>
                <img id="closebutton" src="${pageContext.request.contextPath}/public/assets/close.png" alt="Close">
            </div>
        </div>
             <div id="load">
            <img src="${pageContext.request.contextPath}/public/assets/loading-gif.gif" alt="gifloading">
        </div>
        <div id="togglediv">
            <input type="checkbox" class="checkbox" id="chk" />
            <label class="label" for="chk">
                    <i class="fas fa-moon"></i>
                    <i class="fas fa-sun"></i>
                    <div class="ball"></div>
            </label>
        </div>
        <script type="text/javascript">
            function googleTranslateElementInit() {
              new google.translate.TranslateElement({pageLanguage: 'pt',  autoDisplay: true, includedLanguages:'en,pt,fr'}, 'google_translate_element');
            }
        </script>
        <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
        <script src="${pageContext.request.contextPath}/src/script.js"></script>
  </body>
</html>