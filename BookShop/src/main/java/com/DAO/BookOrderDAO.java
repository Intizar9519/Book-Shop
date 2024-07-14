package com.DAO;

import com.entity.*;
import java.util.*;

public interface BookOrderDAO {
     public int getOrderNo();
     public boolean saveOrder(List<Book_Order> b);
     public List<Book_Order> getBook(String email);
     public List<Book_Order> getAllOrder();
}
