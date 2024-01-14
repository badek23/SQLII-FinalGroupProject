#1) Which are the top 3 phone sales?

#Some phone elements (e.g., model, series, etc.) could be NULL depending on the phone, so we use the CONCAT_WS function to ignore the NULL values
SELECT 
    CONCAT_WS(' ', 
        COALESCE(M.DESCRIPTION, ''), 
        COALESCE(S.DESCRIPTION, ''), 
        COALESCE(G.DESCRIPTION, ''), 
        COALESCE(PT.DESCRIPTION, '')
    ) AS PhoneDetails,
    SUB.TotalQuantitySold
FROM (
    SELECT P.PRODUCT_ID, SUM(TI.QUANTITY) AS TotalQuantitySold
    FROM TICKET_ITEM TI
    JOIN PRICE PR ON TI.PRICE_ID = PR.PRICE_ID
    JOIN PRODUCT P ON PR.PRODUCT_ID = P.PRODUCT_ID
    GROUP BY P.PRODUCT_ID
    ORDER BY SUM(TI.QUANTITY) DESC
    LIMIT 3
) SUB
JOIN PRODUCT P ON SUB.PRODUCT_ID = P.PRODUCT_ID
LEFT JOIN MODEL M ON P.MODEL_ID = M.MODEL_ID
LEFT JOIN SERIES S ON P.SERIES_ID = S.SERIES_ID
LEFT JOIN GENERATION G ON P.GENERATION_ID = G.GENERATION_ID
LEFT JOIN PHONE_TYPE PT ON P.PHONE_TYPE_ID = PT.PHONE_TYPE_ID;

 	

#2) Show the revenue per type of credit card.
#Since we also have dollars for the American store, we convert the amounts to Euros in case they are in dollars before summing them

SELECT 
    CC.DESCRIPTION AS CreditCardName,
    SUM(
        CASE 
            WHEN T.CURRENCY_ID = 'USD' THEN ROUND(T.TOTAL_AMOUNT * 0.92,2)
            ELSE T.TOTAL_AMOUNT 
        END
    ) AS TotalRevenueConverted
FROM TICKET T
JOIN CC_PAYMENT CP ON T.PAYMENT_ID = CP.PAYMENT_ID
JOIN CC_TYPE CC ON CP.CC_TYPE = CC.CC_TYPE
GROUP BY CC.DESCRIPTION;


 
#3) Which brand are we selling the most this year?

SELECT B.BRAND_NAME AS Brand, SUM(TI.QUANTITY) AS Quantity_Sold
FROM TICKET_ITEM TI
JOIN PRICE PR ON TI.PRICE_ID = PR.PRICE_ID
JOIN PRODUCT P ON PR.PRODUCT_ID = P.PRODUCT_ID
JOIN BRAND B ON P.BRAND_ID = B.BRAND_ID
JOIN TICKET T ON TI.TICKET_ID = T.TICKET_ID
WHERE YEAR(T.PURCHASE_TIME) = YEAR(CURRENT_DATE())
GROUP BY B.BRAND_ID
ORDER BY Quantity_Sold DESC
LIMIT 1;

 

#4) Who (salesman) makes us earn more money?

SELECT 
    CONCAT(S.FIRST_NAME, ' ', S.LAST_NAME) AS Salesperson_Name, 
    SUM(
        CASE 
            WHEN T.CURRENCY_ID = 'USD' THEN ROUND(T.TOTAL_AMOUNT * 0.92,2)
            ELSE T.TOTAL_AMOUNT 
        END
    ) AS Total_Sales
FROM SALESPERSON S
JOIN TICKET T ON S.SALESPERSON_ID = T.SALESPERSON_ID
GROUP BY S.SALESPERSON_ID
ORDER BY Total_Sales DESC
LIMIT 1;



# Since our salespeople also get a 5% bonus, the same query could be performed by adding the bonuses of all employees and multiplying them by 20 (with a difference of several cents due to rounding):

SELECT 
    CONCAT(S.FIRST_NAME, ' ', S.LAST_NAME) AS Salesperson_Name, 
    SUM(
        CASE 
            WHEN B.BONUS_CURRENCY = 'USD' THEN ROUND(B.BONUS * 0.92,2)
            ELSE B.BONUS 
        END
    ) * 20 AS Total_Sales
FROM SALESPERSON S
JOIN SALESPERSON_BONUS B ON S.SALESPERSON_ID = B.SALESPERSON_ID
GROUP BY S.SALESPERSON_ID
ORDER BY Total_Sales DESC
LIMIT 1;

 

#5) What is the total income that every salesperson received from salary and added bonuses on November 1st, 2023?

SELECT 
    CONCAT(S.FIRST_NAME, ' ', S.LAST_NAME) AS Salesperson_Name,
    S.SALARY_CURRENCY Currency,
    S.MONTHLY_SALARY Salary,
    COALESCE(SUM(B.BONUS), 0) AS Bonus,
    (S.MONTHLY_SALARY + COALESCE(SUM(B.BONUS), 0)) AS Total_Income
FROM SALESPERSON S
LEFT JOIN SALESPERSON_BONUS B ON S.SALESPERSON_ID = B.SALESPERSON_ID AND B.BONUS_DATE = '2023-11-01'
GROUP BY S.SALESPERSON_ID, S.SALARY_CURRENCY, S.MONTHLY_SALARY
ORDER BY Total_Income DESC;
