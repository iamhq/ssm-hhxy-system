package cn.hqisgood.bean;

public class Manager {
    private Integer managerId;

    private String managerName;

    private Integer managerDepartmentId;

	private String managerPassword;
    
    private Department department;
    
    private Integer pn;

    public Integer getPn() {
		return pn;
	}
	public void setPn(Integer pn) {
		this.pn = pn;
	}
	@Override
   	public String toString() {
   		return "Manager [managerId=" + managerId + ", managerName=" + managerName + ", managerDepartmentId="
   				+ managerDepartmentId + ", managerPassword=" + managerPassword + ", department=" + department + "]";
   	}
    public Department getDepartment() {
		return department;
	}

	public Manager() {
		super();
	}

	public Manager(Integer managerId, String managerName, Integer managerDepartmentId, String managerPassword) {
		super();
		this.managerId = managerId;
		this.managerName = managerName;
		this.managerDepartmentId = managerDepartmentId;
		this.managerPassword = managerPassword;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Integer getManagerId() {
        return managerId;
    }

    public void setManagerId(Integer managerId) {
        this.managerId = managerId;
    }

    public String getManagerName() {
        return managerName;
    }

    public void setManagerName(String managerName) {
        this.managerName = managerName == null ? null : managerName.trim();
    }

    public Integer getManagerDepartmentId() {
        return managerDepartmentId;
    }

    public void setManagerDepartmentId(Integer managerDepartmentId) {
        this.managerDepartmentId = managerDepartmentId;
    }

    public String getManagerPassword() {
        return managerPassword;
    }

    public void setManagerPassword(String managerPassword) {
        this.managerPassword = managerPassword == null ? null : managerPassword.trim();
    }
}