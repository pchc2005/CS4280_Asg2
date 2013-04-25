/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cs4280asg2.dto;

/**
 *
 * @author 52168666
 */
public class sectionBean {
    private int id;
    private int movie_id;
    private int house_id;
    private String movie_start;

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
     * @return the movie_id
     */
    public int getMovie_id() {
        return movie_id;
    }

    /**
     * @param movie_id the movie_id to set
     */
    public void setMovie_id(int movie_id) {
        this.movie_id = movie_id;
    }

    /**
     * @return the house_id
     */
    public int getHouse_id() {
        return house_id;
    }

    /**
     * @param house_id the house_id to set
     */
    public void setHouse_id(int house_id) {
        this.house_id = house_id;
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
}
