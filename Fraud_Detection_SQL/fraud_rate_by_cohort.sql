



select 
    cohort_month,
    count(transaction_amount) as total_transaction,
    sum(fraud_label) as fraud_txn,
    sum(case when fraud_label = 1 then Transaction_Amount end)* 1.00
    /sum(Transaction_Amount)*100 as fraud_rate 
from 
    user_cohort as cdc
left join 
    transactions_dataset_main tdm on tdm.user_id = cdc.user_id
GROUP BY
    cdc.cohort_month
order BY
    cdc.cohort_month

  