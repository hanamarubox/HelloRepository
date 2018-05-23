package jp.co.sss.crud.db;

import java.sql.ResultSet;
import java.sql.SQLException;

import jp.co.sss.crud.bean.Employee;

public class EmployeeMapping implements ResultSetBeanMapping<Employee> {

	@Override
	public Employee createFromResultSet(ResultSet rs) throws SQLException {

		Employee employee = new Employee();
		employee.setEmp_id(rs.getInt("emp_id"));
		employee.setEmp_pass(rs.getString("emp_pass"));
		employee.setEmp_name(rs.getString("emp_name"));
		employee.setGender(rs.getInt("gender"));
		employee.setAddress(rs.getString("address"));
		employee.setBirthday(rs.getDate("birthday"));
		employee.setAuthority(rs.getInt("authority"));
		employee.setDept_id(rs.getInt("dept_id"));
		employee.setDept_name(rs.getString("dept_name"));

		return employee;
	}
}
