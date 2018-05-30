package Pack01;

import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

class BbsDaoMb {
	InputStream is=null; SqlSessionFactory sf=null; SqlSession session=null;
	BbsDaoMb(){ 
		try { is = Resources.getResourceAsStream("mybatis-config.xml"); } catch (Exception e) { e.printStackTrace(); }
		sf = new SqlSessionFactoryBuilder().build(is);
	}

	//회원정보수정 진입시 아이디값 넘기자
	public Bbs bbsUpdate(Bbs bi) {
		session = sf.openSession();
		try {
			List<Bbs> result = session.selectList("bbsUpdate",bi);
			for (Bbs info : result) {
				return info;
			}
		} finally { session.close(); }
		 return null;
	}
	
	//회원정보수정
	public void bbsUpdateAct(Bbs bi) {
		session = sf.openSession();
		try {
			int result = session.update("bbsUpdateAct", bi);
			if(result>0){
				session.commit();
			}
		} finally { session.close(); }
	}
}
