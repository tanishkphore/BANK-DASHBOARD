CREATE DATABASE BankLoanDB;
USE BankLoanDB;
SELECT * FROM loan_data;

-- TOTAL NO OF LOANS 
SELECT count(id) AS Total_Loan_Application FROM loan_data;

-- MONTH TO DATE LOAN APPLICATIONS
SELECT count(id) AS Mtd_Total_Application FROM loan_data
WHERE month(issue_date) = 12 AND year(issue_date) = 2021;

-- PREVIOUS MTD LOAN APPLICATION
SELECT count(id) AS Mtd_Total_Application FROM loan_data
WHERE month(issue_date) = 11 AND year(issue_date) = 2021;

-- TOTAL FUNDED AMOUNT
SELECT sum(loan_amount) AS Total_Funded_Amount FROM loan_data;

-- MONTH TO DATE TOTAL AMOUNT
SELECT sum(loan_amount) AS Total_Funded_Amount FROM loan_data
WHERE month(issue_date) = 12 AND year(issue_date) = 2021;

-- PREVIOUS MTD TOTAL AMOUNT
SELECT sum(loan_amount) AS Total_Funded_Amount FROM loan_data
WHERE month(issue_date) = 11 AND year(issue_date) = 2021;

-- TOTAL AMOUNT RECIEVED 
SELECT sum(total_payment) AS Total_Amount_Recieved FROM loan_data;

-- MONTH TO DATE AMOUNT RECIEVED
SELECT sum(total_payment) AS Total_Amount_Recieved FROM loan_data
WHERE month(issue_date) = 12 AND year(issue_date) = 2021;

-- PREVIOUS MTD AMOUNT RECIEVED
SELECT sum(total_payment) AS Total_Amount_Recieved FROM loan_data
WHERE month(issue_date) = 11 AND year(issue_date) = 2021;

-- AVG INTEREST RATE 
SELECT avg(int_rate)*100 AS Avg_Interest_Rate FROM loan_data;

-- MONTH TO DATE AVG INTEREST RATE
SELECT avg(int_rate)*100 AS Avg_Interest_Rate FROM loan_data
WHERE month(issue_date) = 12 AND year(issue_date) = 2021;

-- PREVIOUS MTD AVG INTEREST RATE
SELECT avg(int_rate)*100 AS Avg_Interest_Rate FROM loan_data
WHERE month(issue_date) = 11 AND year(issue_date) = 2021;

-- AVG DTI
SELECT avg(dti)*100 AS Avg_Dti FROM loan_data;

-- MONTH TO DATE AVG DTI
SELECT avg(dti)*100 AS Avg_Dti FROM loan_data
WHERE month(issue_date) = 12 AND year(issue_date) = 2021;

-- PREVIOUS MTD AVG DTI
SELECT avg(dti)*100 AS Avg_Dti FROM loan_data
WHERE month(issue_date) = 11 AND year(issue_date) = 2021;

-- GOOD LOAN PERCENTAGE
SELECT 
	(count(case when loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100) 
    / 
    count(id) AS Good_loan_Percentage
FROM loan_data;

-- GOOD LOAN APPLICATIONS
SELECT count(id) AS Good_loan_Application FROM loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- GOOD LOAN FUNDED AMOUNT 
SELECT sum(loan_amount) AS Good_Loan_Total_Amount_Funded FROM loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- GOOD LOAN AMOUNT RECIEVED
SELECT sum(total_payment) AS Good_Loan_Total_Amount_Funded FROM loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- BAD LOAN PERCENTAGE
SELECT 
	(count(case when loan_status = 'Charged Off' THEN id END) * 100)
    /
    count(id) AS Bad_Loan_Percentage 
FROM loan_data;

-- BAD LOAN APPLICATIONS
SELECT count(id) AS Bad_loan_Application FROM loan_data
WHERE loan_status = 'Charged Off';

-- BAD LOAN FUNDED AMOUNT
SELECT sum(loan_amount) AS Bad_Loan_Total_Amount_Funded FROM loan_data
WHERE loan_status = 'Charged Off';

-- BAD LOAN AMOUNT RECIEVED
SELECT sum(total_payment) AS Bad_Loan_Total_Amount_Funded FROM loan_data
WHERE loan_status = 'Charged Off';

-- LOAN STATUS WITH IMPORTANT COLUMNS
SELECT loan_status,
	count(id) AS LoanCount,
    sum(total_payment) AS Amount_Recieved,
    sum(loan_amount) AS Amount_Funded,
    (avg(int_rate)*100) AS Interest_Rate,
    (avg(dti)*100) AS DTI 
FROM loan_data
GROUP BY loan_status;