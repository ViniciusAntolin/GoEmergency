<%-- 
    Document   : categories
    Created on : Oct 12, 2022, 1:13:59 PM
    Author     : moretti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/public/assets/favicon-removebg-preview.png" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/styles/comum.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/styles/comumsintomas.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/styles/comumlogado.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/styles/categorias.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/styles/comum-2.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css" rel="stylesheet">
        <script src="https://unpkg.com/darkreader@4.9.44/darkreader.js" async></script>
        <title>GoEmergency</title>
    </head>
    <body>
        <header>
            <ul>
                <div id="positionleft">
                     <a href="${pageContext.request.contextPath}/public/views/home.jsp"><img id="logo" src="${pageContext.request.contextPath}/public/assets/logo.png" ageContelt="Logo"></a>
                </div>
                <div id="positionright">
                    <span><%= session.getAttribute("username") %></span>
                    <a href="${pageContext.request.contextPath}/DeslogarPessoa" id="sair">
                       <svg width="1em" height="1em" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M10 22H5a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h5M17 16l4-4-4-4M21 12H9" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path></svg>
                       Sair
                    </a>
                </div>
            </ul>
        </header>
        <main>
            <div id="content">
                <h2>Ol??, <%= session.getAttribute("username") %>!</h2>
                <p>Aqui voc?? pode encontrar <span>m??dicos especialistas</span> para conversar sobre seus sintomas; basta  <span>selecionar a categoria</span> e voc?? ser?? redirecionado para o chat onde estar??o os m??dicos dispon??veis e demais informa????es.</p>
                <h3>Especialidades M??dicas</h3>
                <div id="categoriessection">
                    <a href="/GoEmergency/ListarMedico?especialidade=Endocrinologista">
                        <div class="categorycard">
                            <img src="${pageContext.request.contextPath}/public/assets/especialidades/endocrionologia.png">
                            <p>Endocrinologista</p>
                            <span>?? a especialidade m??dica que cuida do funcionamento das gl??ndulas e das doen??as que as afetam. As gl??ndulas s??o ??rg??os do corpo humano que liberam os horm??nios na corrente sangu??nea. J?? os horm??nios, por sua vez, s??o subst??ncias que regulam o funcionamento de diversas fun????es do nosso organismo.</span>
                            <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill="black" clip-rule="evenodd"><path d="M21.883 12l-7.527 6.235.644.765 9-7.521-9-7.479-.645.764 7.529 6.236h-21.884v1h21.883z"/></svg>
                         </div>
                    </a>
                    <a href="/GoEmergency/ListarMedico?especialidade=Cardiologista">
                        <div class="categorycard">
                            <img src="${pageContext.request.contextPath}/public/assets/especialidades/cardiologia-2.png">
                            <p>Cardiologista</p>
                            <span>O cardiologista ?? o m??dico especializado no sistema circulat??rio humano e no cora????o. Ele estuda e faz o diagn??stico das doen??as e
                                anormalidades existentes no ??rg??o respons??vel por bombear o sangue no corpo.</span>
                            <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill="black" clip-rule="evenodd"><path d="M21.883 12l-7.527 6.235.644.765 9-7.521-9-7.479-.645.764 7.529 6.236h-21.884v1h21.883z"/></svg>
                        </div>  
                    </a>
                    <a href="/GoEmergency/ListarMedico?especialidade=Cl??nico Geral">
                      <div class="categorycard">
                        <img src="${pageContext.request.contextPath}/public/assets/especialidades/clinica-geral-2.png">
                        <p>Cl??nico Geral</p>
                        <span>O cl??nico geral ?? o m??dico que faz a primeira avalia????o do paciente. Ou seja, analisa os sintomas apresentados e verifica se a pessoa precisa consultar um especialista. Por isso, este m??dico tem um vasto conhecimento geral sobre o funcionamento do corpo humano.</span>
                        <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill="black" clip-rule="evenodd"><path d="M21.883 12l-7.527 6.235.644.765 9-7.521-9-7.479-.645.764 7.529 6.236h-21.884v1h21.883z"/></svg>
                    </div>
                    </a>
                    <a href="/GoEmergency/ListarMedico?especialidade=Esdoscopista">
                        <div class="categorycard">
                        <img src="${pageContext.request.contextPath}/public/assets/especialidades/esdoscopia.png">
                        <p>Esdoscopista</p>
                        <span>Profissionais gastroenterologistas e endoscopistas podem solicitar o exame de endoscopia para verificar em detalhes es??fago, est??mago e duodeno na investiga????o de doen??as do sistema digestivo. </span>
                        <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill="black" clip-rule="evenodd"><path d="M21.883 12l-7.527 6.235.644.765 9-7.521-9-7.479-.645.764 7.529 6.236h-21.884v1h21.883z"/></svg>
                    </div> 
                    </a>  
                     <a href="/GoEmergency/ListarMedico?especialidade=Gastroenterologista">
                         <div class="categorycard">
                        <img src="${pageContext.request.contextPath}/public/assets/especialidades/Gastro.png">
                        <p>Gastroenterologista</p>
                        <span>O gastroenterologista ?? o profissional m??dico que cuida de todas as doen??as relacionadas ao aparelho digestivo, que se estende desde a boca, passando por es??fago e ??rg??os como o est??mago e o intestino, chegando ao reto. Ele ?? capaz de realizar exames, prescrever medicamentos e procedimentos necess??rios para a sa??de desse sistema do corpo.   </span>
                        <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill="black" clip-rule="evenodd"><path d="M21.883 12l-7.527 6.235.644.765 9-7.521-9-7.479-.645.764 7.529 6.236h-21.884v1h21.883z"/></svg>
                    </div>
                    </a>  
                    <a href="/GoEmergency/ListarMedico?especialidade=Nutricionista">
                          <div class="categorycard">
                        <img src="${pageContext.request.contextPath}/public/assets/especialidades/Nutricionista.png">
                        <p>Nutricionista</p>
                        <span>O nutricionista faz um diagn??stico nutricional para elaborar uma dieta que atenda ??s necessidades do paciente. Para isso, investiga o estado de sa??de do paciente, seus h??bitos alimentares e seu estilo de vida. A an??lise de sa??de ?? feita atrav??s de medi????es de peso, altura, quantidade de gordura e massa muscular.</span>
                        <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill="black" clip-rule="evenodd"><path d="M21.883 12l-7.527 6.235.644.765 9-7.521-9-7.479-.645.764 7.529 6.236h-21.884v1h21.883z"/></svg>
                    </div>
                    </a>  
                     <a href="/GoEmergency/ListarMedico?especialidade=Neurologista">
                         <div class="categorycard">
                        <img src="${pageContext.request.contextPath}/public/assets/especialidades/neuro.png">
                        <p>Neurologista</p>
                        <span>O que faz um Neurologista? Um Neurologista ?? o M??dico Especialista que dedica-se ao estudo, Diagn??stico e Tratamento das Doen??as que Comprometem o Sistema Nervoso (C??rebro, Medula Espinhal, Ra??zes Nervosas e Nervos).</span>
                        <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill="black" clip-rule="evenodd"><path d="M21.883 12l-7.527 6.235.644.765 9-7.521-9-7.479-.645.764 7.529 6.236h-21.884v1h21.883z"/></svg>
                    </div>
                    </a>  
                    <a href="/GoEmergency/ListarMedico?especialidade=Ortopedista">
                          <div class="categorycard">
                        <img src="${pageContext.request.contextPath}/public/assets/especialidades/orto.png">
                        <p>Ortopedista</p>
                        <span>O que ?? um m??dico ortopedista? M??dico ortopedista ?? um especialista na fun????o mec??nica do aparelho locomotor. Isso significa que esse profissional ?? apto a estudar, avaliar, diagnosticar e tratar altera????es que afetam articula????es, tend??es, ossos, m??sculos, ligamentos e cartilagens.</span>
                        <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill="black" clip-rule="evenodd"><path d="M21.883 12l-7.527 6.235.644.765 9-7.521-9-7.479-.645.764 7.529 6.236h-21.884v1h21.883z"/></svg>
                    </div> 
                    </a> 
                     <a href="/GoEmergency/ListarMedico?especialidade=Otorrinolaringologista">
                         <div class="categorycard">
                        <img src="${pageContext.request.contextPath}/public/assets/especialidades/otorrino.png">
                        <p>Otorrinolaringologista</p>
                        <span>O otorrinolaringologista ?? o m??dico especializado no diagn??stico e tratamento, cl??nico e cir??rgico, das doen??as dos ouvidos, nariz, garganta, laringe e pesco??o. Por ser um especialista com atua????o ampla, as doen??as tratadas por ele podem ser desde enfermidades simples, como infec????es agudas, at?? quadros mais complexos, como tumores cerebrais e nasais.</span>
                        <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill="black" clip-rule="evenodd"><path d="M21.883 12l-7.527 6.235.644.765 9-7.521-9-7.479-.645.764 7.529 6.236h-21.884v1h21.883z"/></svg>
                    </div>
                    </a>  
                      <a href="/GoEmergency/ListarMedico?especialidade=Pneumologista">
                          <div class="categorycard">
                        <img src="${pageContext.request.contextPath}/public/assets/especialidades/pneumo.png">
                        <p>Pneumologista</p>
                        <span>O pneumologista ?? o m??dico respons??vel por cuidar e tratar dos pulm??es. Ou seja, realiza o diagn??stico e tratamento das chamadas doen??as pulmonares, como a pneumonia e o c??ncer de pulm??o. Al??m disso, este m??dico acompanha quadros m??dicos de seus pacientes, auxiliando na preven????o dessas doen??as.</span>
                        <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill="black" clip-rule="evenodd"><path d="M21.883 12l-7.527 6.235.644.765 9-7.521-9-7.479-.645.764 7.529 6.236h-21.884v1h21.883z"/></svg>
                    </div>
                    </a>  
                     <a href="/GoEmergency/ListarMedico?especialidade=Proctologia">
                          <div class="categorycard">
                        <img src="${pageContext.request.contextPath}/public/assets/especialidades/Proctologia.png">
                        <p>Proctologia</p>
                        <span>A proctologia, tamb??m conhecida como coloproctologia, ?? o ramo da Medicina dedicado a estudar as patologias do intestino grosso, do ??nus e do reto. Os m??dicos proctologistas realizam o estudo das condi????es do paciente para chegar a um diagn??stico e receitar o tratamento que vai devolver qualidade de vida ao indiv??duo.</span>
                        <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill="black" clip-rule="evenodd"><path d="M21.883 12l-7.527 6.235.644.765 9-7.521-9-7.479-.645.764 7.529 6.236h-21.884v1h21.883z"/></svg>
                    </div> 
                    </a>         
                    <a href="/GoEmergency/ListarMedico?especialidade=Radiologista">
                        <div class="categorycard">
                        <img src="${pageContext.request.contextPath}/public/assets/especialidades/radio.png">
                        <p>Radiologista</p>
                        <span>O radiologista ?? um m??dico especializado em radiologia. Esse profissional ?? respons??vel pelo diagn??stico de um grande n??mero de doen??as, al??m de ter papel fundamental no tratamento de diversas patologias atrav??s de procedimentos de radiologia intervencionista.</span>
                        <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill="black" clip-rule="evenodd"><path d="M21.883 12l-7.527 6.235.644.765 9-7.521-9-7.479-.645.764 7.529 6.236h-21.884v1h21.883z"/></svg>
                    </div> 
                    </a> 
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