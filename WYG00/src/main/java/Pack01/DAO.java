package Pack01;

import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

class Dao {
	InputStream is=null; SqlSessionFactory sf=null; SqlSession session=null;
	Dao(){ 
		try { is = Resources.getResourceAsStream("mybatis-config.xml"); } catch (Exception e) { e.printStackTrace(); }
		sf = new SqlSessionFactoryBuilder().build(is);
	}
	
	//로그인
	public String login(UserInfor ui) {
		String id="";
		session = sf.openSession();
		try {
			List<UserInfor> result = session.selectList("login",ui);
			for (UserInfor info : result) {
				id = info.getUserId();
			}
		} finally { session.close(); }
		return id;
	}
	
	//로그아웃 처리하기위한 함수
	public void logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("login",null);
	}
	
	//회원가입처리
	public void signup(UserInfor ui) {
		session = sf.openSession();
		try {
			int result = session.insert("signup", ui);
			if(result>0){
				session.commit();
			}
		} finally { session.close(); }
	}
	
	public int idCheck(UserInfor ui) {
		session = sf.openSession();
		try {
			List<Integer> result = session.selectList("checkId", ui);
			return result.get(0);
		} finally { session.close(); }
	}
}
