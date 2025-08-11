use credit_cardtransaction;
create table credit_card_transaction(
transaction_id int primary key,
city varchar(100),
transaction_date date,
card_type varchar(50),
expense_type varchar(50),
gender char(1),amount decimal(10,2)
);
-- total spend by city
select city,sum(amount) as total_spend
from credit_card_transcations
group by city
order by total_spend desc;

-- monthly spend trend
select date_format(transaction_date,'%Y-%m') as month,sum(amount) as total_amount
from credit_card_transcations  
group by month
order by month;

-- Expense type distribution
select expense_type, count(*) as txn_count,sum(amount) as total_spend
from credit_card_transcations
group by expense_type
order by total_spend desc;

-- gender wise spending
select gender, count(*) as txn_count,sum(amount) as total_spend
from credit_card_transcations 
group by gender;

-- card type performance
select card_type,count(*) as txn_count,avg(amount) as avg_spend
from credit_card_transcations 
group by card_type;
