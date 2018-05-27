package Pack01;

import java.io.InputStream;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

class Information {
	String id, pass, name; int birth, phone;
	Information(){}
	public String getId() { return id; } public void setId(String id) { this.id = id; }
	public String getPass() { return pass; } public void setPass(String pass) { this.pass = pass; }
	public String getName() { return name; } public void setName(String name) { this.name = name; }
	public int getBirth() { return birth; } public void setBirth(int birth) { this.birth = birth; }
	public int getPhone() { return phone; } public void setPhone(int phone) { this.phone = phone; }
}
class Dao {
	InputStream is=null; SqlSessionFactory sf=null; SqlSession session=null;
	Dao(){
		try { is =Resources.getResourceAsStream("mybatis-config.xml"); } catch (Exception e) { e.printStackTrace(); }
		sf = new SqlSessionFactoryBuilder().build(is);	
	}
	void insert(Information info) {
		session = sf.openSession();
		try {
			int result = session.insert("test02", info);
			if(result>0) {
				session.commit();
			}
		}finally {session.close();}
	}
}
@Controller
public class Connect {
	/*@RequestMapping("/t1")
	public String f1() {
		try { System.out.println(Class.forName("oracle.jdbc.driver.OracleDriver"));
		} catch (Exception e) { e.printStackTrace(); }
		Dao dao = new Dao();
		dao.insert(new Information("∞Ê¡÷", 997));
		return "a";
	}*/
	@RequestMapping("/signUp")
	public String signUp() {
		return "signUp";
	}
	@RequestMapping("/logIn")
	public String logIn() {
		return "logIn";
	}
	@RequestMapping("/logCh")
	public String logCh() {
		return "logCh";
	}
	public static void main(String[] args) {

	}
}
