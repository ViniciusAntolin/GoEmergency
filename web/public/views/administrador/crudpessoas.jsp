<%-- 
    Document   : crudpessoas
    Created on : Oct 10, 2022, 8:44:36 PM
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/styles/crudpessoas.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/styles/comum-2.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css" rel="stylesheet">
        <script src="https://unpkg.com/darkreader@4.9.44/darkreader.js" async></script>
        <title>GoEmergency</title>
    </head>
    <body>
        <header>
            <ul>
                <div id="positionleft">
                     <svg id="openmenu" width="2em" height="1.5em" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M3 12h18M3 6h18M3 18h18" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path></svg>
                     <a href="${pageContext.request.contextPath}/public/views/home.jsp"><img id="logo" src="${pageContext.request.contextPath}/public/assets/logo.png" alt="Logo"></a>
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
                <h2>Lista de Pessoas</h2>
                <div id="containertable">
                    <table>
                        <thead>
                             <th>Id</th>
                             <th>CPF</th>
                             <th>Nome</th>
                             <th>Nascimento</th>
                             <th>Email</th>
                             <th>Endereço Id</th>
                             <th>Telefone</th>
                             <th>Criado em</th>
                             <th>Atualizado em</th>
                             <th colspan="2">Gerenciar</th>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
                <button id="criarbotao" type="button">
                    Adicionar Pessoa
                </button>
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
        <div id="menupopup" class="inactive">
            <ul>
                <a href="${pageContext.request.contextPath}/ListarPessoa">
                    <div style="color: black">
                        <svg width="1em" height="1em" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path><path clip-rule="evenodd" d="M9 11a4 4 0 1 0 0-8 4 4 0 0 0 0 8Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path><path d="M23 21v-2a4 4 0 0 0-3-3.87M16 3.13a4 4 0 0 1 0 7.75" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path></svg>
                        <span>Pessoas</span>
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/ListarMedico">
                     <div>
                        <img src="${pageContext.request.contextPath}/public/assets/medico.svg" alt="medico" width="16px" height="16px">
                        <span>Médicos</span>
                     </div>
                </a>
            </ul>
        </div>
        <div id="editmodal" class=${(oPessoaCarregada != null) ? "" : "inactive"}>
            <div id="contenteditmodal" class=${(oPessoaCarregada != null) ? "" : "inactive"}>
                <div id="headereditmodal">
                    <p>Editar Pessoa</p>
                    <img id="closebuttonmodal" src="${pageContext.request.contextPath}/public/assets/close.png" alt="Close">
                </div>
                <form action="${pageContext.request.contextPath}/AlterarPessoa" method="POST" id="formsignup">
                    <h3>Informações Pessoais</h3>
                    
                    <input type="hidden" name="idpessoa" value=${oPessoaCarregada.getIdPessoa()}>
                    <input type="hidden" name="senha" value=${oPessoaCarregada.getSenha()}>
                    
                    <div id="personalinformation">
                        <div class="personalinformationinput">
                            <label for="nome">Nome</label>
                            <input type="text" id="nome" name="nome" value=${oPessoaCarregada.getNome()} placeholder="Digite seu nome" maxlength="50" required>
                        </div>
                        <div class="personalinformationinput">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" value=${oPessoaCarregada.getEmail()} placeholder="Digite seu email" maxlength="50" required>
                        </div>
                        <div class="personalinformationinput">
                            <label for="cpf">CPF</label>
                            <input type="text" id="cpf" class="cpf"  name="cpf" value=${oPessoaCarregada.getCpf()} placeholder="Digite seu CPF" maxlength="14" required>
                        </div>
                        <div class="personalinformationinput">
                            <label for="nascimento">Data de nascimento</label>
                            <input type="date" placeholder="dd-mm-yyyy" value=${oPessoaCarregada.getDatanascimento()} id="nascimento" name="nascimento" required> 
                        </div>
                        <div class="personalinformationinput">
                            <label for="telefone">Telefone</label>
                            <input type="tel" id="telefone" class="telefone" name="telefone"  value=${oPessoaCarregada.getTelefone()} placeholder="(17) 99532-4221" maxlength="15" required>
                        </div>
                    </div>
                    
                    <h3>Endereço</h3>

                    
                    <input type="hidden" name="idendereco" value=${oPessoaCarregada.getIdEndereco()}>

                                      
                    <div id="address">
                        <div class="addressinformation">
                            <label for="cep">CEP</label>
                            <input type="text" id="cep" name="cep" placeholder="CEP" value="${oEstadoCarregado.getCep()}" maxlength="8" required>
                        </div>
                        <div class="addressinformation">
                            <label for="bairro">Bairro</label>
                            <input type="text" id="bairro" name="bairro" value="${oEstadoCarregado.getBairro()}" placeholder="Bairro" required>
                        </div>
                        <div class="addressinformation">
                            <label for="rua">Rua</label>
                            <input type="text" id="rua" name="rua"  value="${oEstadoCarregado.getRua()}" placeholder="Rua" required>
                        </div>
                        <div class="addressinformation">
                            <label for="numero">Número</label>
                            <input type="text" id="numero" name="numero" value="${oEstadoCarregado.getNumero()}" placeholder="Número" required>
                        </div>
                        <div class="addressinformation">
                            <label for="cidade">Cidade</label>
                            <input type="text" id="cidade" name="cidade" value="${oEstadoCarregado.getCidade()}" placeholder="Cidade" required>
                        </div>
                        <div class="addressinformation">
                            <label for="estado">Estado</label>
                            <input type="text" id="estado" name="estado" value="${oEstadoCarregado.getEstado()}" placeholder="Estado" required>
                        </div>
                    </div>
                    
                    <input id="submitbuttonform" type="submit" value="Salvar">
                </form>
            </div>
             <div id="contentcreatemodal" class="inactive">
                <div id="headereditmodal">
                    <p>Criar Pessoa</p>
                    <img id="closebuttoncreatemodal" src="${pageContext.request.contextPath}/public/assets/close.png" alt="Close">
                </div>
                <form action="${pageContext.request.contextPath}/SalvarPessoa" method="POST" id="formsignup">
                    <h3>Informações Pessoais</h3>

                    <div id="personalinformation">
                        <div class="personalinformationinput">
                            <label for="nome">Nome</label>
                            <input type="text" id="nome" name="nome" placeholder="Digite seu nome" maxlength="50" required>
                        </div>
                        <div class="personalinformationinput">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" placeholder="Digite seu email" maxlength="50" required>
                        </div>
                        <div class="personalinformationinput">
                            <label for="cpf">CPF</label>
                            <input type="text" id="cpf"  class="cpf" name="cpf" placeholder="Digite seu CPF" maxlength="14" required>
                        </div>
                        <div class="personalinformationinput">
                            <label for="nascimento">Data de nascimento</label>
                            <input type="date" placeholder="dd-mm-yyyy" id="nascimento" name="nascimento" required> 
                        </div>
                        <div class="personalinformationinput">
                            <label for="telefone">Telefone</label>
                            <input type="tel" id="telefone" class="telefone" name="telefone" placeholder="(17) 99532-4221" maxlength="15" required>
                        </div>
                        <div class="personalinformationinput">
                            <label for="senha">Senha</label>
                            <input type="password" id="senha" name="senha" placeholder="Digite seu Senha" required>
                        </div>
                        <div class="personalinformationinput">
                            <label for="profile">Perfil</label>
                            <select id="profile" name="profile" required>
                                <option value="administrador">Administrador</option>
                                <option value="paciente">Paciente</option>
                            </select>
                        </div>
                    </div>
                    
                    <h3>Endereço</h3>

                    <div id="address">
                        <div class="addressinformation">
                            <label for="cep">CEP</label>
                            <input type="text" id="cep" name="cep" placeholder="CEP" maxlength="8" required>
                        </div>
                        <div class="addressinformation">
                            <label for="bairro">Bairro</label>
                            <input type="text" id="bairro" name="bairro" placeholder="Bairro" required>
                        </div>
                        <div class="addressinformation">
                            <label for="rua">Rua</label>
                            <input type="text" id="rua" name="rua" placeholder="Rua" required>
                        </div>
                        <div class="addressinformation">
                            <label for="numero">Número</label>
                            <input type="text" id="numero" name="numero" placeholder="Número" required>
                        </div>
                        <div class="addressinformation">
                            <label for="cidade">Cidade</label>
                            <input type="text" id="cidade" name="cidade" placeholder="Cidade" required>
                        </div>
                        <div class="addressinformation">
                            <label for="estado">Estado</label>
                            <input type="text" id="estado" name="estado" placeholder="Estado" required>
                        </div>
                    </div>

                    <input id="submitbuttonform" type="submit" value="Salvar">
                </form>
            </div>       
        </div>
         <script type="text/javascript">
            var listadepessoas = <%= request.getAttribute("listadepessoas") %>;
             
            function googleTranslateElementInit() {
              new google.translate.TranslateElement({pageLanguage: 'pt',  autoDisplay: true, includedLanguages:'en,pt,fr'}, 'google_translate_element');
            }
        </script>
        <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>            
        <script src="${pageContext.request.contextPath}/src/mascarascrud.js"></script>
        <script src="${pageContext.request.contextPath}/src/apicepcrud.js"></script>
        <script src="${pageContext.request.contextPath}/src/script.js"></script>
        <script src="${pageContext.request.contextPath}/src/crudpessoas.js"></script>
    </body>
</html>
