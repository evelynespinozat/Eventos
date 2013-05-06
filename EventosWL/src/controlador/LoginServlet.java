package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.sigar.util.Configuracion;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = (HttpSession) request.getSession();
		String path = Configuracion.getInstance().getProperty("pathResources.dojo");
		String pathMain = Configuracion.getInstance().getProperty("pathResources.main");
		session.setAttribute("basePath", path);

		response.sendRedirect(pathMain);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

	}
	
}
