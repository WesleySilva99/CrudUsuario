package br.com.local.crud.controller;


import br.com.local.crud.dao.UsuarioDao;
import br.com.local.crud.model.Usuario;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class UsuarioController {

    @RequestMapping("exibirCadastroUsuario")
    public String exibirInclusao(){
        System.out.println("Exibindo tela de cadastro de usuário");
        return "cadastrar";
    }

    @RequestMapping("cadastrarUsuario")
    public String cadastrar(Usuario usuario){

        UsuarioDao dao = new UsuarioDao();

        dao.salvar(usuario);

        return "salvarSucesso";
    }

    @RequestMapping("listarUsuario")
    public String listar(Model model){
        UsuarioDao dao = new UsuarioDao();

        List<Usuario> lista = dao.listar();

        model.addAttribute("usuarios", lista);

        return "listar";
    }

}
