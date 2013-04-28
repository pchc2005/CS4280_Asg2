/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cs4280asg2.dto;

/**
 *
 * @author Siuyan
 */
public class SessionBean {
    private int id;
    private String movie_name;
    private String movie_house;
    private String movie_start;
    private double discount;

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
     * @return the movie_house
     */
    public String getMovie_house() {
        return movie_house;
    }

    /**
     * @param movie_house the movie_house to set
     */
    public void setMovie_house(String movie_house) {
        this.movie_house = movie_house;
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
     * @return the discount
     */
    public double getDiscount() {
	return discount;
    }

    /**
     * @param discount the discount to set
     */
    public void setDiscount(double discount) {
	this.discount = discount;
    }
    
}
