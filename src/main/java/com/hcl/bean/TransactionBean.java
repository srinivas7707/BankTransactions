package com.hcl.bean;

public class TransactionBean {
public int amount;
public String transfer_type;

public String getTransfer_type() {
	return transfer_type;
}

public void setTransfer_type(String transfer_type) {
	this.transfer_type = transfer_type;
}

public int getAmount() {
	return amount;
}

public void setAmount(int amount) {
	this.amount = amount;
}
}
