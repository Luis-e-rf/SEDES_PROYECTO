/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Clases.Ficha;
import conexion.conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ADSI Sena
 */
public class DaoFicha {

    private conexion conexion;

    private ResultSet rs;

    public DaoFicha() {

        conexion = new conexion();
    }

    public boolean AlmacenarFicha(long numero_ficha, long id_programa, String fecha_inicio, String fecha_fin) {
        String consulta = "insert into ficha values (" + numero_ficha + "," + id_programa + ",'" + fecha_inicio
                + "','" + fecha_fin + "');";
        System.out.println(consulta);

        if (conexion.insertarDatos(consulta)) {
            conexion.desconectar();

            return true;

        } else {
            conexion.desconectar();
            return false;
        }
    }

    public boolean EliminarFicha(long numero_ficha) {
        String consulta = "delete from Ficha where numero_ficha=" + numero_ficha + ";";
        System.out.println(consulta);

        if (conexion.eliminarDatos(consulta)) {

            conexion.desconectar();

            return true;

        } else {
            conexion.desconectar();
            return false;
        }
    }

    public boolean ActualizarFicha(String fecha_fin, long numero_ficha) {
        String consulta = "UPDATE ficha SET fecha_fin='" + fecha_fin + "' WHERE numero_ficha=" + numero_ficha + ";";

        System.out.println(consulta);

        if (conexion.modificarDatos(consulta)) {
            conexion.desconectar();

            return true;
        } else {

            conexion.desconectar();
            return false;
        }
    }

    public ArrayList listarFicha() throws SQLException {
        ArrayList listarFicha = new ArrayList();
        String Consulta = "Select f.numero_ficha, p.nombre_programa, f.fecha_inicio, f.fecha_fin\n"
                + "                from ficha f, programa p \n"
                + "                where f.id_programa=p.id_programa  order by  f.numero_ficha;";
        try {
            rs = conexion.seleccionarDatos(Consulta);
            while (rs.next()) {
                Ficha Ficha = new Ficha();

                Ficha.setNumero_ficha(rs.getLong(1));
                Ficha.setNombre_programa(rs.getString(2));
                Ficha.setFecha_inicio(rs.getDate(3));
                Ficha.setFecha_fin(rs.getDate(4));

                listarFicha.add(Ficha);

            }
            conexion.desconectar();
            return listarFicha;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            conexion.desconectar();
            return null;
        }
    }

    public ArrayList ListarFichaUnico(long numero_ficha) { // Creamos un nuevo método y por parámetro se recibe la llave primaria de la tabla que vayamos a listar

        ArrayList ListarFicha = new ArrayList(); // Creamos un nuevo Array List 

        String Consulta = "select * from ficha where numero_ficha =" + numero_ficha + ""; // En Un String creamos la consulta, como pueden ver lleva el valor de llave primaria que pedimos por parámetro del método.

        try {
            rs = conexion.seleccionarDatos(Consulta); // Enviamos la consulta a la Base de Datos.
            while (rs.next()) { // Creamos el while para tomar los datos.

                Ficha Ficha = new Ficha(); // Creamos una nueva instacia de la clase que vamos a usar.

                //Tomamos cada uno de los valores que nos devuelve la Base de Datos.
                Ficha.setNumero_ficha(rs.getLong(1));
                Ficha.setId_programa(rs.getLong(2));
                Ficha.setFecha_inicio(rs.getDate(3));
                Ficha.setFecha_fin(rs.getDate(4));

                //Adicionamos cada uno de esos valores al Array List.
                ListarFicha.add(Ficha);
            }
            // Cerramos la conexion y devolvemos el Array List con los datos.
            conexion.desconectar();
            return ListarFicha;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            conexion.desconectar();
            return null;

        }

    }

    public boolean VerificarFicha(long numero_ficha) throws SQLException {
        String Consulta = "select * from ficha where numero_ficha =" + numero_ficha + "";
        System.out.print(Consulta);

        rs = conexion.seleccionarDatos(Consulta);
        while (rs.next()) {

            Ficha Ficha = new Ficha();

            Ficha.setNumero_ficha(rs.getLong(1));
            Ficha.setId_programa(rs.getLong(2));
            Ficha.setFecha_inicio(rs.getDate(3));
            Ficha.setFecha_fin(rs.getDate(4));

            if (Ficha.getNumero_ficha() == numero_ficha) {

                return true;
            }

        }
        return false;
    }
}
