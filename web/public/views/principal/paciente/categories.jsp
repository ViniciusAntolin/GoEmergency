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
                <h2>Olá, <%= session.getAttribute("username") %>!</h2>
                <p>Aqui você pode encontrar <span>médicos especialistas</span> para conversar sobre seus sintomas; basta  <span>selecionar a categoria</span> e você será redirecionado para o chat onde estarão os médicos disponíveis e demais informações.</p>
                <h3>Especialidades Médicas</h3>
                <div id="categoriessection">
                    <a href="/GoEmergency/ListarMedico?especialidade=Endocrinologista">
                        <div class="categorycard">
                            <img src="${pageContext.request.contextPath}/public/assets/especialidades/endocrionologia.png">
                            <p>Endocrinologista</p>
                            <span>É a especialidade médica que cuida do funcionamento das glândulas e das doenças que as afetam. As glândulas são órgãos do corpo humano que liberam os hormônios na corrente sanguínea. Já os hormônios, por sua vez, são substâncias que regulam o funcionamento de diversas funções do nosso organismo.</span>
                            <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill="black" clip-rule="evenodd"><path d="M21.883 12l-7.527 6.235.644.765 9-7.521-9-7.479-.645.764 7.529 6.236h-21.884v1h21.883z"/></svg>
                         </div>
                    </a>
                    <a href="/GoEmergency/ListarMedico?especialidade=Cardiologista">
                        <div class="categorycard">
                            <img src="${pageContext.request.contextPath}/public/assets/especialidades/cardiologia-2.png">
                            <p>Cardiologista</p>
                            <span>O cardiologista é o médico especializado no sistema circulatório humano e no coração. Ele estuda e faz o diagnóstico das doenças e
                                anormalidades existentes no órgão responsável por bombear o sangue no corpo.</span>
                            <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill="black" clip-rule="evenodd"><path d="M21.883 12l-7.527 6.235.644.765 9-7.521-9-7.479-.645.764 7.529 6.236h-21.884v1h21.883z"/></svg>
                        </div>  
                    </a>
                    <a href="/GoEmergency/ListarMedico?especialidade=Clínico Geral">
                      <div class="categorycard">
                        <img src="${pageContext.request.contextPath}/public/assets/especialidades/clinica-geral-2.png">
                        <p>Clínico Geral</p>
                        <span>O clínico geral é o médico que faz a primeira avaliação do paciente. Ou seja, analisa os sintomas apresentados e verifica se a pessoa precisa consultar um especialista. Por isso, este médico tem um vasto conhecimento geral sobre o funcionamento do corpo humano.</span>
                        <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill="black" clip-rule="evenodd"><path d="M21.883 12l-7.527 6.235.644.765 9-7.521-9-7.479-.645.764 7.529 6.236h-21.884v1h21.883z"/></svg>
                    </div>
                    </a>
                    <a href="/GoEmergency/ListarMedico?especialidade=Esdoscopista">
                        <div class="categorycard">
                        <img src="${pageContext.request.contextPath}/public/assets/especialidades/esdoscopia.png">
                        <p>Esdoscopista</p>
                        <span>Profissionais gastroenterologistas e endoscopistas podem solicitar o exame de endoscopia para verificar em detalhes esôfago, estômago e duodeno na investigação de doenças do sistema digestivo. </span>
                        <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill="black" clip-rule="evenodd"><path d="M21.883 12l-7.527 6.235.644.765 9-7.521-9-7.479-.645.764 7.529 6.236h-21.884v1h21.883z"/></svg>
                    </div> 
                    </a>  
                     <a href="/GoEmergency/ListarMedico?especialidade=Gastroenterologista">
                         <div class="categorycard">
                        <img src="${pageContext.request.contextPath}/public/assets/especialidades/Gastro.png">
                        <p>Gastroenterologista</p>
                        <span>O gastroenterologista é o profissional médico que cuida de todas as doenças relacionadas ao aparelho digestivo, que se estende desde a boca, passando por esôfago e órgãos como o estômago e o intestino, chegando ao reto. Ele é capaz de realizar exames, prescrever medicamentos e procedimentos necessários para a saúde desse sistema do corpo.   </span>
                        <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill="black" clip-rule="evenodd"><path d="M21.883 12l-7.527 6.235.644.765 9-7.521-9-7.479-.645.764 7.529 6.236h-21.884v1h21.883z"/></svg>
                    </div>
                    </a>  
                    <a href="/GoEmergency/ListarMedico?especialidade=Nutricionista">
                          <div class="categorycard">
                        <img src="${pageContext.request.contextPath}/public/assets/especialidades/Nutricionista.png">
                        <p>Nutricionista</p>
                        <span>O nutricionista faz um diagnóstico nutricional para elaborar uma dieta que atenda às necessidades do paciente. Para isso, investiga o estado de saúde do paciente, seus hábitos alimentares e seu estilo de vida. A análise de saúde é feita através de medições de peso, altura, quantidade de gordura e massa muscular.</span>
                        <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill="black" clip-rule="evenodd"><path d="M21.883 12l-7.527 6.235.644.765 9-7.521-9-7.479-.645.764 7.529 6.236h-21.884v1h21.883z"/></svg>
                    </div>
                    </a>  
                     <a href="/GoEmergency/ListarMedico?especialidade=Neurologista">
                         <div class="categorycard">
                        <img src="${pageContext.request.contextPath}/public/assets/especialidades/neuro.png">
                        <p>Neurologista</p>
                        <span>O que faz um Neurologista? Um Neurologista é o Médico Especialista que dedica-se ao estudo, Diagnóstico e Tratamento das Doenças que Comprometem o Sistema Nervoso (Cérebro, Medula Espinhal, Raízes Nervosas e Nervos).</span>
                        <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill="black" clip-rule="evenodd"><path d="M21.883 12l-7.527 6.235.644.765 9-7.521-9-7.479-.645.764 7.529 6.236h-21.884v1h21.883z"/></svg>
                    </div>
                    </a>  
                    <a href="/GoEmergency/ListarMedico?especialidade=Ortopedista">
                          <div class="categorycard">
                        <img src="${pageContext.request.contextPath}/public/assets/especialidades/orto.png">
                        <p>Ortopedista</p>
                        <span>O que é um médico ortopedista? Médico ortopedista é um especialista na função mecânica do aparelho locomotor. Isso significa que esse profissional é apto a estudar, avaliar, diagnosticar e tratar alterações que afetam articulações, tendões, ossos, músculos, ligamentos e cartilagens.</span>
                        <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill="black" clip-rule="evenodd"><path d="M21.883 12l-7.527 6.235.644.765 9-7.521-9-7.479-.645.764 7.529 6.236h-21.884v1h21.883z"/></svg>
                    </div> 
                    </a> 
                     <a href="/GoEmergency/ListarMedico?especialidade=Otorrinolaringologista">
                         <div class="categorycard">
                        <img src="${pageContext.request.contextPath}/public/assets/especialidades/otorrino.png">
                        <p>Otorrinolaringologista</p>
                        <span>O otorrinolaringologista é o médico especializado no diagnóstico e tratamento, clínico e cirúrgico, das doenças dos ouvidos, nariz, garganta, laringe e pescoço. Por ser um especialista com atuação ampla, as doenças tratadas por ele podem ser desde enfermidades simples, como infecções agudas, até quadros mais complexos, como tumores cerebrais e nasais.</span>
                        <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill="black" clip-rule="evenodd"><path d="M21.883 12l-7.527 6.235.644.765 9-7.521-9-7.479-.645.764 7.529 6.236h-21.884v1h21.883z"/></svg>
                    </div>
                    </a>  
                      <a href="/GoEmergency/ListarMedico?especialidade=Pneumologista">
                          <div class="categorycard">
                        <img src="${pageContext.request.contextPath}/public/assets/especialidades/pneumo.png">
                        <p>Pneumologista</p>
                        <span>O pneumologista é o médico responsável por cuidar e tratar dos pulmões. Ou seja, realiza o diagnóstico e tratamento das chamadas doenças pulmonares, como a pneumonia e o câncer de pulmão. Além disso, este médico acompanha quadros médicos de seus pacientes, auxiliando na prevenção dessas doenças.</span>
                        <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill="black" clip-rule="evenodd"><path d="M21.883 12l-7.527 6.235.644.765 9-7.521-9-7.479-.645.764 7.529 6.236h-21.884v1h21.883z"/></svg>
                    </div>
                    </a>  
                     <a href="/GoEmergency/ListarMedico?especialidade=Proctologia">
                          <div class="categorycard">
                        <img src="${pageContext.request.contextPath}/public/assets/especialidades/Proctologia.png">
                        <p>Proctologia</p>
                        <span>A proctologia, também conhecida como coloproctologia, é o ramo da Medicina dedicado a estudar as patologias do intestino grosso, do ânus e do reto. Os médicos proctologistas realizam o estudo das condições do paciente para chegar a um diagnóstico e receitar o tratamento que vai devolver qualidade de vida ao indivíduo.</span>
                        <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill="black" clip-rule="evenodd"><path d="M21.883 12l-7.527 6.235.644.765 9-7.521-9-7.479-.645.764 7.529 6.236h-21.884v1h21.883z"/></svg>
                    </div> 
                    </a>         
                    <a href="/GoEmergency/ListarMedico?especialidade=Radiologista">
                        <div class="categorycard">
                        <img src="${pageContext.request.contextPath}/public/assets/especialidades/radio.png">
                        <p>Radiologista</p>
                        <span>O radiologista é um médico especializado em radiologia. Esse profissional é responsável pelo diagnóstico de um grande número de doenças, além de ter papel fundamental no tratamento de diversas patologias através de procedimentos de radiologia intervencionista.</span>
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