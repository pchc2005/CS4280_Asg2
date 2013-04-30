/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cs4280asg2.dto;

/**
 *
 * @author PCHC
 */
public class StaffBean {
    private String login_name;
    private String password;
    private String role;
    private boolean login_status;

    /**
     * @return the login_name
     */
    public String getLogin_name() {
        return login_name;
    }

    /**
     * @param login_name the login_name to set
     */
    public void setLogin_name(String login_name) {
        this.login_name = login_name;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the role_id
     */
    public String getRole() {
        return role;
    }

    /**
     * @param role_id the role_id to set
     */
    public void setRole(String role) {
        this.role = role;
    }

    /**
     * @return the login_status
     */
    public boolean isLogin_status() {
	return login_status;
    }

    /**
     * @param login_status the login_status to set
     */
    public void setLogin_status(boolean login_status) {
	this.login_status = login_status;
    }
}