/*
In CTE it's natural to reference the previous row this alternative just 
adds values from the previous rows. The query looks like this:
*/
-----------------------------------------------------------------
-- Numbers F0 through F10 in Fibonacci sequence, CTE
-----------------------------------------------------------------
WITH FibonacciNumbers (RecursionLevel, FibonacciNumber, NextNumber) 
AS (
   -- Anchor member definition
   SELECT  1  AS RecursionLevel,
           0  AS FibonacciNumber,
           1  AS NextNumber
   FROM Dual
   UNION ALL
   -- Recursive member definition
   SELECT  a.RecursionLevel + 1             AS RecursionLevel,
           a.NextNumber                     AS FibonacciNumber,
           a.FibonacciNumber + a.NextNumber AS NextNumber
   FROM FibonacciNumbers a
   WHERE a.RecursionLevel <= 10
)
-- Statement that executes the CTE
SELECT  'F' || TO_CHAR( fn.RecursionLevel - 1 ) AS FibonacciOrdinal, 
        fn.FibonacciNumber,
        fn.NextNumber
FROM FibonacciNumbers fn;