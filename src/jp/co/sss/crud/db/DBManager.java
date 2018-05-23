package jp.co.sss.crud.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DBManager {

//	private Connection con;

	/*
	 *  DB接続オブジェクト生成
	 */
	public static Connection getConnection() throws SQLException {

		System.out.println("getConnection");

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// OracleDBに接続
			Connection con = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:training", "servlet_training_user", "systemsss");
			return con;
		} catch (ClassNotFoundException e) {
			throw new IllegalStateException(e);
		}
	}

	/*
	 * 更新SQL発行
	 */
	public static int simpleUpdate(String sql) throws SecurityException, SQLException {
		Connection con = null;
		Statement smt = null;
		try {
			con = DBManager.getConnection();
			smt = con.createStatement();
			return smt.executeUpdate(sql);
		} catch (Exception e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
			throw new SQLException(e);
		} finally {
			if (smt != null) {
				try { smt.close(); } catch (SQLException ignore) {}
			}
			if (con != null) {
				try { con.close(); } catch (SQLException ignore) {}
			}
		}
	}

	/*
	 * 検索用SQL発行
	 */
	public static <T> List<T> simpleFind(String sql,
			ResultSetBeanMapping<T> mapping) throws SQLException {

		Connection con = null;
		Statement smt = null;

		try {
			con = DBManager.getConnection();
			smt = con.createStatement();
			ResultSet rs = smt.executeQuery(sql);

			List<T> list = new ArrayList<T>();

			while(rs.next()) {
				T bean = mapping.createFromResultSet(rs);
				list.add(bean);
			}

			return list;

		} catch (Exception e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
			throw new SQLException(e);
		} finally {
			if (smt != null) {
				try { smt.close(); } catch (SQLException ignore) {}
			}
			if (con != null) {
				try { con.close(); } catch (SQLException ignore) {}
			}
		}
	}
}

