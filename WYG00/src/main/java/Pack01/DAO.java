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
	
	//Ajax로 아이디중복확인
	public int idCheck(UserInfor ui) {
		session = sf.openSession();
		try {
			List<Integer> result = session.selectList("checkId", ui);
			return result.get(0);
		} finally { session.close(); }
	}
	
	//회원정보수정 진입시 아이디값 넘기자
	public UserInfor logup(UserInfor ui) {
		session = sf.openSession();
		try {
			List<UserInfor> result = session.selectList("logup",ui);
			for (UserInfor info : result) {
				return info;
			}
		} finally { session.close(); }
		 return null;
	}
	
	//회원정보수정
	public void update(UserInfor ui) {
		session = sf.openSession();
		try {
			int result = session.update("update", ui);
			if(result>0){
				session.commit();
			}
		} finally { session.close(); }
	}
}
