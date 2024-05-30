package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import metier.SingletonConnection;
import metier.Produit;

public class ProduitDaoImpl implements IProduitDao {

	@Override
	public Produit save(Produit p) {

		try {
			Connection conn = SingletonConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement("INSERT INTO produits(NOM_PRODUIT,PRIX) VALUES(?,?)");
			ps.setString(1, p.getNomProduit());
			ps.setDouble(2, p.getPrix());
			ps.executeUpdate();

			PreparedStatement ps2 = conn.prepareStatement("SELECT MAX(ID_PRODUIT) as MAX_ID FROM produits");
			ResultSet rs = ps2.executeQuery();
			if (rs.next()) {
				p.setIdProduit(rs.getLong("MAX_ID"));
			}
			 ps.close();
			 ps2.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return p;
	}

	@Override
	public List<Produit> produitsParMC(String mc) {
		List<Produit> prods = new ArrayList<Produit>();
		try {
			Connection conn = SingletonConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM produits WHERE NOM_PRODUIT LIKE ?");
			ps.setString(1, "%" + mc + "%");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Produit p = new Produit();
				p.setIdProduit(rs.getLong("ID_PRODUIT"));
				p.setNomProduit(rs.getString("NOM_PRODUIT"));
				p.setPrix(rs.getDouble("PRIX"));
				prods.add(p);
			}
			ps.close();
			 rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return prods;
	}

	@Override
	public Produit getProduit(Long id) {
		Produit produit = null;

		try {
			Connection conn = SingletonConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM produits WHERE ID_PRODUIT = ?");
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				produit = new Produit();
				produit.setIdProduit(rs.getLong("ID_PRODUIT"));
				produit.setNomProduit(rs.getString("NOM_PRODUIT"));
				produit.setPrix(rs.getDouble("PRIX"));
			}
			 ps.close();
			 rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return produit;
	}

	@Override
	public Produit updateProduit(Produit p) {

		try {
			Connection conn = SingletonConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement("UPDATE produits SET NOM_PRODUIT=? , PRIX=? WHERE ID_PRODUIT=?");
			ps.setString(1, p.getNomProduit());
			ps.setDouble(2, p.getPrix());
			ps.setLong(3, p.getIdProduit());
			ps.executeUpdate();
		 ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return p;
	}

	@Override
	public void deleteProduit(Long id) {
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement("DELETE FROM produits WHERE ID_PRODUIT=?");
			ps.setLong(1, id);
			ps.executeUpdate();
			 ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Produit> getAllProduits(){
	    List<Produit> produits = new ArrayList<>();
	    try (Connection conn = SingletonConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement("SELECT * FROM produits");
	         ResultSet rs = ps.executeQuery()) {
	        while (rs.next()) {
	            Produit produit = new Produit();
	            produit.setIdProduit(rs.getLong("ID_PRODUIT"));
	            produit.setNomProduit(rs.getString("NOM_PRODUIT"));
	            produit.setPrix(rs.getDouble("PRIX"));
	            produits.add(produit);
	        }
	    } catch (SQLException e) {
	        e.getMessage();
	    }
	    return produits;
	}


}
