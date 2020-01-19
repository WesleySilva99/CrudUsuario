<!DOCTYPE HTML>
<head>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css"/>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<html>
<body>
<c:import url="../header.jsp"/>
<center>
    <c:if test="${mensagem != null}">
        <h2>${mensagem}</h2>
    </c:if>
<fieldset>
    <legend>Login</legend>
<form action="loga" method="POST">
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

</form>
</fieldset>
</center>
</body>
</html>