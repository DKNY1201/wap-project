package edu.mum.repositories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;

import edu.mum.utils.DBConnectionManager;

public class BaseRepository<T> {
	private static String databaseUrl;
	private static String databaseUser;
	private static String databasePassword;
	private static DBConnectionManager connectionManager;

	protected static String getDatabaseUrl() {
		return databaseUrl;
	}

	protected static String getDatabaseUser() {
		return databaseUser;
	}

	protected static String getDatabasePassword() {
		return databasePassword;
	}

	protected DBConnectionManager getConnectionManager() {
		return connectionManager;
	}

	public static Connection SetConnection(String dbUrl, String dbUser, String dbPassword) {
		Connection connection = null;
		try {
			databaseUrl = dbUrl;
			databaseUser = dbUser;
			databasePassword = dbPassword;
			connectionManager = new DBConnectionManager(databaseUrl, databaseUser, databasePassword);
			connection = connectionManager.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}

	protected boolean save(String sql, String... parameters) {
		boolean isSuccess = false;
		try {
			Connection connection = connectionManager.getConnection();
			PreparedStatement statement = connection.prepareStatement(sql);
			if (parameters != null) {
				for (int i = 0; i < parameters.length; i++) {
					try {
						statement.setString(i + 1, parameters[i]);
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}

			isSuccess = statement.executeUpdate() > 0;
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	protected int insert(String sql, int intParameter, String... parameters) {
		int id = 0;
		try {
			Connection connection = connectionManager.getConnection();
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, intParameter);
			if (parameters != null) {
				for (int i = 0; i < parameters.length; i++) {
					try {
						statement.setString(i + 2, parameters[i]);
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
			if (statement.executeUpdate() > 0) {
				ResultSet resultSet = statement.getGeneratedKeys();
				if (resultSet.next()) {
					id = resultSet.getInt(1);
					resultSet.close();
				}
			}
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;		
	}

	protected int insert(String sql, String... parameters) {
		int id = 0;
		try {
			Connection connection = connectionManager.getConnection();
			PreparedStatement statement = connection.prepareStatement(sql);
			if (parameters != null) {
				for (int i = 0; i < parameters.length; i++) {
					try {
						statement.setString(i + 1, parameters[i]);
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
			if (statement.executeUpdate() > 0) {
				ResultSet resultSet = statement.getGeneratedKeys();
				if (resultSet.next()) {
					id = resultSet.getInt(1);
					resultSet.close();
				}
			}
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}

	protected T get(String sql, Function<ResultSet, T> selector, String... parameters) {
		try {
			T item = null;
			Connection connection = connectionManager.getConnection();
			PreparedStatement statement = connection.prepareStatement(sql);
			if (parameters != null) {
				for (int i = 0; i < parameters.length; i++) {
					try {
						statement.setString(i + 1, parameters[i]);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			ResultSet resultSet = statement.executeQuery();
			if (resultSet.next()) {
				item = selector.apply(resultSet);
			}
			resultSet.close();
			statement.close();
			return item;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	protected List<T> getList(String sql, Function<ResultSet, T> selector, String... parameters) {
		try {
			ArrayList<T> list = new ArrayList<T>();
			Connection connection = connectionManager.getConnection();
			PreparedStatement statement = connection.prepareStatement(sql);
			if (parameters != null) {
				for (int i = 0; i < parameters.length; i++) {
					try {
						statement.setString(i + 1, parameters[i]);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				T item = selector.apply(resultSet);
				list.add(item);
			}
			resultSet.close();
			statement.close();
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	protected List<T> getList(String sql, Function<ResultSet, T> selector, int userId, String... parameters) {
		try {
			ArrayList<T> list = new ArrayList<T>();
			Connection connection = connectionManager.getConnection();
			PreparedStatement statement = connection.prepareStatement(sql);

			statement.setInt(1, userId);

			if (parameters != null) {
				for (int i = 0; i < parameters.length; i++) {
					try {
						statement.setString(i + 2, parameters[i]);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				T item = selector.apply(resultSet);
				list.add(item);
			}
			resultSet.close();
			statement.close();
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}