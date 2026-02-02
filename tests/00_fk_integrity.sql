-- 1) client → servicerequest (accountNo)

SELECT servicerequest.RequestNo, servicerequest.AccountNo
FROM servicerequest
LEFT JOIN client ON servicerequest.AccountNo = client.AccountNo
WHERE client.AccountNo IS NULL
  AND servicerequest.AccountNo IS NOT NULL;


-- 2) servicerequest → task (requestNo)
SELECT task.TaskNo, task.RequestNo
FROM task
LEFT JOIN servicerequest ON task.RequestNo = servicerequest.RequestNo
WHERE servicerequest.RequestNo IS NULL
  AND task.RequestNo IS NOT NULL;


-- 3) employee → task_employee (SSN)
SELECT task_employee.SSN, task_employee.TaskNo
FROM task_employee
LEFT JOIN employee ON task_employee.SSN = employee.SSN
WHERE employee.SSN IS NULL;


-- 4) task → task_employee (TaskNo)
SELECT task_employee.TaskNo, task_employee.SSN
FROM task_employee
LEFT JOIN task ON task_employee.TaskNo = task.TaskNo
WHERE task.TaskNo IS NULL;

-- 5) task → material_task (TaskNo)
SELECT material_task.TaskNo, material_task.MaterialID
FROM material_task
LEFT JOIN task
  ON material_task.TaskNo = task.TaskNo
WHERE task.TaskNo IS NULL;
-- 6) material → material_task (MaterialID)
SELECT material_task.TaskNo, material_task.MaterialID
FROM material_task
LEFT JOIN material
  ON material_task.MaterialID = material.MaterialID
WHERE material.MaterialID IS NULL;

-- 7) task → task_equipment (TaskNo)
SELECT task_equipment.SerialNo, task_equipment.TaskNo
FROM task_equipment
LEFT JOIN task
  ON task_equipment.TaskNo = task.TaskNo
WHERE task.TaskNo IS NULL;

-- 8) equipment → task_equipment (SerialNo)
SELECT task_equipment.SerialNo, task_equipment.TaskNo
FROM task_equipment
LEFT JOIN equipment
  ON task_equipment.SerialNo = equipment.SerialNo
WHERE equipment.SerialNo IS NULL;

-- 9) employee → employee_skill (SSN)
SELECT employee_skill.SSN, employee_skill.SkillCode
FROM employee_skill
LEFT JOIN employee
  ON employee_skill.SSN = employee.SSN
WHERE employee.SSN IS NULL;

-- 10) skill → employee_skill (SkillCode)
SELECT employee_skill.SSN, employee_skill.SkillCode
FROM employee_skill
LEFT JOIN skill
  ON employee_skill.SkillCode = skill.SkillCode
WHERE skill.SkillCode IS NULL;
    
-- 11) admin → client (AdminID)
SELECT client.AccountNo, client.AdminID
FROM client
LEFT JOIN admin
  ON client.AdminID = admin.AdminID
WHERE admin.AdminID IS NULL
  AND client.AdminID IS NOT NULL;

-- 12) priority → servicerequest (PriorityID) 
SELECT servicerequest.RequestNo, servicerequest.PriorityID
FROM servicerequest
LEFT JOIN priority
  ON servicerequest.PriorityID = priority.PriorityID
WHERE priority.PriorityID IS NULL
  AND servicerequest.PriorityID IS NOT NULL;