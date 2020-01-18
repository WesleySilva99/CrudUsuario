package br.com.local.crud.util;

import br.com.local.crud.model.Telefone;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

public class Util {

    private static String stringHexa(byte[] bytes) {
        StringBuilder s = new StringBuilder();
        for (int i = 0; i < bytes.length; i++) {
            int parteAlta = ((bytes[i] >> 4) & 0xf) << 4;
            int parteBaixa = bytes[i] & 0xf;
            if (parteAlta == 0) s.append('0');
            s.append(Integer.toHexString(parteAlta | parteBaixa));
        }
        return s.toString();
    }

    public static byte[] gerarHash(String frase) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(frase.getBytes());
            return md.digest();
        } catch (NoSuchAlgorithmException e) {
            return null;
        }
    }

    public static String gerarSenhaHasheada(String senha){
        byte[] bytes = gerarHash(senha);

        String retorno = stringHexa(bytes);

        return retorno;

    }

    public static List<Telefone> createASavePhoneList(String[] ddd, String[] numero, String[] tipo){

        List<Telefone> phones = new ArrayList<>();

        for(int i = 0; i < ddd.length; i++){

            Telefone phone = new Telefone();
            phone.setDdd(ddd[i]);
            phone.setTipo(tipo[i]);
            phone.setNumero(numero[i]);

            phones.add(phone);

        }

        return phones;
    }

}
