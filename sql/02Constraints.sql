-- client → servicerequest

ALTER TABLE servicerequest
  ADD CONSTRAINT fk_servicerequest_client
   FOREIGN KEY (AccountNo) REFERENCES client (AccountNo);


-- servicerequest → task
ALTER TABLE task
  ADD CONSTRAINT fk_task_servicerequest
   FOREIGN KEY (RequestNo) REFERENCES servicerequest (RequestNo);


-- employee → task_employee
ALTER TABLE task_employee
ADD CONSTRAINT fk_task_employee_employee
FOREIGN KEY (SSN)
REFERENCES employee (SSN);

-- task → task_employee
ALTER TABLE task_employee
ADD CONSTRAINT fk_task_employee_task
FOREIGN KEY (TaskNo)
REFERENCES task (TaskNo);

-- task → material_task
ALTER TABLE material_task
ADD CONSTRAINT fk_material_task_task
FOREIGN KEY (TaskNo)
REFERENCES task (TaskNo);

-- material → material_task
ALTER TABLE material_task
ADD CONSTRAINT fk_material_task_material
FOREIGN KEY (MaterialID)
REFERENCES material (MaterialID);

-- task → task_equipment
ALTER TABLE task_equipment
ADD CONSTRAINT fk_task_equipment_task
FOREIGN KEY (TaskNo)
REFERENCES task (TaskNo);

-- equipment → task_equipment
ALTER TABLE task_equipment
ADD CONSTRAINT fk_task_equipment_equipment
FOREIGN KEY (SerialNo)
REFERENCES equipment (SerialNo);

-- employee → employee_skill
ALTER TABLE employee_skill
ADD CONSTRAINT fk_employee_skill_employee
FOREIGN KEY (SSN)
REFERENCES employee (SSN);

-- skill → employee_skill
ALTER TABLE employee_skill
ADD CONSTRAINT fk_employee_skill_skill
FOREIGN KEY (SkillCode)
REFERENCES skill (SkillCode);

-- admin → client (optional but in model)
ALTER TABLE client
ADD CONSTRAINT fk_client_admin
FOREIGN KEY (AdminID)
REFERENCES admin (AdminID);

-- priority → servicerequest (optional but in model)
ALTER TABLE servicerequest
ADD CONSTRAINT fk_servicerequest_priority
FOREIGN KEY (PriorityID)
REFERENCES priority (PriorityID);