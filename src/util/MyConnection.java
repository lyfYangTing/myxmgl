package util;

import java.sql.Array;
import java.sql.Blob;
import java.sql.CallableStatement;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.NClob;
import java.sql.PreparedStatement;
import java.sql.SQLClientInfoException;
import java.sql.SQLException;
import java.sql.SQLWarning;
import java.sql.SQLXML;
import java.sql.Savepoint;
import java.sql.Statement;
import java.sql.Struct;
import java.util.Map;
import java.util.Properties;

public class MyConnection implements Connection{
	private boolean isConn = false;
	private Connection conn = null;
	private int number;
	public MyConnection(int number){
		this.number = number;
	}
	public int getNumber() {
		return number;
	}
	{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","myxmgl","myxmgl");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public boolean isConn() {
		return isConn;
	}
	public void setConn(boolean isConn) {
		this.isConn = isConn;
	}
	@Override
	public <T> T unwrap(Class<T> iface) throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.unwrap(iface);
	}
	@Override
	public boolean isWrapperFor(Class<?> iface) throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.isWrapperFor(iface);
	}
	@Override
	public Statement createStatement() throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.createStatement();
	}
	@Override
	public PreparedStatement prepareStatement(String sql) throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.prepareStatement(sql);
	}
	@Override
	public CallableStatement prepareCall(String sql) throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.prepareCall(sql);
	}
	@Override
	public String nativeSQL(String sql) throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.nativeSQL(sql);
	}
	@Override
	public void setAutoCommit(boolean autoCommit) throws SQLException {
		// TODO Auto-generated method stub
		this.conn.setAutoCommit(autoCommit);
	}
	@Override
	public boolean getAutoCommit() throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.getAutoCommit();
	}
	@Override
	public void commit() throws SQLException {
		// TODO Auto-generated method stub
		this.conn.commit();
	}
	@Override
	public void rollback() throws SQLException {
		// TODO Auto-generated method stub
		this.conn.rollback();
	}
	@Override
	public void close() throws SQLException {
		System.out.println("我是MyConnection中的close方法，我是释放连接");
		this.isConn = false;
	}
	@Override
	public boolean isClosed() throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.isClosed();
	}
	@Override
	public DatabaseMetaData getMetaData() throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.getMetaData();
	}
	@Override
	public void setReadOnly(boolean readOnly) throws SQLException {
		// TODO Auto-generated method stub
		this.conn.setReadOnly(readOnly);
	}
	@Override
	public boolean isReadOnly() throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.isReadOnly();
	}
	@Override
	public void setCatalog(String catalog) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	@Override
	public String getCatalog() throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.getCatalog();
	}
	@Override
	public void setTransactionIsolation(int level) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	@Override
	public int getTransactionIsolation() throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.getTransactionIsolation();
	}
	@Override
	public SQLWarning getWarnings() throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.getWarnings();
	}
	@Override
	public void clearWarnings() throws SQLException {
		// TODO Auto-generated method stub
		this.conn.clearWarnings();
	}
	@Override
	public Statement createStatement(int resultSetType, int resultSetConcurrency)
			throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.createStatement(resultSetType, resultSetConcurrency);
	}
	@Override
	public PreparedStatement prepareStatement(String sql, int resultSetType,
			int resultSetConcurrency) throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.prepareStatement(sql, resultSetType, resultSetConcurrency);
	}
	@Override
	public CallableStatement prepareCall(String sql, int resultSetType,
			int resultSetConcurrency) throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.prepareCall(sql, resultSetType, resultSetConcurrency);
	}
	@Override
	public Map<String, Class<?>> getTypeMap() throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.getTypeMap();
	}
	@Override
	public void setTypeMap(Map<String, Class<?>> map) throws SQLException {
		// TODO Auto-generated method stub
		this.conn.setTypeMap(map);
	}
	@Override
	public void setHoldability(int holdability) throws SQLException {
		// TODO Auto-generated method stub
		this.conn.setHoldability(holdability);
	}
	@Override
	public int getHoldability() throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.getHoldability();
	}
	@Override
	public Savepoint setSavepoint() throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.setSavepoint();
	}
	@Override
	public Savepoint setSavepoint(String name) throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.setSavepoint(name);
	}
	@Override
	public void rollback(Savepoint savepoint) throws SQLException {
		// TODO Auto-generated method stub
		this.conn.rollback(savepoint);
	}
	@Override
	public void releaseSavepoint(Savepoint savepoint) throws SQLException {
		// TODO Auto-generated method stub
		this.conn.releaseSavepoint(savepoint);
	}
	@Override
	public Statement createStatement(int resultSetType,
			int resultSetConcurrency, int resultSetHoldability)
			throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.createStatement(resultSetType, resultSetConcurrency, resultSetHoldability);
	}
	@Override
	public PreparedStatement prepareStatement(String sql, int resultSetType,
			int resultSetConcurrency, int resultSetHoldability)
			throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.prepareCall(sql, resultSetType, resultSetConcurrency, resultSetHoldability);
	}
	@Override
	public CallableStatement prepareCall(String sql, int resultSetType,
			int resultSetConcurrency, int resultSetHoldability)
			throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.prepareCall(sql, resultSetType, resultSetConcurrency, resultSetHoldability);
	}
	@Override
	public PreparedStatement prepareStatement(String sql, int autoGeneratedKeys)
			throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.prepareStatement(sql, autoGeneratedKeys);
	}
	@Override
	public PreparedStatement prepareStatement(String sql, int[] columnIndexes)
			throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.prepareStatement(sql, columnIndexes);
	}
	@Override
	public PreparedStatement prepareStatement(String sql, String[] columnNames)
			throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.prepareStatement(sql, columnNames);
	}
	@Override
	public Clob createClob() throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.createClob();
	}
	@Override
	public Blob createBlob() throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.createBlob();
	}
	@Override
	public NClob createNClob() throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.createNClob();
	}
	@Override
	public SQLXML createSQLXML() throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.createSQLXML();
	}
	@Override
	public boolean isValid(int timeout) throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.isValid(timeout);
	}
	@Override
	public void setClientInfo(String name, String value)
			throws SQLClientInfoException {
		// TODO Auto-generated method stub
		this.conn.setClientInfo(name, value);
	}
	@Override
	public void setClientInfo(Properties properties)
			throws SQLClientInfoException {
		// TODO Auto-generated method stub
		this.conn.setClientInfo(properties);
	}
	@Override
	public String getClientInfo(String name) throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.getClientInfo(name);
	}
	@Override
	public Properties getClientInfo() throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.getClientInfo();
	}
	@Override
	public Array createArrayOf(String typeName, Object[] elements)
			throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.createArrayOf(typeName,elements);
	}
	@Override
	public Struct createStruct(String typeName, Object[] attributes)
			throws SQLException {
		// TODO Auto-generated method stub
		return this.conn.createStruct(typeName, attributes);
	}
}
