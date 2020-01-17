package br.com.local.crud.controller;

import br.com.local.crud.dao.UsuarioDao;
import br.com.local.crud.model.Usuario;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @RequestMapping("login")
    public String login(){
        return "login/login";
    }

    @RequestMapping("loga")
    public String loga(Usuario usuario, HttpSession session, Model model){

        UsuarioDao dao = new UsuarioDao();

        Usuario usuarioLogado = dao.getOnlyOneUser(usuario);

        if(usuarioLogado != null){
            session.setAttribute("usuarioLogado", usuarioLogado);
        }else {
            model.addAttribute("mensagem","Usuario não encontrado");
            return "forward:login";
        }

        return "index";
    }

    @RequestMapping("logof")
    public String logof(Model model, HttpSession session){

        session.invalidate();
        model.addAttribute("mensagem", "Usuario deslogado");

        return "login/login";

    }

}
