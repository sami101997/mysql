SELECT TOP (1000) [Amount]
      ,[Date]
  FROM [Sami].[dbo].[transactions]

  select sum(amount)-50 as balance from transactions_1