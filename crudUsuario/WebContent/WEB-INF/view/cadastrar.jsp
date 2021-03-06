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

        function acept() {
            if (confirm("Tem certeza que quer zerar os dados desse usuario?")) {
                return true;
            } else {
                return false;
            }
        }

        function removeTelf(id){
            id.parentNode.removeChild(id);
        }

        function criaTelf(add) {
            if (add) {
                contDiv++;
            }


            var table = document.getElementById("phones");
            var clone = table.cloneNode(true);
            clone.id = ("phones"+contDiv);
            var button = document.createElement("button");
            button.setAttribute("onClick", "removeTelf("+clone.id+")");
            button.setAttribute("class", "btn btn-sm btn-danger");
            button.innerHTML = "Remover Telefone"

            clone.appendChild(button);

            document.getElementById("setPhone").appendChild(clone);

        }

        function validaSenha(){
            var senha = document.getElementById("senha");
            var senha2 = document.getElementById("senha2");

            if(senha.value != senha2.value){
                alert("As senhas não conferem, digite corretamente");
                senha.focus();
                return false;
            }else{
                if(confirm("Cadastrar esse usuario?")){
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
            <legend>Cadastrar Usuario</legend>
            <form action="cadastrarUsuario" method="POST" id="form" onsubmit="return validaSenha()">
                    <div class="form-group">
                        <lable>Nome:</lable>
                        <input type="text" name="nome" style="width: 500px;" maxlength="100" class="form-control"
                               placeholder="Wesley Silva" required="required"/>
                    </div>
                    <div class="form-group">
                        <lable>Email:</lable>
                        <input type="email" name="email" style="width: 500px;" maxlength="100" class="form-control"
                               placeholder="yourname@xyz.com" required="required"/><br>
                    </div>

                    <div class="form-group">
                        <lable>Senha:</lable>
                        <input type="password" name="senha" id="senha" style="width: 500px;" minlength="8" maxlength="100" class="form-control"
                               placeholder="*********" required="required"><br>
                    </div>
                    <div class="form-group">
                        <lable>Repetir Senha:</lable>
                        <input type="password" name="senah2" id="senha2"style="width: 500px;" minlength="8" maxlength="100" class="form-control"
                               placeholder="*********" required="required"><br>
                    </div>
                    <h3>Telefones</h3>
                    <table id="phones" border="1">
                        <tr>
                            <td>
                            <lable>DDD:</lable>
                            <input type="text" name="ddd" style="width: 500px" maxlength="4" minlength="2" class="form-control"
                                   placeholder="(00)" onkeypress="tecla(); mascaraDdd(this)" required="required"/><br>
                            <lable>Telefone: <h6>* Apenas 8 dígitos</h6></lable>
                            <input type="text" name="telefone" style="width: 500px;" maxlength="9" minlength="8"
                                   class="form-control" onkeypress="tecla(); mascaraTelf(this)"
                                   placeholder="8888-8888" required="required"/><br>
                            <lable>Tipo:</lable>
                            <select class="form-control" required="required" name="tipo" style="width: 500px;">
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