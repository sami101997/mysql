SELECT TOP (1000) [Amount]
      ,[Date]
  FROM [Sami].[dbo].[transactions_0] 
select sum(Amount)-60 as balance from transactions_0