package org.techhub.model;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class RoomAllocation {

	private int id;

	private int studentId;

	private int roomId;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date allocationDate;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date checkoutDate;

	private String status;

	public RoomAllocation() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public Date getAllocationDate() {
		return allocationDate;
	}

	public void setAllocationDate(Date allocationDate) {
		this.allocationDate = allocationDate;
	}

	public Date getCheckoutDate() {
		return checkoutDate;
	}

	public void setCheckoutDate(Date checkoutDate) {
		this.checkoutDate = checkoutDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}