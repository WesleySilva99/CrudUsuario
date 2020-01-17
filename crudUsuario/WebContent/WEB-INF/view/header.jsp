<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Desafio Pitang</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <c:choose>
                <c:when test="${usuarioLogado == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="login">Login</a>
                    </li>
                </c:when>
            </c:choose>
            <c:choose>
                <c:when test="${usuarioLogado != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="listarUsuario">Listar Usuarios</a>
                    </li>

                </c:when>
            </c:choose>
            <li class="nav-item">
                <a class="nav-link" href="exibirCadastroUsuario">Cadastrar Usuario</a>
            </li>
            <c:choose>
                <c:when test="${usuarioLogado != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="logof">deslogar</a>
                    </li>
                </c:when>
            </c:choose>
        </ul>
    </div>
</nav>