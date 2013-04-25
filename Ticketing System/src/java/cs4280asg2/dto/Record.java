/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cs4280asg2.dto;

/**
 *
 * @author 52168666
 */
public class Record {
    private int id;
    private int customer_id;
    private int sale_id;
    private int ticket_type_id;
    private int record_seat_row;
    private int record_seat_col;

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
     * @return the customer_id
     */
    public int getCustomer_id() {
        return customer_id;
    }

    /**
     * @param customer_id the customer_id to set
     */
    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

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
     * @return the record_seat_row
     */
    public int getRecord_seat_row() {
        return record_seat_row;
    }

    /**
     * @param record_seat_row the record_seat_row to set
     */
    public void setRecord_seat_row(int record_seat_row) {
        this.record_seat_row = record_seat_row;
    }

    /**
     * @return the record_seat_col
     */
    public int getRecord_seat_col() {
        return record_seat_col;
    }

    /**
     * @param record_seat_col the record_seat_col to set
     */
    public void setRecord_seat_col(int record_seat_col) {
        this.record_seat_col = record_seat_col;
    }
}
