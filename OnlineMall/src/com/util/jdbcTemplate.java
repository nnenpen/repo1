package com.util;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class jdbcTemplate {

	/**
	 * dml操作模板
	 * @param sql        sql模板，带有占位符
	 * @param params     sql中？对应参数值
	 * @return           受影响行数
	 */
	public static int update(String sql,Object...params) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn=DBUtil.getConnection();
			ps=conn.prepareStatement(sql);
			
			for(int index=0;index<params.length;index++) {
				ps.setObject(index+1, params[index]);
			}
			return ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.closeConn(conn);
		}		
		return 0;
	}
}
