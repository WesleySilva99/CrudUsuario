<!DOCTYPE HTML>
<html>
<head>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css"/>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
    <script>

        var contDiv = 0;

        function acept() {
            if (confirm("Tem certeza que quer zerar os dados desse usuario?")) {
                return true;
            } else {
                return false;
            }
        }

        function tecla(){
            evt = window.event;
            var tecla = evt.keyCode;

            if(!(tecla > 47 && tecla < 58)){
                //alert('Precione apenas teclas numéricas');
                evt.preventDefault();
            }
        }

        function mascaraDdd(ddd) {

            if(ddd.value.length == 0){
                ddd.value = "(";
            }

            if (ddd.value.length == 3){
                ddd.value += ")";
            }

        }

        function mascaraTelf(telf){

            if(telf.value.length == 4){
                telf.value += "-";
            }

        }

        function removeTelf(id) {

            var child = document.getElementById(id)

            child.parentNode.removeChild(child);
        }

        function criaTelf(add) {
            if (add) {
                contDiv++;
            }


            var table = document.getElementById("phones");
            var clone = table.cloneNode(true);
            clone.id = ("phones" + contDiv);
            var button = document.createElement("button");
            button.setAttribute("onClick", "removeTelf(" + clone.id + ")");
            button.setAttribute("class", "btn btn-sm btn-danger");
            button.innerHTML = "Remover Telefone";

            clone.appendChild(button);

            document.getElementById("setPhone").appendChild(clone);

        }

        function validaSenha() {
            var senha = document.getElementById("senha");
            var senha2 = document.getElementById("senha2");

            if (senha.value != senha2.value) {
                alert("As senhas não conferem, digite corretamente");
                senha.focus();
                return false;
            } else {
                if (confirm("Alterar esse usuario?")) {
                    return true
                }
            }

            return false;


        }
    </script>

</head>
<body>
<c:import url="header.jsp"/>
<center>
    <c:if test="${mensagem != null}">
        <h2>${mensagem}</h2>
    </c:if>
    <fieldset>
        <legend>Alterar Usuario</legend>
        <form action="updateUser" method="POST" id="form" onsubmit="return validaSenha()">
            <input type="hidden" name="id" value="${usuario.id}"/>
            <div class="form-group">
                <lable>Nome:</lable>
                <input type="text" name="nome" style="width: 500px;" maxlength="100" class="form-control"
                       placeholder="Your Name" required="required" value="${usuario.nome}"/>
            </div>
            <div class="form-group">
                <lable>Email:</lable>
                <input type="email" name="email" style="width: 500px;" maxlength="100" class="form-control"
                       placeholder="yourname@xyz.com" required="required" value="${usuario.email}"/><br>
            </div>

            <div class="form-group">
                <lable>Senha:</lable>
                <input type="password" name="senha" id="senha" style="width: 500px;" maxlength="100" minlength="8"
                       class="form-control"
                       placeholder="*********" required="required"><br>
            </div>
            <div class="form-group">
                <lable>Repetir Senha:</lable>
                <input type="password" name="senah2" id="senha2" style="width: 500px;" minlength="8" maxlength="100"
                       class="form-control"
                       placeholder="*********" required="required"><br>
            </div>
            <table id="phones" border="1">
                <tr>
                    <td>
                        Telefones
                        <lable>DDD:</lable>
                        <input type="text" name="ddd" style="width: 500px" onkeypress="tecla(); mascaraDdd(this)" maxlength="4" minlength="2"
                               class="form-control"
                               placeholder="(00)" required="required" value="${usuario.telefones.get(0).ddd}"/><br>
                        <lable>Telefone: <h6>* Apenas 8 dígitos</h6></lable>
                        <input type="text" name="telefone" style="width: 500px;" onkeypress="tecla(); mascaraTelf(this)" maxlength="9" minlength="8"
                               class="form-control"
                               placeholder="8888-8888" required="required" value="${usuario.telefones.get(0).numero}" /><br>
                        <lable>Tipo:</lable>
                        <select class="form-control" name="tipo" required="required" style="width: 500px;">
                            <option value="">-------------Selecione-----------</option>
                            <option value="1">
                                Celular
                            </option>
                            <option value="2">
                                Fixo
                            </option>
                        </select>
                        <br>
                    </td>
                </tr>
            </table>
            <div id="setPhone">
                <c:if test="${usuario.telefones.size() > 1}">
                    <c:forEach var="telefone" items="${phones}">
                        <table border="1" id="${telefone.id}" >
                            <tr>
                                <td>
                                    Telefones
                                    <lable>DDD:</lable>
                                    <input type="text" name="ddd" style="width: 500px" maxlength="4" minlength="2"
                                           class="form-control" onkeypress="tecla(); mascaraDdd(this)"
                                           placeholder="(00)" required="required"
                                           value="${telefone.ddd}"/><br>
                                    <lable>Telefone:</lable>
                                    <input type="text" name="telefone" style="width: 500px;" maxlength="9"
                                           minlength="8"
                                           class="form-control"
                                           placeholder="8888-8888"
                                           required="required" onkeypress="tecla(); mascaraTelf(this)" value="${telefone.numero}" /><br>
                                    <lable>Tipo:</lable>
                                    <select class="form-control" name="tipo" required="required" style="width: 500px;">
                                        <option value="">-------------Selecione-----------</option>
                                        <option value="1">
                                            Celular
                                        </option>
                                        <option value="2">
                                            Fixo
                                        </option>
                                    </select>
                                    <br>
                                    <button type="button" class="btn btn-sm btn-danger" onclick="removeTelf(${telefone.id})"> Remover Telefone </button>
                                </td>
                            </tr>
                        </table>
                    </c:forEach>
                </c:if>

            </div>
            <button type="button" onclick="criaTelf()">Adicionar Telefone</button>
            <br>
            <button type="submit" class="btn btn-success">Cadastrar</button>
            <button type="reset" class="btn btn-danger" onclick="return acept();">Zerar dados</button>

        </form>
    </fieldset>
</center>
</body>
</html>