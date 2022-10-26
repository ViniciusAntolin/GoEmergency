<%-- 
    Document   : chatpacientes
    Created on : Oct 19, 2022, 6:25:52 PM
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/styles/chat.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/styles/chatpacientes.css">
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
                    <a href="${pageContext.request.contextPath}/DeslogarPessoa" id="sair">
                       <svg width="1em" height="1em" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M10 22H5a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h5M17 16l4-4-4-4M21 12H9" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path></svg>
                       Sair
                    </a>
                </div>
            </ul>
        </header>
        <main>
            <div id="content">
                <div id="conversas">
                    <div id="headerconversa">
                         <img src="https://ui-avatars.com/api/?background=0D8ABC&color=fff&bold=true&size=128&name=<%= session.getAttribute("username") %>" alt="avatar"/>
                         <span><%= session.getAttribute("username") %></span>
                    </div>
                    <div id="chatpacientes">
                    </div>
                </div>
                <div id="bemvindochat">
                    <img src="${pageContext.request.contextPath}/public/assets/chatbck.svg" alt="chatbackground"/>
                    <h3>GoEmergency</h3>
                    <p>Aqui está uma lista de pacientes que tentou conversar com você. <br>
                       Escolha um e após ao clicar você poderá conversar com ele(a). 
                    </p>
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
            var listadechats = <%=request.getAttribute("listadechats")%>;
            
            function googleTranslateElementInit() {
              new google.translate.TranslateElement({pageLanguage: 'pt',  autoDisplay: true, includedLanguages:'en,pt,fr'}, 'google_translate_element');
            }
        </script>
        <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
        <script src="${pageContext.request.contextPath}/src/chatpacientes.js"></script>
        <script src="${pageContext.request.contextPath}/src/script.js"></script>
    </body>
</html>
