/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cs4280asg2.dto;

/**
 *
 * @author 52168666
 */
public class SaleBean {
    private int sale_id;
    private String sale_time;
    private int section_id;

    /**
     * @return the sale_id
     */
    public int getSale_id() {
        return sale_id;
    }

    /**
     * @param sale_id the sale_id to set
     */
    public void setSale_id(int sale_id) {
        this.sale_id = sale_id;
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
}
