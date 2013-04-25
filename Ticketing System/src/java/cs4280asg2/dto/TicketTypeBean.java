/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cs4280asg2.dto;

/**
 *
 * @author 52168666
 */
public class TicketTypeBean {
    private int ticket_type_id;
    private String ticket_type_name;
    private double base_price;

    /**
     * @return the ticket_type_id
     */
    public int getTicket_type_id() {
        return ticket_type_id;
    }

    /**
     * @param ticket_type_id the ticket_type_id to set
     */
    public void setTicket_type_id(int ticket_type_id) {
        this.ticket_type_id = ticket_type_id;
    }

    /**
     * @return the ticket_type_name
     */
    public String getTicket_type_name() {
        return ticket_type_name;
    }

    /**
     * @param ticket_type_name the ticket_type_name to set
     */
    public void setTicket_type_name(String ticket_type_name) {
        this.ticket_type_name = ticket_type_name;
    }

    /**
     * @return the base_price
     */
    public double getBase_price() {
        return base_price;
    }

    /**
     * @param base_price the base_price to set
     */
    public void setBase_price(double base_price) {
        this.base_price = base_price;
    }
}
