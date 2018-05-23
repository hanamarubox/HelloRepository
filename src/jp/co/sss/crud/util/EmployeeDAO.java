package jp.co.sss.crud.util;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;

import jp.co.sss.crud.bean.Employee;
import jp.co.sss.crud.db.DBManager;
import jp.co.sss.crud.db.EmployeeMapping;

public class EmployeeDAO {

	/*
	 * 全件検索
	 */
	public List<Employee> findAll() {

		String sql = "SELECT * FROM employee e"
					+ " inner join department d on e.dept_id = d.dept_id";
		try {
			return DBManager.simpleFind(sql, new EmployeeMapping());
		} catch (SQLException e) {
			throw new IllegalStateException(e);
		}
	}

	/*
	 * 検索(ユーザ、パスワード)
	 */
	public List<Employee> find(String empId, String empPass) {

		String sql = "SELECT * FROM employee e"
					+ " inner join department d on e.dept_id = d.dept_id"
					+ " where e.emp_id=" + empId
					+ " and e.emp_pass='" + empPass
					+ "'"
					;
		try {
			return DBManager.simpleFind(sql, new EmployeeMapping());
		} catch (SQLException e) {
			throw new IllegalStateException(e);
		}
	}

	/*
	 * 引数のEmployeeオブジェクトをもとにINSERTを行う
	 */
	public int insert(Employee employee) {

		String birthday = new SimpleDateFormat("yyyy/MM/dd").format( employee.getBirthday() );

		String sql = "INSERT INTO employee"
				+	 "(emp_id, emp_pass, emp_name, gender, address, birthday, authority, dept_id)"
				+	 " VALUES("
				+	 "seq_emp.nextval"
				+	 ",'" + employee.getEmp_pass() + "'"
				+	 ",'" + employee.getEmp_name() + "'"
				+	 "," + employee.getGender()
				+	 ",'" + employee.getAddress() + "'"
				+	 ",TO_DATE('" + birthday + "', 'YYYY/MM/DD')"
				+	 "," + employee.getAuthority()
				+	 "," + employee.getDept_id()
				+	 ")"
				;
		try {
			return DBManager.simpleUpdate(sql);
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
			throw new IllegalStateException(e);
		}

	}

	/*
	String sql = "INSERT INTO employee("
			+	 "emp_id, emp_pass, emp_name, gender, address, birthday, authority, dept_id"
			+	 ")VALUES("
			+ 	 "seq_emp.nextval, ?, ? ,? ,? ,? ,? ,?)"
			;

*/


}
