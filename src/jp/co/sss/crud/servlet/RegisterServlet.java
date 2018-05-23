package jp.co.sss.crud.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.co.sss.crud.bean.Employee;
import jp.co.sss.crud.util.EmployeeDAO;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// フォワード
		String forward = null;

		// リクエストパラメータからactionを取得
		String action = request.getParameter("action");

		// 登録画面のリクエスト時
		if (action == null) {
			// 登録入力ページに遷移
			forward = "/WEB-INF/view/register_input.jsp";
		// 確認画面から登録実行のリクエスト時
		} else if (action.equals("done")) {

			// 登録ユーザ取得
			HttpSession session = request.getSession();
			Employee registerEmployee = (Employee) session.getAttribute("registerEmployee");

			// 登録
			EmployeeDAO dao = new EmployeeDAO();
			dao.insert(registerEmployee);

			// 登録ユーザ情報削除
			session.removeAttribute("registerEmployee");

			// 登録完了ページに遷移
			forward = "/WEB-INF/view/register_complete.jsp";
		}

		// フォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher(forward);
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//request.setCharacterEncoding("Shift_JIS");
		request.setCharacterEncoding("Windows-31J");

		// リクエストパラメータ取得
		String empPass = (String) request.getParameter("empPass");
		String empName = (String) request.getParameter("empName");
		String gender = (String) request.getParameter("gender");
		String address = (String) request.getParameter("address");
		String birthday = (String) request.getParameter("birthday");
		String authority = (String) request.getParameter("authority");
		String deptId = (String) request.getParameter("deptId");

		// 登録ユーザ情報
		Employee registerEmployee = new Employee();
		try {
			registerEmployee.setEmp_pass(empPass);
			registerEmployee.setEmp_name(empName);
			registerEmployee.setGender(Integer.parseInt(gender));
			registerEmployee.setAddress(address);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			registerEmployee.setBirthday(sdf.parse(birthday));
			registerEmployee.setAuthority(Integer.parseInt(authority));
			registerEmployee.setDept_id(Integer.parseInt(deptId));
		} catch (ParseException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		// セッションスコープにセット
		HttpSession session = request.getSession();
		session.setAttribute("registerEmployee", registerEmployee);

		// フォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/register_check.jsp");
		dispatcher.forward(request, response);
		//doGet(request, response);
	}

}
