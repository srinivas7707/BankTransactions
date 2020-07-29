package com.hcl.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.hcl.bean.*;
import com.hcl.util.*;
public class TransactionDao {
public String operation(TransactionBean tb)
{
	int amount=tb.getAmount();
	String transfer_type=tb.getTransfer_type();
	Connection con=null;
	PreparedStatement ps=null;
	try
	{
		con=DBUtil.getConnection();
		String query="insert into bank(amount,transfer_type)values(?,?)";
		ps=con.prepareStatement(query);
		ps.setInt(1, amount);
		ps.setString(2, transfer_type);
		int i=ps.executeUpdate();
		if(i!=0)
			return "success";
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return "failure";
}
}
