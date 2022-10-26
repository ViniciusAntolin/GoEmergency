<%-- 
    Document   : doencas
    Created on : Sep 3, 2022, 10:09:41 AM
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/styles/doencas.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/styles/comum-2.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css" rel="stylesheet">
        <script src="https://unpkg.com/darkreader@4.9.44/darkreader.js" async></script>
        <title>GoEmergency</title>
    </head>
    <body>
        <header>
            <ul>
                <a href="${pageContext.request.contextPath}/public/views/home.jsp"><img src="${pageContext.request.contextPath}/public/assets/logo.png" alt="Logo" id="logo"></a>
                <div id="positionright">
                    <li> <a href="${pageContext.request.contextPath}/public/views/home.jsp"><img src="${pageContext.request.contextPath}/public/assets/Symptomate-5.svg" id="voltaricon"/>Voltar</a></li>
                </div>
            </ul>
        </header>
        <main>
            <div id="content">
                <div id="recomendacao">
                    <div id="textrecomendacao">
                        <h5>Consulte um médico</h5>
                        <p>Seus sintomas podem exigir avaliação médica. Agende uma consulta com seu médico. Se os seus sintomas piorarem, consulte um médico imediatamente</p>
                        <div id="tipodeconsulta">
                            <p><strong>Médico recomendado</strong> Clínico Geral </p>
                            <p><strong>Tipo de consulta recomendada </strong> Consulta presencial</p>
                        </div>
                    </div>
                    <div id="imgmedicoiconbackground">
                        <img id="imgmedicoicon" src="${pageContext.request.contextPath}/public/assets/svgexport-3.svg" alt="imgmedicoicon">
                    </div>
                </div>
                <div id="causas">
                    <h6>Possíveis causas</h6>
                    <div id="line"></div>
                    <div id="doencaspossiveis">
                    </div>
                    <br>
                    <p id="footercausas">A lista de possíveis condições pode não ser completa, é fornecida apenas para fins informativos, não é uma opinião médica qualificada e não pode substituir o diagnóstico médico.</p>
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
        <div id="modaldoenca" class="inactive">
            <div id="doencaativabackground">
                <div id="doencahead">
                    <img src="${pageContext.request.contextPath}/public/assets/svgexport-9.svg" id="closebuttondoenca" alt="closebuttonicon" style="width: 27px">
                    <div id="nomedoenca">
                        <p id="nomedoencatitle">Abscesso cerebral</p>
                        <div class="tipodeevidencia">
                            <img src="${pageContext.request.contextPath}/public/assets/carregar (1).png" alt="barradeprogresso">
                            <span>Evidência moderada</span>
                        </div>
                    </div>
                </div>
                <div id="doencadetalhes">
                </div>
            </div>
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
        <script type='text/javascript'>
            var listadedoencas = <%=request.getAttribute("listadedoencas")%>;
         </script>
         <script type="text/javascript">
            function googleTranslateElementInit() {
              new google.translate.TranslateElement({pageLanguage: 'pt',  autoDisplay: true, includedLanguages:'en,pt,fr'}, 'google_translate_element');
            }
        </script>
        <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script> 
        <script src="${pageContext.request.contextPath}/src/script.js"></script>
        <script src="${pageContext.request.contextPath}/src/doencas.js"></script>
    </body>
</html>