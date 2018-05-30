package Pack01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	private Connection conn;
	private ResultSet rs;
	//-----------------------------------
	public BbsDAO() {
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
//게시판 작성을 위해서는 3개의 함수가 필요하다
	//작성시간을 나타내주는 함수(mysql과 oracle sqlLite는 포멧과 명령문이 틀리므로 유의바람)
	public String getDate() {
		String sql = "SELECT SYSDATE from dual";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터베이스오류
	}
	
	//게시물 번호를 나타내줄 수 있는 함수//sql Lite에서 시퀀스를 사용해서 순차적으로 증가하게 부여할수도있음
	public int getNext() {
		String sql = "SELECT bbsid FROM bbs ORDER BY bbsId DESC";
		try {

			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;//첫번째 게시물인경우
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스오류
	}
	
	//글쓰기를 데이터베이스에 연결하는 함수//앞서 제작한 함수들을 대입시켜준다//이때 포멧이 맞지 않을경우 들어가지 않는 오류남
	public int write(String bbsTitle, String userId, String bbsContent) {
		String sql = "INSERT INTO bbs VALUES(?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			System.out.println(getNext());
			System.out.println(bbsTitle);
			System.out.println(userId);
			System.out.println(getDate());
			System.out.println(bbsContent);
			System.out.println(1);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userId);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스오류
	}
	
//게시글 목록을 볼 수 있게 해주는 함수를 구현
	int bbsPage = 10;
	public ArrayList<Bbs> getList(int pageNumber) {
		//bbsAvailabe(게시글 삭제가 되지않은)이 limit(글목록) 10개를 띄워주자
		String sql = "SELECT * FROM bbs WHERE (bbsId < ?) AND (bbsAvailable = 1) AND (bbsId >= ?) ORDER BY bbsId DESC";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			//게시글의 페이지의 대입값이 ?보다 작게

			pstmt.setInt(1, getNext()-(pageNumber-1)*bbsPage);
			pstmt.setInt(2, getNext()-(pageNumber-1)*bbsPage-bbsPage);
			rs=pstmt.executeQuery();

			while(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsId(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserId(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				list.add(bbs);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	//만약에 페이지가 10개밖에 없을때 다음 버튼이 작동하지 않아야하므로 그에 상응하는 함수를 만들어준다
	public boolean nextPage(int pageNumber) {
		String sql = "SELECT * FROM bbs WHERE bbsId < ? AND bbsAvailable = 1";
		try {
			System.out.println("빈"+pageNumber);
			PreparedStatement pstmt = conn.prepareStatement(sql);
			//게시글의 페이지의 대입값이 ?보다 작게
			pstmt.setInt(1, getNext()-(pageNumber-1)*bbsPage);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
//게시글 보기 기능 구현----------------------------------------------
	public Bbs getBbs(int bbsId) {
		String sql = "SELECT * FROM bbs WHERE bbsId = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bbsId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsId(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserId(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				return bbs;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
//게시글 수정-----------------------------------------------------------
	public int update(int bbsId, String bbsTitle, String bbsContent) {
		String sql = "UPDATE bbs SET bbsTitle=?, bbsContent=? WHERE bbsId=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsId);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스오류
	}
//게시글 삭제-----------------------------------------------------------
	public int delete(int bbsId) {
		String sql = "UPDATE bbs SET bbsAvailable=0 WHERE bbsId=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bbsId);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스오류
	}
}
