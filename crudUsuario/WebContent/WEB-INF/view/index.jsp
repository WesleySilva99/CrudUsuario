<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css"/>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<c:import url="header.jsp"/>
    <h1>Bem vindo ${usuarioLogado.nome}!</h1>
</body>
</html>