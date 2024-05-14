package br.com.qualiset.dao;

import br.com.qualiset.model.User;
import br.com.qualiset.config.ConnectionPoolConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;



import java.sql.DriverManager;
import java.sql.ResultSet;


public class UserDAO {

    public void cadastro(User user) {

        String SQL = "INSERT INTO USERS (USERNAME, PASSWORD) VALUES (?,?)";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.execute();

            System.out.println("success in insert User");

            connection.close();

        } catch (Exception e) {

            System.out.println("fail in database connection");

        }

    }
    public boolean verifyCredentials(User user) {

        String SQL = "SELECT * FROM USERS WHERE USERNAME = ?";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, user.getUsername());
            ResultSet resultSet = preparedStatement.executeQuery();

            System.out.println("success in select username");

            while (resultSet.next()) {

                String password = resultSet.getString("password");

                if (password.equals(user.getPassword())) {

                    return true;

                }

            }

            connection.close();

            return false;

        } catch (Exception e) {

            System.out.println("Error: " + e.getMessage());

            return false;

        }

    }

}

