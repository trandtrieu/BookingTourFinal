/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.DbCon;
import context.DBContext;
import static dao.AccountDAO.conn;
import static dao.AccountDAO.ps;
import static dao.AccountDAO.rs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.AccountDTO;
import model.Role;
import model.Tour;

/**
 *
 * @author DELL
 */
public class RoleDao {

    private Connection con;

    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public RoleDao(Connection con) {
        this.con = con;
    }

    public RoleDao() {
    }

    public ArrayList<Role> getListRoles() {
        try {
            String query = "select * from role";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            ArrayList<Role> list = new ArrayList<>();
            while (rs.next()) {
                Role role = new Role(rs.getInt(1), rs.getString(2));
                list.add(role);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<AccountDTO> getListUserByRole(int role) {
        List<AccountDTO> list = new ArrayList<>();
        query = "select * from account where role = ?";

        try {
            this.con = DbCon.getConnection();

            pst = this.con.prepareStatement(query);
            pst.setInt(1, role);
            rs = pst.executeQuery();
            while (rs.next()) {
                AccountDTO account = new AccountDTO();
                account.setId(rs.getInt("u_id"));
                account.setUsername(rs.getString("username"));
                account.setPassword(rs.getString("password"));
                account.setEmail(rs.getString("email"));
                account.setPhone(rs.getString("phone"));
                account.setAvatar(rs.getString("avatar"));
                account.setRole(rs.getInt("role"));
                list.add(account);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

}
