package temp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {
    //servlet - jsp이전에는 servlet을통해 java로 웹서버프로그램을 만듬  
	//servlet은 자바를 기본으로 내가 보내고 싶은 html태그를 안쪽에 써서 보내는방식
	//조금만 수정하려고해도 자바코드를 수정하고 컴파일을 계속해줘야함
	//이러한 복잡한방식을 개선하고 보완한것이 jsp
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");//서버에서 클라이언트로 지정
		PrintWriter out =response.getWriter();//getWriter 출력스트림 (클라이언트에게 응답)
		out.println("<html>");
		out.println("<head><title> 나의첫 서블릿</title></head>");
		out.println("<body>");
		out.println("<h1>웹서버프로그램</h1>");
		out.println("</body>");
		out.println("</html>");
		out.close();
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
