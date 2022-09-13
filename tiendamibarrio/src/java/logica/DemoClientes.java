/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logica;

import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Eburg
 */
public class DemoClientes {
    public static void main(String[] args) throws SQLException{
        
        Cliente a = new Cliente();
        //Agregar nuevo cliente
        a.setIdCliente("CLI-002");
//        a.setNombre("Ricardo Pablo");
//        a.setDireccion("Cali");
//        a.setTelefono("3102323232");
//        a.setEmail("a@username.com");
//        System.out.println(a.guardarCliente());
//        System.out.println(a.actualizarCliente());
        System.out.println(a.eliminarCliente());

        List<Cliente> clientes = a.consultarClientes();
        for(Cliente ax: clientes){
            System.out.println(ax.toString());
        }
    }
    
}
