package member.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDao {

	
	// DB 연결시  관한 변수 

	private static final String 	dbDriver	=	"oracle.jdbc.driver.OracleDriver";
	private static final String		dbUrl		=	"jdbc:oracle:thin:@localhost:1521:xe";
	private static final String		dbUser		=	"SCOTT";
	private static final String		dbPass		=	"TIGER";

		
	private static MemberDao memberDao;
	
	public static MemberDao getInstance() throws MemberException
	{
		if( memberDao == null )
		{
			memberDao =  new MemberDao();
		}
		return memberDao;
	}
	

	private MemberDao() throws MemberException
	{
			
		try{
			
			/********************************************
				1. 드라이버를 로딩
			*/
			Class.forName("oracle.jdbc.driver.OracleDriver");				
		
		}catch( Exception ex ){
			throw new MemberException("DB 연결시 오류  : " + ex.toString() );	
		}
	}
	
	/*******************************************
	 * * 회원관리테이블 MEMBERTEST 에  회원정보를 입력하는 함수
	 * @param rec
	 * @throws MemberException
	 */
	public void insertMember( Member rec ) throws MemberException
	{
		try {
			 // 0. 연결 객체 얻어오기	
			Connection connection=DriverManager.getConnection(dbUrl,dbUser,dbPass);		
			 // 1. sql 문장 만들기 ( insert문 )
			String sql = "INSERT INTO memberTest (ID, PASSWORD, NAME, TEL, ADDR) VALUES (?, ?, ?, ?, ?)";
			 // 2. sql 전송 객체 만들기
			PreparedStatement pstmt = connection.prepareStatement(sql);
			 // 3. sql 전송
			pstmt.setString(1, rec.getId());
			pstmt.setString(2, rec.getPassword());
			pstmt.setString(3, rec.getName());
			pstmt.setString(4, rec.getTel());
			pstmt.setString(5, rec.getAddr());
			
			pstmt.executeQuery(); 
			 // 4. 객체 닫기
			pstmt.close();
			connection.close();
			
		} catch ( Exception ex ){
			throw new MemberException("멤버 입력시 오류  : " + ex.toString() );			
		}			
	}
	
	/**********************************************************
	 * * 회원관리테이블 MEMBERTEST에서 기존의 id값과 중복되는지 확인하는 함수
	 */
	public boolean isDuplicatedId( String id ) throws MemberException
	{
		boolean flag = false;
		
		try{
			Connection connection=DriverManager.getConnection(dbUrl,dbUser,dbPass);	
			// 1. sql 문장 만들기
			String sql = "SELECT * FROM MEMBERTEST WHERE ID=?";
			// 2. sql 전송 객체 만들기
			PreparedStatement ps = connection.prepareStatement(sql);
			// 3. sql 전송
			ps.setString(1, id);
			int result = ps.executeUpdate();

		    if (result > 0) {
		        flag = true;
		    }
		    
		}catch( Exception ex ){
			throw new MemberException("중복아이디 검사시 오류  : " + ex.toString() );			
		}
			
		return flag;
	}
}
