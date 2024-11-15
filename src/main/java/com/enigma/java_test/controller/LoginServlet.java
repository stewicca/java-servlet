package com.enigma.java_test.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "loginServlet", value = "/login-servlet")
public class LoginServlet extends HttpServlet {
    private String hashPassword(String password) {
        int hash = 0;

        for (int i = 0; i < password.length(); i++) {
            hash += password.charAt(i);
        }

        return Integer.toHexString(hash);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String hardCodedUsername = "steven.w";
        String hardCodedPassword = hashPassword("V3ryS3cur3");

        String username = req.getParameter("username");
        String password = hashPassword(req.getParameter("password"));

        if (hardCodedUsername.equals(username) && hardCodedPassword.equals(password)) {
            req.getSession().setAttribute("username", username);
            res.sendRedirect("index.jsp");
        } else {
            res.sendRedirect("login.jsp?error=Invalid%20credentials");
        }
    }
}
