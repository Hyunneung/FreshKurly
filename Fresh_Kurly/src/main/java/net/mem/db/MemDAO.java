package net.mem.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemDAO {
	private DataSource ds;

	// �����ڿ��� JNDI ���ҽ��� �����Ͽ� Connection ��ü ��´�
	public MemDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			System.out.println("DB ���� ����");
		} catch (Exception ex) {
			System.out.println("DB ���� ���� : " + ex);
		}
	}
	
	
	// �α��� - id, pass �´��� Ȯ��
	public int isId(String id, String pass) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1; // DB�� �ش� id�� �����ϴ�.

		try {
			con = ds.getConnection();

			String sql = "select member_id, member_pass from member where member_id = ?";
			pstmt = con.prepareStatement(sql); // PreparedStatement ��ü ���
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// ����ڰ� �Է��� ��й�ȣ�� DB ��й�ȣ ��
				if (rs.getString(2).equals(pass)) { // id, pass ��ġ�ϴ� ���
					result = 1;
				} else { // // id, pass ��ġ���� �ʴ� ���
					result = 0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
		} // finally ��
		return result; // id, pass ��ġ�ϴ� ��� 1, �ƴ� ��� 0 (DB�� �ش� id�� ���� ��� -1)
	} // isId(id,pass) end
	
	
	
	// ȸ������ - ID �ߺ� �˻�DB�� id �ִ��� ������ Ȯ��
	public int overlapId(String id){
		// DB �۾��� �ʿ��� �������̽����� ���۷��� ���� ����
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0; // DB�� �ش� id�� �����ϴ�.
		
		try {
			con = ds.getConnection();
			
			String sql = "select member_id from member where member_id = ?";
			pstmt = con.prepareStatement(sql);  // PreparedStatement ��ü ���
			pstmt.setString(1, id);
			rs = pstmt.executeQuery(); 
			
			if (rs.next()) {
				result = 1; // DB�� �ش� id�� �ֽ��ϴ�.
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch(SQLException ex) {
					ex.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch(SQLException e) {
					System.out.println(e.getMessage());
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch(Exception e) {
					System.out.println(e.getMessage());
				}
			}
		} // finally ��
		return result; // DB�� ID ������ 1, ������ 0
	} // overlapId(id) end

	
	// ȸ������ - �޴�����ȣ �ߺ� �˻� - DB�� �ߺ��� �޴�����ȣ �ִ��� ������ Ȯ��
	public int overlapPhone(String phone){
		// DB �۾��� �ʿ��� �������̽����� ���۷��� ���� ����
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0; // DB�� �ش� �޴�����ȣ�� �����ϴ�.
		
		try {
			con = ds.getConnection();
			
			String sql = "select member_phone from member where member_phone = ?";
			pstmt = con.prepareStatement(sql);  // PreparedStatement ��ü ���
			pstmt.setString(1, phone);
			rs = pstmt.executeQuery(); 
			
			if (rs.next()) {
				result = 1; // DB�� �ش� �޴�����ȣ�� �ֽ��ϴ�.
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch(SQLException ex) {
					ex.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch(SQLException e) {
					System.out.println(e.getMessage());
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch(Exception e) {
					System.out.println(e.getMessage());
				}
			}
		} // finally ��
		return result; // DB��  �޴�����ȣ ������ 1, ������ 0
	} // overlapPhone(phone) end
	
	
	// ȸ������ - DB�� ��� �߰�
	public int insert(Mem m){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0; 
		
		try {
			con = ds.getConnection();
			
			String sql = "insert into member "
					   + "(member_id, member_pass, member_name, member_email, member_phone, "
					   + " member_post, member_address, member_gender, member_jumin) "
					   + "values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);  // PreparedStatement ��ü ���
			pstmt.setString(1, m.getMember_id());
			pstmt.setString(2, m.getMember_pass());
			pstmt.setString(3, m.getMember_name());
			pstmt.setString(4, m.getMember_email());
			pstmt.setString(5, m.getMember_phone());
			pstmt.setString(6, m.getMember_post());
			pstmt.setString(7, m.getMember_address());
			pstmt.setString(8, m.getMember_gender());
			pstmt.setString(9, m.getMember_jumin());
			
			result = pstmt.executeUpdate(); // ȸ������(����) �����ϸ� 1, �����ϸ� 0
			
		  // Primary key �������� �������� ��� �߻��ϴ� ����	
		} catch(java.sql.SQLIntegrityConstraintViolationException e) {
			result = -1;
			System.out.println("��� ���̵� �ߺ� �����Դϴ�.");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch(SQLException ex) {
					ex.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch(SQLException e) {
					System.out.println(e.getMessage());
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch(Exception e) {
					System.out.println(e.getMessage());
				}
			}
		} // finally ��
		return result; // ���� �����ϸ� 1, �����ϸ� 0
	} // insert() end
	public int insert(String id, String name, String email){ // �Ҽ� ȸ������
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0; 
		
		try {
			con = ds.getConnection();
			
			String sql = "insert into member "
					   + "(member_id, member_name, member_email) "
					   + "values(?, ?, ?) ";
			
			pstmt = con.prepareStatement(sql);  // PreparedStatement ��ü ���
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			result = pstmt.executeUpdate(); // ���� �����ϸ� 1, �����ϸ� 0
			
		  // Primary key �������� �������� ��� �߻��ϴ� ����	
		} catch(java.sql.SQLIntegrityConstraintViolationException e) {
			result = -1;
			System.out.println("��� ���̵� �ߺ��Ǿ� ������������ �̵��մϴ�. - �Ҽȷα��� �����");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch(SQLException ex) {
					ex.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch(SQLException e) {
					System.out.println(e.getMessage());
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch(Exception e) {
					System.out.println(e.getMessage());
				}
			}
		} // finally ��
		return result; // ���� �����ϸ� 1, �����ϸ� 0
	} // insert(id, name, email) end


	//isEmail start
	public int isEmail(String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result =0;

		try {
			con = ds.getConnection();

			String sql = "select member_id from member where member_email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
		} // finally end
		return result;
	} //isEmail() end 
}
