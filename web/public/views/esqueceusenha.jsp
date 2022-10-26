<%-- 
    Document   : esqueceusenha
    Created on : Jul 13, 2022, 9:36:01 AM
    Author     : moretti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>GoEmergency</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/public/assets/favicon-removebg-preview.png" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/styles/esqueceusenha.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/styles/comum.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/styles/comum-2.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css" rel="stylesheet">
        <script src="https://unpkg.com/darkreader@4.9.44/darkreader.js" async></script>
    </head>
    <body>
        <img id="background" src="${pageContext.request.contextPath}/public/assets/Forgot password-cuate.png" alt="Esqueceu a senha imagem">
        <div id="content">
            <h1>Resete sua senha</h1>
            <div id="divcadeado">
                <img id="cadeado" src="${pageContext.request.contextPath}/public/assets/cadeado.png" alt="Cadeado">
            </div>
            <p>Digite o email associado com sua a conta e nós enviaremos um e-mail com as instruções para resetar sua senha.</p>
            <form action="${pageContext.request.contextPath}/EnviarEmail" method="POST">
                <label for="">Email</label>
                <input type="email" placeholder="joaodasilva@gmail.com" name="email" id="recoverinput" required>
                <button type="submit">Enviar</button>
            </form>
            <p>Já lembrou ? <a id="voltarlogin" href="${pageContext.request.contextPath}/public/views/login.jsp">Volte para logar</a></p>
        </div>
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
