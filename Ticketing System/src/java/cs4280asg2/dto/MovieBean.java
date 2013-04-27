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
    public String getCategory() {
        return category;
    }

    /**
     * @param category_id the category_id to set
     */
    public void setCategory(String category) {
        if (category != null) {
	    this.category = category;
	}
	else {
	    this.category = "";
	}
    }

    /**
     * @return the language_id
     */
    public String getLanguage() {
        return language;
    }

    /**
     * @param language_id the language_id to set
     */
    public void setLanguage(String language) {
        if (language != null) {
	    this.language = language;
	}
	else {
	    this.language = "";
	}
    }

    /**
     * @return the subtitle_id
     */
    public String getSubtitle() {
        return subtitle;
    }

    /**
     * @param subtitle_id the subtitle_id to set
     */
    public void setSubtitle(String subtitle) {
        if (subtitle != null) {
	    this.subtitle = subtitle;
	}
	else {
	    this.subtitle = "";
	}
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
        if (posterURL != null) {
	    this.posterURL = posterURL;
	}
	else {
	    this.posterURL = "";
	}
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
