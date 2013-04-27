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
    private String category;
    private String language;
    private String subtitle;
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
    public int getCategory() {
        return category;
    }

    /**
     * @param category_id the category_id to set
     */
    public void setCategory(int category) {
        this.category = category;
    }

    /**
     * @return the language_id
     */
    public int getLanguage() {
        return language;
    }

    /**
     * @param language_id the language_id to set
     */
    public void setLanguage(int language) {
        this.language = language;
    }

    /**
     * @return the subtitle_id
     */
    public int getSubtitle() {
        return subtitle;
    }

    /**
     * @param subtitle_id the subtitle_id to set
     */
    public void setSubtitle(int subtitle) {
        this.subtitle = subtitle;
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
	if (synposis != null) {
	    this.synposis = synposis;
	}
	else {
	    this.synposis = "";
	}
    }
}
