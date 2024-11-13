package com.DAO;

import java.sql.Connection;       
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;

import com.entity.BookDetails;


public class BookDAOImpl implements BookDAO {
	private Connection con;

	public BookDAOImpl(Connection con) {
		super();
		this.con=con;
	}

	@Override
	public boolean addBooks(BookDetails bd) {
		boolean f=false;
		try 
		{
			String sql = "insert into book_details(bookname,auther,price,bookcategory,status,photo,user_email) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,bd.getBookName());
			ps.setString(2,bd.getAuthorName());
			ps.setString(3,bd.getPrice());
			ps.setString(4,bd.getBookCategory());
			ps.setString(5,bd.getStatus());
			ps.setString(6,bd.getPhoto());
			ps.setString(7,bd.getUserEmail());
			
			int i = ps.executeUpdate();
			if(i==1) {
				 f=true;
			 }
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookDetails> getAllBooks() {
		List<BookDetails> list = new ArrayList<>();
		BookDetails b = null;
		try 
		{
			String sql = "SELECT * FROM book_details";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				// get all data from table and send to BookDetails entity class or entity object
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthorName(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				// add all data from the entity class to the ArrayList object
				list.add(b);
			
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public BookDetails getBookById(int id) {
		BookDetails b = null;
		try 
		{
			String sql = "SELECT * FROM book_details WHERE bookId=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,id);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				// get all data from table and send to BookDetails entity class or entity object
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthorName(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUserEmail(rs.getString(8));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return b;
	}

	@Override
	public boolean updateEditBooks(BookDetails b) {
		boolean f = false;
		try {
			String sql="update book_details set bookname=?, auther=?, price=?, bookcategory=?, status=? WHERE bookId=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthorName());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getStatus());
			ps.setInt(6, b.getBookId());
			
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean deleteBooks(int id) {
		boolean f = false;
		try {
			String sql = "delete from book_details where bookId=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,id);
			
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookDetails> getNewBook() {
		List<BookDetails> list = new ArrayList<>();
		BookDetails b = null;
		try 
		{
			String sql = "SELECT * FROM book_details WHERE bookcategory=? AND status=? ORDER BY bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,"New");
			ps.setString(2,"Active");
			
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthorName(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
			    i++;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getRecentBook() {
		List<BookDetails> list = new ArrayList<>();
		BookDetails b = null;
		try 
		{
			String sql = "SELECT * FROM book_details WHERE status=? ORDER BY bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,"Active");
			
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthorName(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
			    i++;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getOldBook() {
		List<BookDetails> list = new ArrayList<>();
		BookDetails b = null;
		try 
		{
			String sql = "SELECT * FROM book_details WHERE bookcategory=? AND status=? ORDER BY bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,"Old");
			ps.setString(2,"Active");
			
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthorName(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
			    i++;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getAllRecentBook() {
		List<BookDetails> list = new ArrayList<>();
		BookDetails b = null;
		try 
		{
			String sql = "SELECT * FROM book_details WHERE status=? ORDER BY bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,"Active");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthorName(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getAllNewBook() {
		List<BookDetails> list = new ArrayList<>();
		BookDetails b = null;
		try 
		{
			String sql = "SELECT * FROM book_details WHERE bookcategory=? AND status=? ORDER BY bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,"New");
			ps.setString(2,"Active");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthorName(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getAllOldBook() {
		List<BookDetails> list = new ArrayList<>();
		BookDetails b = null;
		try 
		{
			String sql = "SELECT * FROM book_details WHERE bookcategory=? ORDER BY bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,"Old");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthorName(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getBookByOld(String email, String cate) {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		try {
			String sql = "select *from book_details where bookcategory=? and user_email=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,cate);
			ps.setString(2,email);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthorName(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean oldBookDelete(String email, String cate, int id) {
		boolean f = false;
		try {
			String sql = "delete from book_details where user_email=? and bookcategory=? and bookId=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,email);
			ps.setString(2,cate);
			ps.setInt(3, id);
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
        return f;
	}

	@Override
	public List<BookDetails> getBookBySearch(String ch) {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = new BookDetails();;
		try {
			String sql = "select *from book_details where bookname like ? or auther like ? or bookcategory like ? and status=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthorName(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
}
