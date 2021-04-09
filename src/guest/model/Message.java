package guest.model;
/*정수형 : int,long(8b)
  실수형 : float(4),double(8)-default
  
*/
public class Message {
	//변수명은 소문자 시작+낙타표기법
	private int message_Id;
	private String guestName;
	private String password;
	private String message;
	
	public int getMessage_Id() {
		return message_Id;
	}
	public void setMessage_Id(int message_Id) {
		this.message_Id = message_Id;
	}
	public String getGuestName() {
		return guestName;
	}
	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
