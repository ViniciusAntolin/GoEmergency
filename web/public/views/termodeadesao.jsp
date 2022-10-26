<%-- 
    Document   : termodeadesao
    Created on : Sep 3, 2022, 10:21:08 AM
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/styles/termodeadesao.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/styles/comum-2.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css" rel="stylesheet">
        <script src="https://unpkg.com/darkreader@4.9.44/darkreader.js" async></script>
        <title>GoEmergency</title>
    </head>
    <body>
         <header>
            <ul>
              <a href="${pageContext.request.contextPath}/public/views/home.jsp"><img id="logo" src="${pageContext.request.contextPath}/public/assets/logo.png" alt="Logo"></a>
              <div id="positionright">
                <li> <a href="${pageContext.request.contextPath}/public/views/home.jsp"><img src="${pageContext.request.contextPath}/public/assets/Symptomate-5.svg" id="voltaricon"/>Voltar</a></li>
              </div>
            </ul>
        </header>
        <main>
            <div id="upperform">
                <h3>Termos de Serviço </h3>
                <p>Antes de iniciar a avaliação, leia os Termos de Serviço. Lembre-se que:</p>
                <div id="textform">
                    <div id="textadesao">
                        <ul>
                            <li><strong>A avaliação não é um diagnóstico.</strong> O checkup é para fins informativos e não é uma opinião médica qualificada.</li>
                            <li><strong>Não use em emergências.</strong> Em caso de emergência de saúde, ligue imediatamente para o número de emergência local.</li>
                            <li><strong> Seus dados estão seguros.</strong> As informações que você fornece são anônimas e não são compartilhadas com ninguém.</li>
                        </ul>
                     </div>
                    <img id="svgtermo" src="${pageContext.request.contextPath}/public/assets/svgexport-6.svg" alt="svg6">
                </div>
            </div>
            <form action="${pageContext.request.contextPath}/ListarSintomas">
                <div id="checkboxes">
                    <p>
                        <input type="checkbox" required> Eu li e aceito os <a href="#">Termos de Serviço</a> e a <a href="#">Política de Privacidade</a>. <br>
                    </p>
                    <p>
                        <input type="checkbox" required> Concordo com o processamento de minhas informações de saúde para fins de realização da entrevista 
                    </p>
                </div>
                <div id="submitform">
                    <a href="${pageContext.request.contextPath}/public/views/home.jsp"><img src="${pageContext.request.contextPath}/public/assets/Symptomate-5.svg" id="voltaricon"/>Voltar</a>
                    <input type="submit" id="enviarform" value="Próximo">
                </div>
            </form>
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
