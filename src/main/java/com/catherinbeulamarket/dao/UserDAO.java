package com.catherinbeulamarket.dao;

import com.catherinbeulamarket.model.User;

public interface UserDAO {

    boolean registerUser(User user);

    User loginUser(String email, String password);
}