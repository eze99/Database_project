/*Views Views are really important and to create them I ran the query first and then created the views*/
/* View #1. This view is getting the first and last name, customer ID, the first and last name of the banker table
and I concatenated the addresses in the branch table to make it its own address space. I ended it with naming the view, "bankers_customers".  */
create view banker_customers AS select cust_first_name,cust_last_name, customer.customer_ID, banker.first_name, banker.last_name, branch.branch_ID, 
concat(branch.address, "  ", branch.city, "  ", branch.state, "  ", branch.zipcode)AS branch_address
FROM customer join banker on customer.customer_ID = banker.customer_ID join branch on banker.branch_ID = branch.branch_ID
order by (branch.branch_ID);

select * from cfbank.banker_customers;

/*View #2. This view is simply just showing the customer's first and last name and the loan numbers associated with them
along with the balance that they have, the amount of the loan and the corresponding branch ID for the banks. I named the view, "branch_open_loans".*/
create view branch_open_loans AS select cust_first_name, cust_last_name, loan_number, concat("$",format(balance,2)) AS balance, amount, branch.branch_ID
FROM customer join loan ON customer.customer_ID = loan.customer_ID join accounts ON customer.customer_ID = accounts.customer_ID
join branch on loan.branch_ID = branch.branch_ID
order by (amount)asc;

select * from cfbank.branch_open_loans;


/*View #3. This view was the most interesting one because I had to filter by only one customer.
To do that, I filtered to see reults only from account ID number 2 which belongs to customer ID number 1.
I made it look a little neater with formatting the balance so it'll be easier to read. I took into account that it is a view and it should look nice.
I also included the interest rate and the amount accrued because of that rate for that specific user.*/
create view customer_one_saving AS select cust_first_name, cust_last_name, category, savings.account_number, concat("$",format(balance,2)) AS balance, 
savings.interest_rate, concat("$",format(balance *0.035,2)) AS balance_accrued
FROM customer join accounts ON customer.customer_ID = accounts.customer_ID join savings ON accounts.account_ID = savings.account_ID
WHERE accounts.account_ID = 2;

select * from cfbank.customer_one_saving;




