package br.com.local.crud.controller;


import br.com.local.crud.dao.UsuarioDao;
import br.com.local.crud.model.Usuario;
import br.com.local.crud.util.Util;
import org.hibernate.LazyInitializationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class UsuarioController {

    @RequestMapping("exibirCadastroUsuario")
    public String exibirInclusao(){
        System.out.println("Exibindo tela de cadastro de usuário");
        return "cadastrar";
    }

    @RequestMapping(value = "cadastrarUsuario", method = RequestMethod.POST)
    public String cadastrar(Usuario usuario, @RequestParam(value = "ddd") String[] ddd,
                            @RequestParam(value = "telefone")  String[] telefone, @RequestParam(value = "tipo")  String[] tipo, Model model){

        UsuarioDao dao = new UsuarioDao();

        usuario.setTelefones(Util.createASavePhoneList(ddd,telefone,tipo));

        dao.salvar(usuario);

        model.addAttribute("mensagem", "Usuario Cadastrado com sucesso!");

        return "forward:exibirCadastroUsuario";
    }

    @RequestMapping("listarUsuario")
    public String listar(Model model){
        UsuarioDao dao = new UsuarioDao();

        try{

            List<Usuario> lista = dao.listar();

            model.addAttribute("usuarios", lista);

        }catch (LazyInitializationException e){
            e.getMessage();
        }

        return "listar";

    }

    @RequestMapping("deleteUser")
    public String delete(@RequestParam(value = "id") int id, Model model){
        UsuarioDao dao = new UsuarioDao();

        dao.deleteUser(id);

        model.addAttribute("mensagem", "Usuario excluido com sucesso");

        return "forward:listarUsuario";
    }

}
