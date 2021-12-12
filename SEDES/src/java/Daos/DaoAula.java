/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import conexion.conexion;
import Clases.Aula;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ADSI Sena
 */
public class DaoAula {

    private conexion conexion;
    private ResultSet rs;

    public DaoAula() {
        conexion = new conexion();
    }

    public boolean AlmacenarAula(long id_aula, long id_tipo_aula, long id_sede, String nombre_aula, String observaciones_aula) {
        String consulta = "insert into aula values(" + id_aula + "," + id_tipo_aula + "," + id_sede + ",'" + nombre_aula + "','" + observaciones_aula + "');";

        System.out.println(consulta);

        if (conexion.insertarDatos(consulta)) {
            conexion.desconectar();

            return true;

        } else {
            conexion.desconectar();
            return false;
        }

    }

    public boolean EliminarAula(long id_aula) {

        String consulta = "delete from aula where id_aula=" + id_aula + ";";
        System.out.println(consulta);

        if (conexion.eliminarDatos(consulta)) {
            conexion.desconectar();

            return true;

        } else {
            conexion.desconectar();
            return false;

        }
    }

    public boolean ActualizarAula(String nombre_aula, long id_aula, String observaciones_aula) {
        String consulta = "UPDATE aula SET nombre_aula='" + nombre_aula + "', observaciones_aula='" + observaciones_aula + "'WHERE id_aula=" + id_aula + ";";

        System.out.println(consulta);

        if (conexion.modificarDatos(consulta)) {
            conexion.desconectar();

            return true;
        } else {
            conexion.desconectar();
            return false;
        }
    }

    public ArrayList listarAula() throws SQLException {
        ArrayList listaraula = new ArrayList();
        String Consulta = "Select ta.nombre_tipo_aula, a.id_aula, a.nombre_aula, a.observaciones_aula, s.nombre_sede\n"
                + "                from Tipo_aula ta, aula a, sede s \n"
                + "                where a.id_sede=s.id_sede and a.id_tipo_aula=ta.id_tipo_aula  order by  a.id_aula;";
        try {
            rs = conexion.seleccionarDatos(Consulta);
            Aula Aula;
            while (rs.next()) {
                Aula = new Aula();
                Aula.setNombre_tipo_aula(rs.getString(1));
                Aula.setId_aula(rs.getLong(2));
                Aula.setNombre_aula(rs.getString(3));           
                Aula.setObservaciones_aula(rs.getString(4));
                Aula.setNombre_sede(rs.getString(5));

                listaraula.add(Aula);

            }
            conexion.desconectar();
            return listaraula;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            conexion.desconectar();
            return null;
        }
    }

    public ArrayList ListarAulaUnica(long id_aula) { // Creamos un nuevo método y por parámetro se recibe la llave primaria de la tabla que vayamos a listar

        ArrayList ListarAula = new ArrayList(); // Creamos un nuevo Array List 

        String Consulta = "select * from aula where id_aula =" + id_aula + ""; // En Un String creamos la consulta, como pueden ver lleva el valor de llave primaria que pedimos por parámetro del método.

        try {
            rs = conexion.seleccionarDatos(Consulta); // Enviamos la consulta a la Base de Datos.
            while (rs.next()) { // Creamos el while para tomar los datos.

                Aula aula = new Aula(); // Creamos una nueva instacia de la clase que vamos a usar.

                //Tomamos cada uno de los valores que nos devuelve la Base de Datos.
                aula.setId_aula(rs.getLong(1));
                aula.setId_tipo_aula(rs.getLong(2));
                aula.setId_sede(rs.getLong(3));
                aula.setNombre_aula(rs.getString(4));
                aula.setObservaciones_aula(rs.getString(5));

                //Adicionamos cada uno de esos valores al Array List.
                ListarAula.add(aula);
            }
            // Cerramos la conexion y devolvemos el Array List con los datos.
            conexion.desconectar();
            return ListarAula;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            conexion.desconectar();
            return null;

        }
    }
}
