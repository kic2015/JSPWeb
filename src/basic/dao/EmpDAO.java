package basic.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import basic.dto.EmpDTO;

public class EmpDAO {
	//인스턴스 객체 선언
	private static EmpDAO empDAO ;

	//생성자 --얘를 다른데서 못쓰게 만들어줘야하기때문에 private 걸어버리고
	private EmpDAO() {
	}

	//다른 클래스에서 직접 호출할 수 있는 인스턴스--그럼 다른곳에서 쓰고싶을때는 private를 써서 공유시켜주면된다
	public static EmpDAO getInstance() throws ClassNotFoundException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.print("ddd");
		return empDAO;
	}
	
	public void insert(EmpDTO dto) throws Exception{
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="SCOTT";
		String password="TIGER";
		Connection con = DriverManager.getConnection(url, user, password);//db와의 연결통로
		System.out.println("연결성공");
		String sql="INSERT INTO emp(EMPNO,ENAME,DEPTNO,JOB,SAL) VALUES(?,?,?,?,?)";
		//4. 전송객체 얻어오기
		PreparedStatement ps =con.prepareStatement(sql);
		ps.setInt(1, dto.getEmpno());
		ps.setString(2, dto.getEname());
		ps.setInt(3, dto.getDeptno());
		ps.setString(4, dto.getJob());
		ps.setInt(5, dto.getSal());
		
		//5. 전송하기
		ps.executeUpdate();
		//6. 닫기
		ps.close();
		con.close();
	}
	public boolean login(EmpDTO dto) throws Exception{
		boolean login =false;
		//2.연결객체 얻어오기
		String url="jdbc:oracle:thin:@192.168.10.73:1521:xe";
		String user="SCOTT";
		String password="TIGER";
		Connection con = DriverManager.getConnection(url, user, password);
		//3.sql 문장 만들기
		//	사원명: 이름, 사번 :비밀번호

		String sql="SELECT ename,empno FROM EMP where ename=? and empno=?";
		
		//4.sql 전송객체(preparedStatement)
		PreparedStatement ps =con.prepareStatement(sql);
		ps.setString(1, dto.getEname());
		ps.setInt(2, dto.getEmpno());

		//5. 전송하기
		//	--결과가 있다는 login=true;
	
		ResultSet rs =ps.executeQuery();
		
		if(rs.next()) {
			login = true;
		}
		
		
		//6. 닫기
		ps.close();
		con.close();
		return login;
		

	}
}
