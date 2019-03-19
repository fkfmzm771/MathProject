package Math.Spring.com.VO;

public class Student {
 private String student_id;
 private String student_pw;
 private String student_name;
 private String student_email;
 private String student_nickname;
 private String student_phone;
 
 public Student() {
  super();
 }
 
 public Student(String student_id, String student_pw, String student_name, String student_email,
   String student_nickname, String student_phone) {
  super();
  this.student_id = student_id;
  this.student_pw = student_pw;
  this.student_name = student_name;
  this.student_email = student_email;
  this.student_nickname = student_nickname;
  this.student_phone = student_phone;
 }

 public String getStudent_id() {
  return student_id;
 }

 public void setStudent_id(String student_id) {
  this.student_id = student_id;
 }

 public String getStudent_pw() {
  return student_pw;
 }

 public void setStudent_pw(String student_pw) {
  this.student_pw = student_pw;
 }

 public String getStudent_name() {
  return student_name;
 }

 public void setStudent_name(String student_name) {
  this.student_name = student_name;
 }

 public String getStudent_email() {
  return student_email;
 }

 public void setStudent_email(String student_email) {
  this.student_email = student_email;
 }

 public String getStudent_nickname() {
  return student_nickname;
 }

 public void setStudent_nickname(String student_nickname) {
  this.student_nickname = student_nickname;
 }

 public String getStudent_phone() {
  return student_phone;
 }

 public void setStudent_phone(String student_phone) {
  this.student_phone = student_phone;
 }

 @Override
 public String toString() {
  return "student [student_id=" + student_id + ", student_pw=" + student_pw + ", student_name=" + student_name
    + ", student_email=" + student_email + ", student_nickname=" + student_nickname + ", student_phone="
    + student_phone + "]";
 }
 
}