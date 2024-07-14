package com.entity;

public class Book_Order {
	private int id;
	private String orderId;
	private String userName;
	private String email;
	private String address;
	private String phone;
	private String bookName;
	private String author;
	private String price;
	private String paymentType;

	public Book_Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Book_Order(String orderId, String userName, String email, String address, String phone, String bookName,
			String author, String price, String paymentType) {
		super();
		this.orderId = orderId;
		this.userName = userName;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.bookName = bookName;
		this.author = author;
		this.price = price;
		this.paymentType = paymentType;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	@Override
	public String toString() {
		return "Book_Order [id=" + id + ", orderId=" + orderId + ", userName=" + userName + ", email=" + email
				+ ", address=" + address + ", phone=" + phone + ", bookName=" + bookName + ", author=" + author
				+ ", price=" + price + ", paymentType=" + paymentType + "]";
	}
    
}
