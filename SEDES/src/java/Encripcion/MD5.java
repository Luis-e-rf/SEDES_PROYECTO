/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Encripcion;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author ADSI Sena
 */
 
public class MD5
{
    public static String hash(String value) throws NoSuchAlgorithmException
    {

        MessageDigest alg = MessageDigest.getInstance("MD5");
        alg.reset();
        alg.update(value.getBytes());
        byte[] digest = alg.digest();
        StringBuilder hashedpasswd = new StringBuilder();
        String hx;
        for (int i=0;i<digest.length;i++)
        {
        hx =  Integer.toHexString(0xFF & digest[i]);
        if(hx.length() == 1){hx = "0" + hx;}
        hashedpasswd.append(hx);
        }

        return hashedpasswd.toString();
    }
}

