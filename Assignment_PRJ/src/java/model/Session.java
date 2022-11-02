/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author HP
 */
public class Session {
    private int id;
    private Lecture lecturer;
    private Room room;
    private TimeSlot timelost;
    private Date date;
    private Group group;
    private int index;
    private boolean attandated;
    private ArrayList<Attandance> attendances = new ArrayList<>();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Lecture getLecturer() {
        return lecturer;
    }

    public void setLecturer(Lecture lecturer) {
        this.lecturer = lecturer;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public TimeSlot getTimelost() {
        return timelost;
    }

    public void setTimelost(TimeSlot timelost) {
        this.timelost = timelost;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public boolean isAttandated() {
        return attandated;
    }

    public void setAttandated(boolean attandated) {
        this.attandated = attandated;
    }

    public ArrayList<Attandance> getAttendances() {
        return attendances;
    }

    public void setAttendances(ArrayList<Attandance> attendances) {
        this.attendances = attendances;
    }
    
}
