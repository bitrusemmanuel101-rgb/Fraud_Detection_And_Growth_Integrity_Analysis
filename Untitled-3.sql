/* 
Q1: Where are we loosing money without knowing it?
Q2: which segment are 'fake' growth vs real growth?
Q3: Where is friction killing conversion?
Q4: Are we over_blocking good customers?
Q5: What is our true net revenue after risk adjustment?
Q6: Which 20% of behaviour drives 80% of fraud?
*/

SELECT
sum(Transaction_Amount) as TPV,
sum(case WHEN fraud_label = 1 then Transaction_Amount else 0 end)
 as Fraud_TPV,
sum(case when fraud_label = 0 then transaction_amount else 0 end)
 as Net_TPV,
sum(case when fraud_label = 1 then transaction_amount else 0 end)
 * 1.0 / sum(Transaction_Amount) *100 as fraud_rate
from transactions_dataset;


SELECT 
    Merchant_Category,
    sum(Transaction_Amount) as TPV,
sum(case WHEN fraud_label = 1 then Transaction_Amount else 0 end)
 as Fraud_TPV,
    sum(case when fraud_label = 1 then transaction_amount else 0 end)
 * 1.0 / sum(Transaction_Amount) *100 as fraud_rate
 FROM
    transactions_dataset
GROUP BY
    merchant_category
ORDER BY
    fraud_rate DESC