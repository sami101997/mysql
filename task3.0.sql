/*SELECT TOP (1000) [amount]
      ,[date]
  FROM [Sami].[dbo].[transactions]*/
  select sum(amount)-55 as balance from transactions
