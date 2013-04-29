/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cs4280asg2.dto;

/**
 *
 * @author Siuyan
 */
public class StatBean {
    private int section_id;
    private String movie_house;
    private String movie_start;
    private int total_sales;

    /**
     * @return the section_id
     */
    public int getSection_id() {
        return section_id;
    }

    /**
     * @param section_id the section_id to set
     */
    public void setSection_id(int section_id) {
        this.section_id = section_id;
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
     * @return the total_sales
     */
    public int getTotal_sales() {
        return total_sales;
    }

    /**
     * @param total_sales the total_sales to set
     */
    public void setTotal_sales(int total_sales) {
        this.total_sales = total_sales;
    }
}
