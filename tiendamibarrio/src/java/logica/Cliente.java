/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logica;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import persistencia.ConexionBD;

/**
 *
 * @author Eburg
 */
public class Cliente {
    private String idCliente;
    private String nombre;
    private String direccion;
    private String telefono;
    private String email;

    public Cliente() {
    }

    public Cliente(String idCliente, String nombre, String direccion, String telefono, String email) {
        this.idCliente = idCliente;
        this.nombre = nombre;
        this.direccion = direccion;
        this.telefono = telefono;
        this.email = email;
    }

    public String getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(String idCliente) {
        this.idCliente = idCliente;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Cliente{" + "idCliente=" + idCliente + ", nombre=" + nombre + ", direccion=" + direccion + ", telefono=" + telefono + ", email=" + email + '}';
    }
    
    //Consultar clientes
    public List<Cliente> consultarClientes() throws SQLException{
        List<Cliente> clientes = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql="SELECT * FROM clientes;";
        ResultSet rs = conexion.consultarBD(sql);
        try{
            Cliente a;
            while(rs.next()){
                a = new Cliente();
                a.setIdCliente(rs.getString("idCliente"));
                a.setNombre(rs.getString("nombre"));
                a.setDireccion(rs.getString("direccion"));
                a.setTelefono(rs.getString("telefono"));
                a.setEmail(rs.getString("email"));
                clientes.add(a);
                
        }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
        conexion.cerrarConexion();
        }
        return clientes;
    }
    
    //Guardar y/o agregar cliente
    
    public boolean guardarCliente(){
        boolean exito = false;
        ConexionBD conexion = new ConexionBD();
        String sql = "INSERT INTO clientes (idCliente, nombre, direccion, telefono, email) VALUES('"+idCliente+"', '"+nombre+"', '"+direccion+"', '"+telefono+"', '"+email+"');";
        if(conexion.setAutoCommitBD(false)){
            if(conexion.insertarBD(sql)){
                exito = true;
                conexion.commitBD();
                conexion.cerrarConexion();            
            }else{
                conexion.rollbackBD();
                conexion.cerrarConexion();
            }
        }else{
            conexion.cerrarConexion();
        }         
        return exito;
        
    }
    
    //Actualizar
    
    public boolean actualizarCliente(){
        boolean exito = false;
        ConexionBD conexion = new ConexionBD();
        String sql = "UPDATE clientes SET nombre='"+nombre+"', direccion='"+direccion+"', telefono='"+telefono+"', email='"+email+"' WHERE idCliente='"+idCliente   +"';";
        if(conexion.setAutoCommitBD(false)){
            if(conexion.actualizarBD(sql)){
                exito = true;
                conexion.commitBD();
                conexion.cerrarConexion();            
            }else{
                conexion.rollbackBD();
                conexion.cerrarConexion();
            }
        }else{
            conexion.cerrarConexion();
        }         
        return exito;
    }

    //Eliminar
    
    public boolean eliminarCliente(){
        boolean exito = false;
        ConexionBD conexion = new ConexionBD();
        String sql = "DELETE FROM clientes WHERE idCliente='"+idCliente+"';";
        if(conexion.setAutoCommitBD(false)){
            if(conexion.actualizarBD(sql)){
                exito = true;
                conexion.commitBD();
                conexion.cerrarConexion();            
            }else{
                conexion.rollbackBD();
                conexion.cerrarConexion();
            }
        }else{
            conexion.cerrarConexion();
        }         
        return exito;
    }    
    
    
}
