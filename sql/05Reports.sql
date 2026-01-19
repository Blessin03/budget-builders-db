-- Report 01: Plumbing tasks with an actual amount greater than 500
SELECT * FROM task WHERE Category = 'Plumbing' and ActualAmount > 500;


-- Report 02: Equipment with usage cost over 50, purchased on or after 2024-01-01

SELECT * FROM Equipment WHERE UsageCost > 50 AND PurchaseDate >= '2024-01-01';

-- Report 03: Service requests and tasks for business clients

