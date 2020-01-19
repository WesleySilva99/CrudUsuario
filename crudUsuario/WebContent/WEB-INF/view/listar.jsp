<!DOCTYPE HTML>
<html>
<head>
    <meta charset="x-UTF-16LE-BOM">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css"/>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
    <script>

        function libera(){
            if (confirm("Deseja realmente deletar esse usuário?")){
                return true;
            }
            return false;
        }

    </script>

</head>
<body>

<c:import url="header.jsp"/>
<center>
    <c:if test="${mensagem != null}"><h2>${mensagem}</h2></c:if>
    <table class="table" style="width: 80%">
        <tr>
            <th>Id</th>
            <th>Nome</th>
            <th>Email</th>
            <th>DDD's</th>
            <th>Telefones</th>
            <th>Tipos</th>
            <th>Acoes</th>
        </tr>
        <c:forEach var="usuario" items="${usuarios}">
            <tr>
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
                    <c:forEach var="data" items="${usuario.telefones}">
                        ${data.ddd} <br>
                    </c:forEach>

                </td>
                <td>
                    <c:forEach var="data" items="${usuario.telefones}">
                        ${data.numero} <br>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="data" items="${usuario.telefones}">
                        <c:choose>
                            <c:when test="${data.tipo == '1'}">
                                Celular <br>
                            </c:when>
                            <c:otherwise>
                                Fixo <br>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                </td>
                <td>
                    <form action="exibirAlterar" method="POST">
                        <input type="hidden" name="id" value="${usuario.id}">
                        <button type="submit" class="btn-warning">Alterar</button>
                    </form>
                    <form action="deleteUser" method="POST" onsubmit="libera()">
                        <input type="hidden" name="id" value="${usuario.id}">
                        <button type="submit" class="btn-danger">Excluir</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</center>
</body>
</html>