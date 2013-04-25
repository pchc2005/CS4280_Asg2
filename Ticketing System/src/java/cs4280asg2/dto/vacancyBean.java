/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cs4280asg2.dto;

/**
 *
 * @author 52168666
 */
public class vacancyBean {
    private int sale_id;
    private int vacancy_sold;

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
}
