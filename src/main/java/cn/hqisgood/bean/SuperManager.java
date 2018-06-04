package cn.hqisgood.bean;

public class SuperManager {
    private Integer superId;

    private String superName;

    private String superPassword;

    public Integer getSuperId() {
        return superId;
    }

    public void setSuperId(Integer superId) {
        this.superId = superId;
    }

    public String getSuperName() {
        return superName;
    }

    public void setSuperName(String superName) {
        this.superName = superName == null ? null : superName.trim();
    }

    public String getSuperPassword() {
        return superPassword;
    }

    public void setSuperPassword(String superPassword) {
        this.superPassword = superPassword == null ? null : superPassword.trim();
    }
}