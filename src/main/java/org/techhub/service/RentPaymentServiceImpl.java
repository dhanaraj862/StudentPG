package org.techhub.service;

import java.util.List;

import org.springframework.stereotype.Service;

import org.techhub.model.RentPayment;
import org.techhub.repository.RentPaymentRepository;

@Service
public class RentPaymentServiceImpl
implements RentPaymentService {


private RentPaymentRepository paymentRepository;

public RentPaymentServiceImpl(
        RentPaymentRepository paymentRepository) {

    this.paymentRepository =
            paymentRepository;
}

@Override
public int addPayment(
        RentPayment payment) {

    return paymentRepository
            .addPayment(payment);
}

@Override
public List<RentPayment>
        getAllPayments() {

    return paymentRepository
            .getAllPayments();
}

@Override
public RentPayment
        getPaymentById(int id) {

    return paymentRepository
            .getPaymentById(id);
}

@Override
public List<RentPayment>
        getPaymentsByStudentId(
                int studentId) {

    return paymentRepository
            .getPaymentsByStudentId(
                    studentId);
}

@Override
public int updatePayment(
        RentPayment payment) {

    return paymentRepository
            .updatePayment(payment);
}

@Override
public int deletePayment(int id) {

    return paymentRepository
            .deletePayment(id);
}

@Override
public int getPaymentCountByAllocationAndMonth(
        int allocationId,
        String monthYear) {

    return paymentRepository
            .getPaymentCountByAllocationAndMonth(
                    allocationId,
                    monthYear);
}

@Override
public int getPaymentCountByAllocationAndMonthExcludingId(
        int allocationId,
        String monthYear,
        int paymentId) {

    return paymentRepository
            .getPaymentCountByAllocationAndMonthExcludingId(
                    allocationId,
                    monthYear,
                    paymentId);
}

}
