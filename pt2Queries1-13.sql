
/*Part 2 query #1. This query retrieves the first and last names of the customers in the customer table and I used "concat" to make their
addresses into a full address.*/
select cust_first_name,cust_last_name, concat(address, " ", city, " ", state, " ", zipcode)
AS full_address FROM customer;


/*Part 2 query #2. For this query, it asked me to list the name of the bankers so I used "concat" again but this time for their names in order to
put their first and last names together as well as retrieve their email addresses.*/
select concat(first_name, " ", last_name) AS Banker_names, email_address from banker;


/*query #3. This is selecting the amount of customers we have per city. I used group by to show it more carefully.*/
select city, count(customer_ID) from customer group by (city);

/*query #4. This query shows me the customer's first and last name along with their full address and only retrieves thos who live either in New York or Florida.*/
select cust_first_name, cust_last_name, state, concat(address," ",city," ",state, " ",zipcode) AS fulladdress from customer where state = 'NY' or state = 'FL';


/*query #5. This query show all of the customer table's information but it shows the balance in order from highest to lowest.*/
select * from accounts order by (balance) desc;


/*query #6. This query shows the amount of the loan balances.*/
select sum(amount) AS loan_balance from loan;


/*query #7. This query simply retrieves the name of the customer's whose last names end with "son".*/
select customer_ID, cust_first_name,cust_last_name from customer where cust_last_name like ("%son");


/*query #8. This query is similar to the one before it but instead of the last three letters of the last name, this is focused
on the first letter of the first name that begins with the letter A*/
select banker_ID, first_name,last_name from banker where first_name like ("A%");


/*query #9. This query simply shows me the information of all of the customers except for those that live in New York.*/
select * from customer where state not in ("NY");


/*query #10. This query is showing the payments dates that were between April 25th to the 29th.*/
select date_format(payment_date, "%m/%d/%y")AS payment_date from loanpayments where payment_date between "2018-04-25" and "2018-04-29";


/*query #11. This query is showing the loan that has the lowest balance.*/
select min(amount) from loan;


/*query #12. This query shows the total number of customers that are in the CFBank database. */
select count(customer_ID) from customer;


/*query #13. This query shows the details of the customers that live in Santa Monica as well as those who live in California.*/
select * from customer where city = "Santa monica" and state = "CA";


