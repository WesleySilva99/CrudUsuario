package br.com.local.crud.util;

import br.com.local.crud.model.Usuario;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AuthorizadorIntercepton extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller) throws Exception {

        String uri = request.getRequestURI();
        if (uri.contains("bootstrap") || uri.contains("css") ||
                uri.contains("img") || uri.contains("js")
                || uri.endsWith("loga") || uri.endsWith("login") || uri.endsWith("exibirCadastroUsuario") || uri.endsWith("cadastrarUsuario")) {
            return true;
        }

        if (request.getSession().getAttribute("usuarioLogado") != null) {
            return true;
        }

        response.sendRedirect("login");
        return false;
    }

}
