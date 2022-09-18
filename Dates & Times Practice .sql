-- Summarized Instructions:
/*
    No specific column names or tables where mentioned.
    Select the difference in days remaining until the end of the month, difference between the current date and the last day of the current month. 
    Hint provided to accomplish this:
      GETDATE() – today's date
      Plug in the YEAR() and MONTH() of Today's date into DATEFROMPARTS() to get the first day of the month
      DATEADD to add 1 month to the previous step
      DATEADD  to subtract 1 day
      DATEDIFF to find  the difference between the current date and the end-of-month.
*\
    
   SELECT 
	GETDATE() [Today],
	DATEFROMPARTS(YEAR(GETDATE()),MONTH(GETDATE()),1) [First of Month],
	DATEADD (DAY, -1, DATEFROMPARTS(YEAR(GETDATE()),MONTH(GETDATE()),1)) [Last Day of Previous Month],
	DATEADD(MONTH, -1, DATEFROMPARTS (YEAR(GETDATE()),MONTH(GETDATE()), 1)) [First Day of Previous Month]
