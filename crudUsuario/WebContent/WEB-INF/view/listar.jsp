<!DOCTYPE HTML>
<html>
<head>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css"/>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>

<c:import url="header.jsp"/>

<table class="table" style="width: 80%">
    <tr>
        <th>Id</th>
        <th>Nome</th>
        <th>Email</th>
        <th>Telefones</th>
        <th>Ações</th>
    </tr>
    <c:forEach var="usuario" items="${usuarios}">

        <td>
                ${usuario.id}
        </td>
        <td>
                ${usuario.nome}
        </td>
        <td>
                ${usuario.email}
        </td>
        <td>

        </td>
        <td>
            <form action="">
                <input type="hidden" name="id" value="${usuario.id}">
                <button type="submit" class="btn-warning" >Cadastrar Telefone</button>
            </form>
            <form action="">
                <input type="hidden" name="id" value="${usuario.id}">
                <button type="submit" class="btn-warning" >Alterar</button>
            </form>
            <form action="">
                <input type="hidden" name="id" value="${usuario.id}">
                <button type="submit" class="btn-warning" >Excluir</button>
            </form>
        </td>
    </c:forEach>
</table>

</body>
</html>