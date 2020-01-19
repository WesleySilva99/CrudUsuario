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
        return "cadastrar";
    }

    @RequestMapping(value = "cadastrarUsuario", method = RequestMethod.POST)
    public String cadastrar(Usuario usuario, @RequestParam(value = "ddd") String[] ddd,
                            @RequestParam(value = "telefone")  String[] telefone, @RequestParam(value = "tipo")  String[] tipo, Model model, HttpSession session){

        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

        UsuarioDao dao = new UsuarioDao();

        if (dao.buscarPorEmail(usuario.getEmail()) > 0){

            model.addAttribute("mensagem", "Email já cadastrado");

            if (usuarioLogado != null) {
                return "forward:listarUsuario";
            }

            return "forward:login";

        }
        usuario.setTelefones(Util.createASavePhoneList(ddd,telefone,tipo));

        dao.salvar(usuario);

        model.addAttribute("mensagem", "Usuario Cadastrado com sucesso!");

        if(usuarioLogado != null){

            return "forward:listarUsuario";

        }

        return "forward:login";
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
    public String delete(@RequestParam(value = "id") int id, Model model, HttpSession session){
        UsuarioDao dao = new UsuarioDao();

        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

        if(usuarioLogado.getId() == id){

            model.addAttribute("mensagem", "Não se pode excluir o usuario que está logado.");

            return "forward:listarUsuario";

        }

        dao.deleteUser(id);

        model.addAttribute("mensagem", "Usuario excluido com sucesso");

        return "forward:listarUsuario";
    }

    @RequestMapping("exibirAlterar")
    public String exibirAlterar(@RequestParam(value = "id") int id, Model model){

        UsuarioDao dao = new UsuarioDao();

        Usuario u = dao.buscarPorId(id);

        model.addAttribute("usuario", u);
        if(u.getTelefones().size() > 1)
            model.addAttribute("phones", Util.trataPhoneAlteracao(u.getTelefones()));

        return "alterar";
    }

    @RequestMapping("updateUser")
    public String update(Usuario u, @RequestParam(value = "ddd") String[] ddd,
                         @RequestParam(value = "telefone")  String[] telefone, @RequestParam(value = "tipo")  String[] tipo, Model model, HttpSession session){

        UsuarioDao dao = new UsuarioDao();

        u.setTelefones(Util.createASavePhoneList(ddd,telefone,tipo));

        u.setSenha(Util.gerarSenhaHasheada(u.getSenha()));

        dao.alterar(u);

        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

        if(usuarioLogado.getId() == u.getId()){

            session.setAttribute("usuarioLogado", u);

        }

        model.addAttribute("mensagem", "Usuario atualizado com sucesso!");

        return "forward:listarUsuario";
    }


}
