/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cs4280asg2.dto;

/**
 *
 * @author 52168666
 */
public class MovieBean {
    private int id;
    private String name;
    private int duration;
    private int category_id;
    private int language_id;
    private int subtitle_id;
    private String posterURL;
    private String synposis;

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
     * @return the duration
     */
    public int getDuration() {
        return duration;
    }

    /**
     * @param duration the duration to set
     */
    public void setDuration(int duration) {
        this.duration = duration;
    }

    /**
     * @return the category_id
     */
    public int getCategory_id() {
        return category_id;
    }

    /**
     * @param category_id the category_id to set
     */
    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    /**
     * @return the language_id
     */
    public int getLanguage_id() {
        return language_id;
    }

    /**
     * @param language_id the language_id to set
     */
    public void setLanguage_id(int language_id) {
        this.language_id = language_id;
    }

    /**
     * @return the subtitle_id
     */
    public int getSubtitle_id() {
        return subtitle_id;
    }

    /**
     * @param subtitle_id the subtitle_id to set
     */
    public void setSubtitle_id(int subtitle_id) {
        this.subtitle_id = subtitle_id;
    }

    /**
     * @return the posterURL
     */
    public String getPosterURL() {
        return posterURL;
    }

    /**
     * @param posterURL the posterURL to set
     */
    public void setPosterURL(String posterURL) {
        this.posterURL = posterURL;
    }

    /**
     * @return the synposis
     */
    public String getSynposis() {
        return synposis;
    }

    /**
     * @param synposis the synposis to set
     */
    public void setSynposis(String synposis) {
        this.synposis = synposis;
    }
}
