/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cs4280asg2.dto;

/**
 *
 * @author Siuyan
 */
public class CastingBean {
    private int movie_id;
    private String movie_name;
    private String casting_name;

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
     * @return the casting_name
     */
    public String getCasting_name() {
        return casting_name;
    }

    /**
     * @param casting_name the casting_name to set
     */
    public void setCasting_name(String casting_name) {
        this.casting_name = casting_name;
    }
}
