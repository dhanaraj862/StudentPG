package org.techhub.service;

import java.util.List;

import org.techhub.model.RentPayment;

public interface RentPaymentService {

	int addPayment(RentPayment payment);

	List<RentPayment> getAllPayments();

	RentPayment getPaymentById(int id);

	List<RentPayment> getPaymentsByStudentId(int studentId);

	int updatePayment(RentPayment payment);

	int deletePayment(int id);

	int getPaymentCountByAllocationAndMonth(int allocationId, String monthYear);

	int getPaymentCountByAllocationAndMonthExcludingId(int allocationId, String monthYear, int paymentId);
}
