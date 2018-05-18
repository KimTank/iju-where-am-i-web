package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	//-----------------------------------
	public MemberDAO() {
		//실제로 SQL에 접속할 수 있게 해주는 부분
		try {
			System.out.println(Class.forName("oracle.jdbc.driver.OracleDriver"));
			String dbURL = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
			String dbID = "KTY";
			String dbPassword = "1234";
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			System.out.println(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//로그인---------------------------------
	public int login(String userId, String userPassword) {
		//System.out.println(userId);
		//System.out.println(userPassword);//확인용
		String sql = "SELECT userPassword FROM member WHERE userId= ?";
		try {
			pstmt = conn.prepareStatement(sql);//미리 만들어 놓은 sql문장에 ?부분을 사용할거임
			pstmt.setString(1, userId);//들어오는 값을 ?부분에 대입시켜줌
			rs = pstmt.executeQuery();//객체로 만들어서 받음
			//비교구문으로 로그인인지 아닌지 데이터베이스 오류인지 판별함
			if(rs.next()) {//결과가 존재한다면 rs.next로 실행옴
				if(rs.getString(1).equals(userPassword)) {//id와 password일치 시 성공시키자
					return 1; // 로그인 성공
				} else {
					return 0; //비밀번호 불일치
				}
			}
			return -1; // 아이디가 없음

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;// 데이터베이스 오류
		
		//회원가입------------------------------
		}
	public int join(Member member) {
		
		 String sql = "INSERT INTO MEMBER VALUES(?, ?, ?, ?, ?, ?, ?)";
		 try {
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, member.getUserId());
			 pstmt.setString(2, member.getUserPassword());
			 pstmt.setString(3, member.getUserGender());
			 pstmt.setString(4, member.getUserName());
			 pstmt.setString(5, member.getUserBirth().toString());
			 pstmt.setString(6, member.getUserCell().toString());
			 pstmt.setString(7, member.getUserEmail());
			 return pstmt.executeUpdate();
		 } catch(Exception e) {
			 e.printStackTrace();
		 }
		 return -1;
	}
}
