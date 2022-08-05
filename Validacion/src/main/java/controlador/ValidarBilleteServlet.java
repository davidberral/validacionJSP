package controlador;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modelo.Billete;

/**
 * Servlet implementation class ValidarBilleteServlet
 */
@WebServlet("/procesarBillete")
public class ValidarBilleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    public ValidarBilleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		// borrando los errores posibles
		session.removeAttribute("errorNombre");
		session.removeAttribute("errorEdad");
		session.removeAttribute("errorBillete");
		session.removeAttribute("errorPasajeros");
		
		Billete b = new Billete();
		boolean error=false;
		
		String nombre = request.getParameter("nombre");
		if (nombre ==null  || nombre.isBlank()) {
			session.setAttribute("errorNombre",
					"Debe introducir el nombre. ");
			error=true;
		} else {
			b.setNombre(nombre);
		}
		
		try {
			int edad = Integer.parseInt(request.getParameter("edad"));
			b.setEdad(edad);
			
			int tipoBillete = Integer.parseInt(request.getParameter("billete"));
			b.setTipoBillete(tipoBillete);
			
			if (tipoBillete==2 && edad>26) {
				session.setAttribute("errorBillete", 
				   "Debe tener menos de 26 para usar el billete joven");
				error=true;
			}else if (tipoBillete==3 && edad<65) {
				session.setAttribute("errorBillete", 
				   "Debe tener mas de 65 para usar el billete 3ª edad");
						error=true;
			}
		} catch (NumberFormatException e) {
			session.setAttribute("errorEdad", 
					"Debe introducir un valor numérico");
			error=true;
		}	
		String dni = request.getParameter("dni");
		b.setDni(dni);
		try {
			int numPasajeros = Integer.parseInt(request.getParameter("numPasajeros"));
			b.setNumPasajeros(numPasajeros);
		} catch (NumberFormatException e) {
			session.setAttribute("errorPasajeros", 
					"Debe introducir un numero válido");
			error=true;
		}
		String modalidad = request.getParameter("modalidad");
		if ("ida".equals(modalidad)) {
			b.setIdayVuelta(false);
		} else {
			b.setIdayVuelta(true);
		}
		
		session.setAttribute("billete", b);
		if (error) {
			response.sendRedirect("billete.jsp");
		} else {
			response.sendRedirect("detalles.jsp");
		}
	}

}
