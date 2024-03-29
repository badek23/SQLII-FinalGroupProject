CREATE USER 'scanuser'@'%' IDENTIFIED BY 'scan123$';
CREATE USER 'johndoe'@'%' IDENTIFIED BY 'JohnsSecurePassword!23';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.ADDRESS_TYPE TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.POSTAL_CODE TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.ADDRESS TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.LOCATION_TYPE TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.LOCATION TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.STORE TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.CURRENCY TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.SALESPERSON TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.SALESPERSON_BONUS TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.BRAND TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.SUPPLIER TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.COLOR TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.MODEL TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.SERIES TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.GENERATION TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.PHONE_TYPE TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.PROCESSOR TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.MAIN_CAMERA TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.WEIGHT TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.DISPLAY TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.PRODUCT TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.PRICE TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.GPC_SEGMENT TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.GPC_FAMILY TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.GPC_CLASS TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.GPC_CATEGORY TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.GPC_CATEGORY_ATTRIBUTES TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.GPC_PRODUCT_ATTRIBUTES TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.INVENTORY TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.CC_TYPE TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.CC_PAYMENT TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.CUSTOMER TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.TICKET TO 'scanuser'@'%';
GRANT SELECT, INSERT, UPDATE ON Group2_Project.TICKET_ITEM TO 'scanuser'@'%';
REVOKE SELECT ON Group2_Project.CC_PAYMENT FROM 'scanuser'@'%';
GRANT SELECT ON Group2_Project.* TO 'johndoe'@'%';
FLUSH PRIVILEGES;