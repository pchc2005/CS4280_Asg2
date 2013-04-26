/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cs4280asg2.dto;

/**
 *
 * @author 52168666
 */
public class CinemaHouseBean {
    private int id;
    private String name;
    private String size;
    private double price_ratio;
    private int row;
    private int col;
    private int capacity;

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
    
    public String getSize() {
	return size;
    }

    public void setSize(String size) {
	this.size = size;
    }
    /**
     * @return the price_ratio
     */
    public double getPrice_ratio() {
        return price_ratio;
    }

    /**
     * @param price_ratio the price_ratio to set
     */
    public void setPrice_ratio(double price_ratio) {
        this.price_ratio = price_ratio;
    }

    /**
     * @return the row
     */
    public int getRow() {
        return row;
    }

    /**
     * @param row the row to set
     */
    public void setRow(int row) {
        this.row = row;
    }

    /**
     * @return the col
     */
    public int getCol() {
        return col;
    }

    /**
     * @param col the col to set
     */
    public void setCol(int col) {
        this.col = col;
    }

    /**
     * @return the capacity
     */
    public int getCapacity() {
        return capacity;
    }

    /**
     * @param capacity the capacity to set
     */
    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }
}
