-- Summarized Instructions:
/*
    No specific column names where mentioned.
    Select the difference in days remaining until the end of the month, difference between the current date and the last day of the current month. 
    Hint provided to accomplish this:
      GETDATE() – today's date
      Plug in the YEAR() and MONTH() of Today's date into DATEFROMPARTS() to get the first day of the month
      DATEADD to add 1 month to the previous step
      DATEADD  to subtract 1 day
      DATEDIFF to find  the difference between the current date and the end-of-month.
    Lots of nested functions
    Recommend using new lines to keep track of parentheses
    Everything should be dynamic.
*\
