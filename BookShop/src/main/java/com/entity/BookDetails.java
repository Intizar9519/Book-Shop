package com.entity;

public class BookDetails {
	private int bookId;
	private String bookName;
	private String authorName;
	private String price;
	private String bookCategory;
	private String status;
	private String photo;
	private String userEmail;
	
	public BookDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BookDetails(String bookName, String authorName, String price, String bookCategory, String status,
			String photo, String userEmail) {
		super();
		this.bookName = bookName;
		this.authorName = authorName;
		this.price = price;
		this.bookCategory = bookCategory;
		this.status = status;
		this.photo = photo;
		this.userEmail = userEmail;
	}
	
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getBookCategory() {
		return bookCategory;
	}
	public void setBookCategory(String bookCategory) {
		this.bookCategory = bookCategory;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	@Override
	public String toString() {
		return "BookDetails [bookId=" + bookId + ", bookName=" + bookName + ", authorName=" + authorName + ", price="
				+ price + ", bookCategory=" + bookCategory + ", status=" + status + ", photo=" + photo + ", userEmail="
				+ userEmail + "]";
	}
}
