<%-- 
    Document   : sintomas
    Created on : Sep 3, 2022, 10:19:49 AM
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/styles/sintomas.css">
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
            <form action="${pageContext.request.contextPath}/ListarDoenca" method="POST">
                <div id="pesquisararea">
                    <div id="upperformsintoma">
                        <div id="textpesquisar">
                                <h3>Adicione seus sintomas</h3>
                                <p>Adicione o máximo de sintomas possível para obter resultados mais precisos.</p>
                                <select id="sintomas">
                                    <option disabled value="" selected hidden>Pesquisar, por exemplo: dor de cabeça</option>
                                </select>
                                <ul id="sintomaspesquisados"></ul>
                         </div>
                        <div id="modeloanatomico">
                        </div>
                    </div>
                <div id="girarbotao">
                        <img src="${pageContext.request.contextPath}/public/assets/Symptomate-4.svg" alt="giraricon">
                        Girar modelo
                </div>
                <div id="submitform">
                    <a href="${pageContext.request.contextPath}/public/views/termodeadesao.jsp"><img src="${pageContext.request.contextPath}/public/assets/Symptomate-5.svg" id="voltaricon"/>Voltar</a>
                    <input type="submit" id="pesquisardoenca" value="Pesquisar">
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
        <div id="popupsintoma">
            <div id="headerpopup">
                <span id="titulopartesdocorpo"></span>
                <img id="fecharpopup" src="${pageContext.request.contextPath}/public/assets/closepopup.svg" alt="Close">
            </div>
            <ul id="listadesintomasespecifico">
            </ul>
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
            var listadesintomas = JSON.parse(`${listadesintomas}`);
         </script>
         <script type="text/javascript">
            function googleTranslateElementInit() {
              new google.translate.TranslateElement({pageLanguage: 'pt',  autoDisplay: true, includedLanguages:'en,pt,fr'}, 'google_translate_element');
            }
        </script>
        <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script> 
        <script src="${pageContext.request.contextPath}/src/script.js"></script>
        <script src="${pageContext.request.contextPath}/src/sintomas.js"></script>
    </body>
</html>

