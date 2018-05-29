package Pack01;

public class UserInfor {
	private String userId;
	private String userPassword;
	private String userGender;
	private String userName;
	private String userBirth;
	private String userCell;
	private String userEmail;
	
	public UserInfor() {}//이거없어서 오류떳음 추후 알아봐야됨 디폴트생성자가 왜 자동으로 작동안했는지에대해
	
	public UserInfor(String userId, String userPassword, String userName, String userBirth, String userCell,
			String userEmail) {
		this.userId = userId;
		this.userPassword = userPassword;
		this.userName = userName;
		this.userBirth = userBirth;
		this.userCell = userCell;
		this.userEmail = userEmail;
	}
	//로그인시
	public UserInfor(String userId, String userPassword) {
		this.userId = userId;
		this.userPassword = userPassword;
	}
	//회원정보수정 진입시
	public UserInfor(String userId) {
		this.userId = userId;
	}
	//회원가입
	public UserInfor(String userId, String userPassword, String userGender, String userName, String userBirth,
			String userCell, String userEmail) {
		this.userId = userId;
		this.userPassword = userPassword;
		this.userGender = userGender;
		this.userName = userName;
		this.userBirth = userBirth;
		this.userCell = userCell;
		this.userEmail = userEmail;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	public String getUserCell() {
		return userCell;
	}
	public void setUserCell(String userCell) {
		this.userCell = userCell;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	
}
