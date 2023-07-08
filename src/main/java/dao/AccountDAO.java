/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.AccountDTO;

/**
 *
 * @author linh2
 */
public class AccountDAO {

    static Connection conn;
    static PreparedStatement ps;
    static ResultSet rs;
    private Connection con;

    private String query;
    private PreparedStatement pst;

    public AccountDAO(Connection con) {
        this.con = con;
    }

    public AccountDAO() {
    }

    public ArrayList<AccountDTO> getListAccounts() {
        try {
            String query = "select * from account";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            ArrayList<AccountDTO> list = new ArrayList<>();
            while (rs.next()) {
                AccountDTO a = new AccountDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7));
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public AccountDTO login(String username, String password) {
        AccountDTO acc = null;
        try {
            String query = " select * from account \n"
                    + "where username =? and password =?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);

            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                acc = new AccountDTO();
                acc.setId(rs.getInt("u_id"));
                acc.setUsername(rs.getString("username"));
                acc.setPassword(rs.getString("password"));
                acc.setRole(rs.getInt("role"));
                acc.setAvatar(rs.getString("avatar"));
                return acc;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static AccountDTO checkAccountExist(String username) {
        try {
            String query = "select * from account \n"
                    + "where username = ?;";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new AccountDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7));
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public static AccountDTO checkAccountExistt(String username) {
        try {
            String query = "select * from account \n"
                    + "where username = ?;";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new AccountDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7));
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public void register(String username, String pass, String email, String phone) {
        try {
            String query = "insert into account\n"
                    + "values(?,?,?,?,0, NULL)";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, pass);
            ps.setString(3, email);
            ps.setString(4, phone);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteAccount(String id) {

        try {
            String query = "delete from account\n"
                    + "where u_id=?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);    
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertAccount(String username, String password, String email, String phone, String role, String avatar) {
        String query = "insert into account\n"
                + "values(?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setString(4, phone);
            ps.setString(5, role);
            ps.setString(6, avatar);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public AccountDTO getAccountByID(String id) {
        String query = "select * from account\n"
                + "where u_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new AccountDTO(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void updateAccount(String id, String username, String password, String email, String phone, String role, String avatar) {
        String query = "update account\n"
                + "set username = ?,\n"
                + "password = ?,\n"
                + "email = ?,\n"
                + "phone = ?,\n"
                + "role = ?,\n"
                + "avatar = ?\n"
                + "where u_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setString(4, phone);
            ps.setString(5, role);
            ps.setString(6, avatar);
            ps.setString(7, id);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }



}
