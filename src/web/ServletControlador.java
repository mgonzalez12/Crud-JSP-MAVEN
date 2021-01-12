package web;

import datos.ClienteDaoJDCB;
import dominio.Cliente;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ServletControlador")
public class ServletControlador extends HttpServlet{


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion = request.getParameter("accion");
		if(accion != null) {
			 switch(accion) {
			 case "editar":
				 this.editarCliente(request, response);
				 break;
			 case "eliminar":
				  this.eliminarCliente(request,response);
				  break;
				default:
					this.accionDefault(request, response);
			 }
		}else {
			this.accionDefault(request, response);
		}
	}
	
	private void accionDefault(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Cliente> clientes = new ClienteDaoJDCB().listar();
		System.out.println("Clientes = " + clientes);
		
		HttpSession sesion = request.getSession();
		sesion.setAttribute("clientes", clientes);
		sesion.setAttribute("totalClientes", clientes.size());
		sesion.setAttribute("saldoTotal", this.calcularSaldoTotal(clientes));
		/*request.setAttribute("clientes", clientes);
		request.setAttribute("totalClientes", clientes.size());
		request.setAttribute("saldoTotal", this.calcularSaldoTotal(clientes));
		request.getRequestDispatcher("cliente.jsp").forward(request, response); */
		response.sendRedirect("cliente.jsp");
	}
	
	 private double calcularSaldoTotal(List<Cliente> clientes) {
		 double saldoTotal = 0;
		 for(Cliente cliente: clientes) {
			 saldoTotal += cliente.getSaldo();
		 }
		 
		 return saldoTotal;
	 }
	 
	 @Override
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String accion = request.getParameter("accion");
		 if(accion != null) {
			 switch(accion) {
			 case "insertar":
				 	this.insertarCliente(request, response);
				 	break;
			 case "modificar":
				 	this.modificarCliente(request,response);
				 	break;
			 default: 
				 this.accionDefault(request, response);
			 }
		 }else {
			 this.accionDefault(request, response);
		 }
	 }
	 
	 private void insertarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		 // recuperamos los valores del formulario
		 String nombre = request.getParameter("nombre");
		 String apellido = request.getParameter("apellido");
		 String email = request.getParameter("email");
		 String telefono = request.getParameter("telefono");
		 double saldo = 0;
		 String saldoString = request.getParameter("saldo");
		 if(saldoString != null && !"".equals(saldoString)) {
			 saldo = Double.parseDouble(saldoString);
		 }
		 
		 // creamos un objeto de cliente (modelo)
		 Cliente cliente = new Cliente(nombre,apellido,email,telefono,saldo);
		 
		 // insertamos en la base de datos
		 int registrosModificados = new ClienteDaoJDCB().insertar(cliente);
		 System.out.println("registrosModificados = " +registrosModificados);
		 
		 // redirijimos hacia accion por default
		 this.accionDefault(request, response);
	 }
	 
	 private void modificarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		 
		 int idCliente = Integer.parseInt(request.getParameter("idCliente"));
		 String nombre = request.getParameter("nombre");
		 String apellido = request.getParameter("apellido");
		 String email = request.getParameter("email");
		 String telefono = request.getParameter("telefono");
		 double saldo = 0;
		 String saldoString = request.getParameter("saldo");
		 if(saldoString != null && !"".equals(saldoString)) {
			 saldo = Double.parseDouble(saldoString);
		 }
		 
		 Cliente cliente = new Cliente(idCliente,nombre, apellido, email,telefono,saldo);
		 
		 // modificar el objeto en la DB
		 int registrosModificados = new ClienteDaoJDCB().actualizar(cliente);
		 System.out.println("registrosModificados = " +registrosModificados);
		 
		 this.accionDefault(request, response);
	 }
	 
	 
	 private void eliminarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		 
		 int idCliente = Integer.parseInt(request.getParameter("idCliente"));	
		 Cliente cliente = new Cliente(idCliente);
		 
		 // Eliminar el objeto en la DB
		 int registrosModificados = new ClienteDaoJDCB().eliminar(cliente);
		 System.out.println("registrosModificados = " +registrosModificados);
		 
		 this.accionDefault(request, response);
	 }
 
	 private void editarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		 int idCliente = Integer.parseInt(request.getParameter("idCliente"));
		 Cliente cliente = new ClienteDaoJDCB().encontrar(new Cliente(idCliente));
		 request.setAttribute("cliente", cliente);
		 String jspEditar = "/paginas/editarCliente.jsp";
		 request.getRequestDispatcher(jspEditar).forward(request, response);
	 }
	 
}
