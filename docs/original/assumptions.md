# Assumptions (version 3) - Group7

1) A Request has one or more Tasks; each Task stores estimate and actual amounts.

2) Labor hours are recorded per employee per task per date; hours are more than  0.

3) Client has unique account number; client_type is an element of  {'individual','business'}.

4) All money uses DECIMAL(10,2); dates use YYYY-MM-DD.

5) Employee SSN is unique ; address/phone stored as text.

6) more to come place any assumtions here please 

7) ERD DIAGRAM assumtions :
Admin → Client: one-to-many (one Admin manages many Clients; each Client has one Admin).

Priority → Request: one-to-many (one Priority applies to many Requests; each Request has one Priority).

Client → Request: one-to-many.

Request → Task: one-to-many (tasks numbered per request).

Task ↔ Material: many-to-many via TaskMaterial (stores qtyUsed, unitPriceSnapshot).

Task ↔ Equipment: many-to-many over time via TaskEquipment (assignDate → releaseDate).

Task ↔ Employee: many-to-many via TaskEmployee (stores workDate; hoursWorked, rateSnapshot).

Employee ↔ Skill: many-to-many via EmployeeSkill.

