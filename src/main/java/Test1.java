import java.sql.*;

public class Test1 {
	public static void main(String args[]) {

		// 加载JdBC驱动
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("load Driver successfully");
		} catch (Exception e) {
			System.out.println("load  Driver error");
			e.printStackTrace();
		}

		// 连接数据库
		try {
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_hhxy_s", "root",
					"123456");
			System.out.println("connect sql successfully");
		} catch (Exception e) {
			System.out.println("connect sql erro");
			e.printStackTrace();
		}

	}
}