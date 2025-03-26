package com.example;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class SignUpServlet extends HttpServlet {

    private static final String MYSQL_URL = "jdbc:mysql://localhost:3306/porfolio";
    private static final String MYSQL_USER = "root";
    private static final String MYSQL_PASSWORD = "root";

    private static final String MONGO_URI = "mongodb://localhost:27017";
    private static final String MONGO_DB = "userdb";
    private static final String MONGO_COLLECTION = "users";

    private static final String JSON_FILE_PATH = "C:\\Users\\admin\\Documents\\NetBeansProjects\\MyPortfolio\\users.json";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String email = request.getParameter("email");
        String contact = request.getParameter("contact");
        String location = request.getParameter("location");
        String address = request.getParameter("address");

        // Handle file upload
        Part filePart = request.getPart("file");
        String fileName = filePart.getSubmittedFileName();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();
        filePart.write(uploadPath + File.separator + fileName);

        // Save to MySQL
        saveToMySQL(username, password, email, contact, location, address, fileName);

//        // Save to MongoDB
//        saveToMongoDB(username, password, email, contact, location, address, fileName);

        // Save to JSON
        saveToJSON(username, password, email, contact, location, address, fileName);

        response.getWriter().write("User registered successfully!");
    }

    private void saveToMySQL(String username, String password, String email, String contact, String location, String address, String image) {
        try (Connection conn = DriverManager.getConnection(MYSQL_URL, MYSQL_USER, MYSQL_PASSWORD)) {
            String sql = "INSERT INTO users (username, password, email, contact, location, address, image) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, email);
            statement.setString(4, contact);
            statement.setString(5, location);
            statement.setString(6, address);
            statement.setString(7, image);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//    private void saveToMongoDB(String username, String password, String email, String contact, String location, String address, String image) {
//    try (MongoClient mongoClient = MongoClients.create(MONGO_URI)) {
//        MongoDatabase database = mongoClient.getDatabase(MONGO_DB);
//        MongoCollection<Document> collection = database.getCollection(MONGO_COLLECTION);
//
//        Document user = new Document("username", username)
//                .append("password", password)
//                .append("email", email)
//                .append("contact", contact)
//                .append("location", location)
//                .append("address", address)
//                .append("image", image);
//
//        // Using insertMany to insert a single document
//        collection.insertMany(Arrays.asList(user));
//    } catch (Exception e) {
//        e.printStackTrace();
//    }
//}
    private void saveToJSON(String username, String password, String email, String contact, String location, String address, String image) {
        Gson gson = new Gson();
        List<Map<String, String>> users = new ArrayList<>();

        // Read existing data from JSON file
        File jsonFile = new File(JSON_FILE_PATH);
        if (jsonFile.exists()) {
            try (FileReader reader = new FileReader(jsonFile)) {
                users = gson.fromJson(reader, new TypeToken<List<Map<String, String>>>() {}.getType());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // Add new user data
        Map<String, String> user = new HashMap<>();
        user.put("username", username);
        user.put("password", password);
        user.put("email", email);
        user.put("contact", contact);
        user.put("location", location);
        user.put("address", address);
        user.put("image", image);
        users.add(user);

        // Write updated data to JSON file
        try (FileWriter writer = new FileWriter(jsonFile)) {
            gson.toJson(users, writer);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}