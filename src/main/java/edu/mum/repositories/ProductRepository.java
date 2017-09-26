//package edu.mum.repositories;
//
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.List;
//import java.util.function.Function;
//
//import edu.mum.models.Product;
//
//public class ProductRepository extends BaseRepository<Product> {
//	private Function<ResultSet, Product> createProduct = (ResultSet rs) -> {
//		Product p = null;
//		try {
//			p = new Product();
//			p.setId(rs.getInt("id"));
//			p.setName(rs.getString("name"));
//			p.setDescription(rs.getString("description"));
//			p.setImagePath(rs.getString("imagePath"));
//			p.setCurrentPrice(rs.getDouble("currentPrice"));
//			p.setUnitsInStock(rs.getInt("unitsInStock"));
//			p.setDiscontinued(rs.getBoolean("discontinued"));
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return p;
//	};
//
//	public List<Product> getProducts(String keyword) {
//		String sql = "SELECT * FROM Product";
//		if (keyword == null || keyword.isEmpty()) {
//			sql += " ORDER BY name";
//			return super.getList(sql, createProduct);
//		} else {
//			sql += " WHERE name LIKE ? ORDER BY name";
//			return super.getList(sql, createProduct, "%" + keyword + "%");
//		}
//	}
//
//	public Product getProduct(int id) {
//		String sql = "SELECT * FROM Product WHERE id=?";
//		return super.get(sql, createProduct, String.valueOf(id));
//	}
//
//	public List<Product> searchProducts(String keyword) {
//		String sql = "SELECT * FROM Product";
//		if (keyword == null || keyword.isEmpty()) {
//			sql += " WHERE discontinued = 0 ORDER BY name";
//			return super.getList(sql, createProduct);
//		} else {
//			sql += " WHERE discontinued = 0 AND name LIKE ? ORDER BY name";
//			return super.getList(sql, createProduct, "%" + keyword + "%");
//		}
//	}
//
//	public int insertProduct(Product product) {
//		String sql = "INSERT INTO Product(name, description, imagePath, unitsInStock, currentPrice, discontinued) VALUES (?,?,?,?,?,?)";
//		return super.insert(sql, product.getName(), product.getDescription(), "no-image.gif", String.valueOf(product.getUnitsInStock()), String.valueOf(product.getCurrentPrice()), String.valueOf(product.isDiscontinued() ? 1 : 0));
//	}
//
//	public boolean updateProduct(Product product) {
//		String sql = "UPDATE Product SET name=?, description=?, unitsInStock=?, currentPrice=?, discontinued=? WHERE id=?";
//		return super.save(sql, product.getName(), product.getDescription(), String.valueOf(product.getUnitsInStock()), String.valueOf(product.getCurrentPrice()), String.valueOf(product.isDiscontinued() ? 1 : 0),
//				String.valueOf(product.getId()));
//	}
//
//	public boolean updateProductInventory(Product product) {
//		String sql = "UPDATE Product SET name=?, description=?, unitsInStock=unitsInStock+?, currentPrice=?, discontinued=? WHERE id=?";
//		return super.save(sql, product.getName(), product.getDescription(), String.valueOf(product.getUnitsToChange()), String.valueOf(product.getCurrentPrice()), String.valueOf(product.isDiscontinued() ? 1 : 0),
//				String.valueOf(product.getId()));
//	}
//
//	public boolean deleteProduct(int id) {
//		String sql = "DELETE FROM Product WHERE id=?";
//		return super.save(sql, String.valueOf(id));
//	}
//}
