package Pack01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class Control {
	Dao dao = new Dao();
	UserInfor ui = new UserInfor();

	// 로그인 페이지에서 로그인하는 작동하게 만든것
	@RequestMapping("/t2loginInfor")
	public String loginAct(HttpServletRequest request, @RequestParam(value = "id") String id,
			@RequestParam(value = "pass") String pass, Model model) {
		// 확인용
		System.out.println(id + " " + pass);
		try {
			System.out.println(Class.forName("oracle.jdbc.driver.OracleDriver"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		//
		// 값대입
		UserInfor ui = new UserInfor(id, pass);
		// 비교한 후 int값 불러왔음
		String login = "";
		login = dao.login(ui);// 기존성공하면 1 실패하면 0이 오던것을 id값이 넘어오도록하였다
		System.out.println(login);
		// -----------------------
		if (login != "") {// 로그인에 성공했을때
			System.out.println("로그인성공");
			// 세션을 컨트롤러에서 나눈다
			HttpSession session = request.getSession();
			session.setAttribute("login", login);
			// 성공하면 main으로 가게 설계해놓았다
			return "main";
		} else {// 로그인에 실패했을때
			System.out.println("로그인실패");
			// 로그인실패일시
			HttpSession session = request.getSession();
			session.setAttribute("login", null);
			return "/user/loginFail";
		}
	}

	// 로그인 화면에서 Ajax사용하여 제어할 수 있도록 하는 함수
	@RequestMapping(value = "checkId.jy", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody void idCheck(UserInfor user, HttpServletResponse response) throws IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		System.out.println("고리걸었음");
		Dao dao = new Dao();
		JSONObject json = new JSONObject();// 제이슨 객체생성
		json.put("idCheck", dao.idCheck(user));// 제이슨 포멧 형식
		String s = json.toString();
		System.out.println(s);

		PrintWriter writer = response.getWriter();// 데이터만 날라옴
		writer.write(s);
		writer.flush();// 객체를 날려버렸음
		writer.close();
	}

	// 로그아웃 처리하자
	@RequestMapping("/t1logout")
	public String logoutAct(HttpServletRequest request) {
		dao.logout(request);
		return "main";
	}

	// 회원가입 처리하자
	@RequestMapping("/t2signup")
	public String signupAct(@RequestParam(value = "id") String id, @RequestParam(value = "pass") String pass,
			@RequestParam(value = "gender") String gender, @RequestParam(value = "name") String name,
			@RequestParam(value = "birth") String birth, @RequestParam(value = "cell") String cell,
			@RequestParam(value = "email") String email) {
		// 확인용
		System.out.println(id + " " + pass + " " + gender + " " + name + " " + birth + " " + cell + " " + email);
		try {
			System.out.println(Class.forName("oracle.jdbc.driver.OracleDriver"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		//
		dao.signup(new UserInfor(id, pass, gender, name, birth, cell, email));
		return "/user/login";
	}
}
