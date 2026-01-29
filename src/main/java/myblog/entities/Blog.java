package myblog.entities;
import java.util.Date;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "posts")
public class Blog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "post_id")
    private int pid;

    @Column(name = "post_title", length = 150, nullable = false)
    private String pTitle;

    // Content bada ho sakta hai isliye length zyada rakhi hai
    // Ya fir @Lob annotation use kar sakte hain for Large Objects
    @Column(name = "post_content", length = 5000)
    private String pContent;

    @Column(name = "post_pic_url") // Yaha hum image ka path/URL save karenge (String format)
    private String pPicUrl;

    @Column(name = "post_date")
    @CreationTimestamp
    private Date pDate;

    // --- RELATIONSHIP ---
    // Many Blogs can belong to One User
    @ManyToOne
    @JoinColumn(name = "uid") // Database me 'uid' naam ka foreign key column banega
    private User user;

    // Constructors
    public Blog() {
    }

    public Blog(String pTitle, String pContent, String pPicUrl, User user) {
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pPicUrl = pPicUrl;
        this.user = user;
       
    }

    // Getters and Setters
    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public String getpPicUrl() {
        return pPicUrl;
    }

    public void setpPicUrl(String pPicUrl) {
        this.pPicUrl = pPicUrl;
    }

    public Date getpDate() {
        return pDate;
    }

    public void setpDate(Date pDate) {
        this.pDate = pDate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
