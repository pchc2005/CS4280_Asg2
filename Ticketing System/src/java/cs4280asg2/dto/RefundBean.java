/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cs4280asg2.dto;

/**
 *
 * @author PCHC
 */
public class RefundBean {
    private int trans_id;
    private String sale_time;
    private String house_name;
    private String movie_name;
    private String movie_start;
    private int vacancy_sold;
    private double total_price;
    private boolean is_authorized;
    private int customer_id;

    /**
     * @return the trans_id
     */
    public int getTrans_id() {
	return trans_id;
    }

    /**
     * @param trans_id the trans_id to set
     */
    public void setTrans_id(int trans_id) {
	this.trans_id = trans_id;
    }

    /**
     * @return the sale_time
     */
    public String getSale_time() {
	return sale_time;
    }

    /**
     * @param sale_time the sale_time to set
     */
    public void setSale_time(String sale_time) {
	this.sale_time = sale_time;
    }

    /**
     * @return the house_name
     */
    public String getHouse_name() {
	return house_name;
    }

    /**
     * @param house_name the house_name to set
     */
    public void setHouse_name(String house_name) {
	this.house_name = house_name;
    }

    /**
     * @return the movie_name
     */
    public String getMovie_name() {
	return movie_name;
    }

    /**
     * @param movie_name the movie_name to set
     */
    public void setMovie_name(String movie_name) {
	this.movie_name = movie_name;
    }

    /**
     * @return the movie_start
     */
    public String getMovie_start() {
	return movie_start;
    }

    /**
     * @param movie_start the movie_start to set
     */
    public void setMovie_start(String movie_start) {
	this.movie_start = movie_start;
    }

    /**
     * @return the vacancy_sold
     */
    public int getVacancy_sold() {
	return vacancy_sold;
    }

    /**
     * @param vacancy_sold the vacancy_sold to set
     */
    public void setVacancy_sold(int vacancy_sold) {
	this.vacancy_sold = vacancy_sold;
    }

    /**
     * @return the total_price
     */
    public double getTotal_price() {
	return total_price;
    }

    /**
     * @param total_price the total_price to set
     */
    public void setTotal_price(double total_price) {
	this.total_price = total_price;
    }

    /**
     * @return the is_authorized
     */
    public boolean isIs_authorized() {
	return is_authorized;
    }

    /**
     * @param is_authorized the is_authorized to set
     */
    public void setIs_authorized(boolean is_authorized) {
	this.is_authorized = is_authorized;
    }

    /**
     * @return the customer_id
     */
    public int getCustomer_id() {
	return customer_id;
    }

    /**
     * @param customer_id the customer_id to set
     */
    public void setCustomer_id(int customer_id) {
	this.customer_id = customer_id;
    }
}
