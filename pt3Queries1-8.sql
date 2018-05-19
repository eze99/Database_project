/*Part 3 Query 1. This first query is pretty loaded because there are a few concats in here.
Concat just means to bring things together. I have to concat the full address of the customers
while still retrieving their first and last names. I also include their loan numbers and was able to
format the balance to show as actuall dollar sign values (money, currency, etc.).*/
select cust_first_name, cust_last_name, concat(address, " ", city, " ", state, " ", zipcode) AS fulladdress, loan.loan_number,
concat("$",format(balance,2)) AS balance
FROM customer join loan ON customer.customer_ID = loan.customer_ID
join accounts ON customer.customer_ID = accounts.customer_ID group by(balance) asc;


/*Part 3 Query 2. This query is very precise because it needed to be above 15,000 and below 100,000.
I had to make sure to not include 15,000 or 10,000 in my results because it wasn't specified to do so.
I made sure to use the greater than and less than operators to make that happen. */
select customer.customer_ID, cust_first_name, cust_last_name, accounts.balance,concat("$", format(amount,2)) AS amount 
FROM customer join loan ON customer.customer_ID = loan.customer_ID
join accounts ON customer.customer_ID=accounts.customer_ID
WHERE amount >15000 and amount < 100000;


/*Part 3 Query 3. This query was straight forward. I for the customer's first and last name along with their
checking account numbers by filtering only to checking.*/
select cust_first_name, cust_last_name, account_number, category
FROM customer join accounts ON customer.customer_ID = accounts.customer_ID
WHERE category = "checking";


/*Part 3 Query 4. For this query, I sought out to retrieve the customer's fuull name, account number; I filtered the category to be savings only and
got the balance that were from $1 to $1000.
I could have also done "WHERE category = "saving" and balance <=1000;" and have gotten the same answer*/
select concat(cust_first_name, " ",cust_last_name) AS fullname, account_number, category, concat("$", format(balance,2)) AS balance
FROM customer join accounts ON customer.customer_ID = accounts.customer_ID
WHERE category = "saving" and balance between 1 and 1000;


/*Part 3 Query 5. This query is pretty fun because it shows an actual change in value of the interest rate when
it includes a 15% interest. I also included the customer ID, first and last name, their full address, the amount of the loan,
a column showing the old balance for reference and the final column is the amount in dollars that the
loan interest goes up by when 15% interest rate is applied.*/
select customer.customer_ID, cust_first_name, cust_last_name, concat(address, " ", city, " ", state, " ", zipcode) AS fulladdress, 
concat("$", format(amount,2)) AS amount, concat("$", format(balance,2)) AS oldbalance, concat("$",format(balance *0.15,2))
AS interest_increase_amount
FROM customer join accounts ON customer.customer_ID = accounts.customer_ID
join loan ON customer.customer_ID = loan.customer_ID;


/*Part 3 Query 6. This query simply shows the bankers' first name and last name, their email addresses and the full branch address that they work for.
I sorted it by branch ID.*/
select branch.branch_ID, first_name, last_name, email_address, concat(address," ",city," ",state," ",zipcode) 
AS fullbranch_address
FROM branch join banker ON branch.branch_ID = banker.branch_ID order by (branch_ID);


/*Part 3 Query 7. This query shows branch ID's and their respective loan amounts that
belonges to the branch ID. If I would have written "asc" for ascending after "order by", I still would've gotten the same results because
the order by clause goes in ascending order by default.*/
select branch.branch_ID, amount FROM branch join loan on branch.branch_ID = loan.branch_ID
order by branch_ID, amount;


/*Part 3 Query 8.This query shows the customer's first and last name, their ID, loan number, the amount of the loan, payment amount and balance
after they have made the payment. I also included the balance amount before they made the payment for extra context*/
select customer.customer_ID, cust_first_name, cust_last_name, loan.loan_number,
concat("$", format(amount,2)) AS amount,
concat("$", format(balance,2)) AS balance,
concat("$", format(payment_amount,2)) AS payment_amount, 
concat("$", format(balance-payment_amount,2)) AS balance_after_payment
FROM customer join loan ON customer.customer_ID = loan.customer_ID join accounts 
ON customer.customer_ID =accounts.customer_ID
join loanpayments ON loan.loan_number = loanpayments.loan_number
order by (customer_ID);


/*Part 3 Query 8.1 
select customer.customer_ID, cust_first_name, cust_last_name, loan.loan_number,
concat("$", format(amount,2)) AS amount,
concat("$", format(balance,2)) AS balance,
concat("$", format(payment_amount,2)) AS payment_amount, 
concat("$", format(balance-payment_amount,2)) AS balance_after_payment
FROM customer join loan ON customer.customer_ID = loan.customer_ID join accounts 
ON customer.customer_ID =accounts.customer_ID
join loanpayments ON loan.loan_number = loanpayments.loan_number
order by (customer_ID);

I was going to originally go with this one and do the "group by" clause but I didn't because I noticed that
the "order by" clause was more precise in terms of showing the fact that one customer had more than one loan.
The group my clause is normally used with aggregate functions and this wasn't the case. But it interestengly enough
did show me that there were only 6 customers in total that made payments which was correct. */