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
    </script>

</head>
<body>
<c:import url="header.jsp"/>
<center>
    <fieldset>
        <legend>Cadastrar Usuario</legend>
        <form action="cadastrarUsuario" method="POST">
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
                <input type="password" name="senha" style="width: 500px;" maxlength="100" class="form-control"
                       placeholder="*********" required="required"><br>
            </div>
            <button type="submit" class="btn btn-success">Cadastrar</button>
            <button type="reset" class="btn btn-danger" onclick="return acept();">Zerar dados</button>

        </form>
    </fieldset>
</center>
</body>
</html>