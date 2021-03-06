/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cs4280asg2.dto;

/**
 *
 * @author 52168666
 */
public class CustomerBean {
    private int id;
    private String login_name;
    private String name;
    private int phone_no;
    private String addr;
    private String email;
    private String password;
    private String creditcard;
    private int loyalty_pt;
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
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the phone_no
     */
    public int getPhone_no() {
        return phone_no;
    }

    /**
     * @param phone_no the phone_no to set
     */
    public void setPhone_no(int phone_no) {
        this.phone_no = phone_no;
    }

    /**
     * @return the addr
     */
    public String getAddr() {
        return addr;
    }

    /**
     * @param addr the addr to set
     */
    public void setAddr(String addr) {
	if (addr == null) {
	    this.addr = "";
	}
	else {
	    this.addr = addr;
	}
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        if (email == null) {
	    this.email = "";
	}
	else {
	    this.email = email;
	}
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
     * @return the creditcard
     */
    public String getCreditcard() {
        return creditcard;
    }

    /**
     * @param creditcard the creditcard to set
     */
    public void setCreditcard(String creditcard) {
        this.creditcard = creditcard;
    }

    /**
     * @return the loyalty_pt
     */
    public int getLoyalty_pt() {
        return loyalty_pt;
    }

    /**
     * @param loyalty_pt the loyalty_pt to set
     */
    public void setLoyalty_pt(int loyalty_pt) {
        this.loyalty_pt = loyalty_pt;
    }

    /**
     * @return the id
     */
    public int getId() {
	return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
	this.id = id;
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
