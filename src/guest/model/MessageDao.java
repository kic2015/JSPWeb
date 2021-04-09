package guest.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class MessageDao {

	// Single Pattern 
	private static MessageDao instance;
	
	// DB 연결시  관한 변수 
	private static final String 	dbDriver	=	"oracle.jdbc.driver.OracleDriver";
	private static final String		dbUrl		=	"jdbc:oracle:thin:@192.168.10.73:1521:xe";
	private static final String		dbUser		=	"SCOTT";
	private static final String		dbPass		=	"TIGER";
	
	
	
	//--------------------------------------------
	//#####	 객체 생성하는 메소드 
	public static MessageDao	getInstance() throws MessageException
	{
		if( instance == null )
		{
			instance = new MessageDao();
		}
		return instance;
	}
	
	private MessageDao() throws MessageException
	{
	
		try{
			
			/********************************************
				1. 오라클 드라이버를 로딩
					( DBCP 연결하면 삭제할 부분 )
			*/

		}catch( Exception ex ){
			throw new MessageException("방명록 ) DB 연결시 오류  : " + ex.toString() );	
		}
		
	}
	
	
	/*
	 * 메세지를 입력하는 함수
	 */
	public void insert(Message rec) throws MessageException
	{
		Connection	 		con = null;
		PreparedStatement ps = null;
		try{
			String url="jdbc:oracle:thin:@localhost:1521:xe";//오라클 드라이버 url
			String user="SCOTT";		//DB 계정 ID
			String password="TIGER";	//DB 계정 PASSWORD
			
			// 1. 연결객체(Connection) 얻어오기
			con = DriverManager.getConnection(url, user, password); //con 객체에 drivermanager 커넥션을 담는다
			// 2. sql 문장 만들기	
			String sql="INSERT INTO GuestTB(MESSAGE_ID,GUEST_NAME,PASSWORD,MESSAGE) VALUES(seq_guestTb_messageId.NEXTVAL,?,?,?)";
			System.out.println("연결성공");

			// 3. 전송객체 얻어오기
			ps =con.prepareStatement(sql);
			ps.setString(1, rec.getGuestName());//dao의 데이터 셋팅 형태
			ps.setString(2, rec.getPassword());
			ps.setString(3, rec.getMessage());
	
			//4. 전송하기
			ps.executeUpdate();		
				
		}catch( Exception ex ){
			throw new MessageException("방명록 ) DB에 입력시 오류  : " + ex.toString() );	
		} finally{
			//6. 닫기
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}
	
	}
	
	/*
	 * 메세지 목록 전체를 얻어올 때
	 */
	public List<Message> selectList() throws MessageException
	{
		Connection	 		con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Message> mList = new ArrayList<Message>();
		boolean isEmpty = true;
		
		try{
			//1. 연결 객체 얻어오기
			con=DriverManager.getConnection(dbUrl,dbUser,dbPass);
			
			//2 sql문장
			String sql = "select * from GuestTB ORDER BY MESSAGE_ID asc";
			
			//3 전송객체 얻어오기
			ps = con.prepareStatement(sql);
			
			//4 전송
			rs=ps.executeQuery();//쿼리 실행해서 resultset에 담는다 
			
			while(rs.next()) //while문을 통과했다는건 데이터베이스에 값이 존재한다는 뜻
			{
				isEmpty =false;//존재하면 false로 바꿔준다 처음에 true로 선언되어있으니까
				Message m =new Message();//MESSAGE 객체 생성해주고 SET을 통해 각각의 데이터 값 지정 
				m.setMessage_Id(rs.getInt("MESSAGE_ID"));
				m.setGuestName(rs.getString("GUEST_NAME"));
				m.setMessage(rs.getString("MESSAGE"));
				mList.add(m);
			}
						
			if( isEmpty ) return Collections.emptyList();
			
			return mList;
		}catch( Exception ex ){
			throw new MessageException("방명록 ) DB에 목록 검색시 오류  : " + ex.toString() );	
		} finally{
			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}		
	}
	

	/* -------------------------------------------------------
	 * 현재 페이지에 보여울 메세지 목록  얻어올 때
	 */
	public List<Message> selectList(int firstRow, int endRow) throws MessageException
	{
		Connection	 		con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Message> mList = new ArrayList<Message>();
		boolean isEmpty = true;
		
		try{

			if( isEmpty ) return Collections.emptyList();
			
			return mList;
		}catch( Exception ex ){
			throw new MessageException("방명록 ) DB에 목록 검색시 오류  : " + ex.toString() );	
		} finally{
			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}		
	}
	
	
	
	/* -------------------------------------------------------
	 * 메세지 전체 레코드 수를 검색
	 */
	
	public int getTotalCount() throws MessageException{
		Connection	 		con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int count = 0;

		try{

			return  count;
			
		}catch( Exception ex ){
			throw new MessageException("방명록 ) DB에 목록 검색시 오류  : " + ex.toString() );	
		} finally{
			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}			
	}
	
	/*
	 * 메세지 번호와 비밀번호에 의해 메세지 삭제
	 */
	public int delete( int messageId, String password ) throws MessageException
	{
		int result = 0;
		Connection	 		con = null;
		PreparedStatement ps = null;
		try{
			//1.연결 객체 얻어오기
			con=DriverManager.getConnection(dbUrl,dbUser,dbPass);
			
			//2 sql문장
			String sql = "delete from GuestTB where MESSAGE_ID=? and PASSWORD=?";
			
			//3 전송객체 얻어오기
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, messageId);//dto가 없을때 :일반적인 데이터 셋팅(직접 매개변수를 넣어준다)
			ps.setString(2, password);

			//4. 전송하기
			result = ps.executeUpdate();		
			 
			return result;
		}catch( Exception ex ){
			throw new MessageException("방명록 ) DB에 삭제시 오류  : " + ex.toString() );	
		} finally{
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}		
	}
}
