package jp.co.sss.crud.servlet;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.sss.crud.bean.Employee;
import jp.co.sss.crud.util.EmployeeDAO;
/**
 * Servlet implementation class EmployeeServlet
 */
@WebServlet("/EmployeeServlet")
public class EmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

//	private Connection _connection;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// フォワード
		String forward = "/WEB-INF/view/login.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(forward);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		System.out.println("call doPost");

		// ログイン
		String view = doLogin(request, response);

		// フォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);

		// doGet(request, response);
	}

	/*
	 * ログイン処理
	 */
	private String doLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("doLogin");

		// ユーザ・パスワード入力値取得
		String empId = (String) request.getParameter("empId");
		String empPass = (String) request.getParameter("empPass");
		System.out.println("empId:" + empId + " empPass:" + empPass);

		// 社員ID未入力チェック
		if (empId == null || "".equals(empId)){
			// エラー処理
			System.out.println("社員IDを入力してください。");
		}

		// ログインユーザ取得
		EmployeeDAO dao = new EmployeeDAO();
		List<Employee> list = dao.find(empId, empPass);
		request.setAttribute("list", list);

		// リスト0件ならログイン失敗
		if (list.size() == 0) {
			return "WEB-INF/view/list/error.jsp";
		}
		// ログインユーザ情報取得
		Employee loginUser = null;
		Iterator<Employee> it = list.iterator();
		while(it.hasNext()) {
			loginUser = (Employee) it.next();
		}
		request.getSession().setAttribute("loginUser", loginUser);
		return "/ListServlet";

		/*
		// ユーザ情報取得
		int loginId = getEmpId(empId, empPass);
		if (loginId == 0) {
			return "WEB-INF/view/list/error.jsp";
		}
		// ログインIDをセッション情報に取得
		request.getSession().setAttribute("loginId", loginId);
*/

		// 一覧画面を返す
		// return "WEB-INF/view/list.jsp";
	}
/*
	private int getEmpId(String empId, String empPass) throws SQLException{
		Statement statement = null;

		System.out.println("getEmpId");

		try {
			// 接続オブジェクト
			statement = DBManager.getConnection().createStatement();
			// SQL実行
			String sql = "SELECT emp_id FROM employee WHERE emp_id="
					+ empId + " AND emp_pass='" + empPass + "'";
			ResultSet rs = statement.executeQuery(sql);

			// ログイン情報取得
			int loginId = 0;
			while (rs.next()) {
				loginId = rs.getInt("emp_id");
				System.out.println(loginId);
			}

			return loginId;

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			if (statement != null) {
				statement.close();
				statement = null;
			}
		}
	}
*/
/*
	private String doError(HttpServletRequest request, HttpServletResponse response,
							String message) throws ServerException, IOException {
		request.setAttribute("messege", message);

		return "WEB-INF/view/error.jsp";
	}
*/
}
