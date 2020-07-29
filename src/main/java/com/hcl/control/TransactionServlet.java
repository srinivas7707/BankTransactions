package com.hcl.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.hcl.bean.*;
import com.hcl.dao.*;

/**
 * Servlet implementation class TransactionServlet
 */

public class TransactionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TransactionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	int amount=Integer.parseInt(request.getParameter("amount"));
	String transfer_type=request.getParameter("ttype");
	TransactionBean tb=new TransactionBean();
	tb.setAmount(amount);
	tb.setTransfer_type(transfer_type);
	TransactionDao td=new TransactionDao();
	String msg=td.operation(tb);
	if(msg.equals("success"))
	{

		request.getRequestDispatcher("/Display.jsp").include(request, response);
	}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
