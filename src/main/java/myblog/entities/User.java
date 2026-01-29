package myblog.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "user_name")
    private String name;

    @Column(name = "user_email", unique = true) // Email unique honi chahiye
    private String email;

    @Column(name = "user_password")
    private String password;

    private String gender;

    @Column(length = 500)
    private String about;

    private String role; // 'admin' or 'normal'

    // Constructors, Getters and Setters
    public User() {}

    public User(String name, String email, String password, String gender, String about) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.about = about;
        this.role = "normal"; // Default role
    }

    // Getters and Setters (Generate these in your IDE: Right Click -> Source -> Generate Getters/Setters)
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }
    public String getAbout() { return about; }
    public void setAbout(String about) { this.about = about; }
    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
}