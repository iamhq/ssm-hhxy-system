package cn.hqisgood.bean;

public class Teacher {
    private Integer teacherId;

    private String teacherName;

    private Integer managerDepartmentId;

    private String teacherPassword;

    private String teacherSalary;

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName == null ? null : teacherName.trim();
    }

    public Integer getManagerDepartmentId() {
        return managerDepartmentId;
    }

    public void setManagerDepartmentId(Integer managerDepartmentId) {
        this.managerDepartmentId = managerDepartmentId;
    }

    public String getTeacherPassword() {
        return teacherPassword;
    }

    public void setTeacherPassword(String teacherPassword) {
        this.teacherPassword = teacherPassword == null ? null : teacherPassword.trim();
    }

    public String getTeacherSalary() {
        return teacherSalary;
    }

    public void setTeacherSalary(String teacherSalary) {
        this.teacherSalary = teacherSalary == null ? null : teacherSalary.trim();
    }
}