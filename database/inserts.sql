
--Insert person
INSERT INTO db_telecon.person (name, document, email) VALUES('admin', '000000000','admin@admin.com');

--Insert authentication
INSERT INTO db_telecon.authentication (user, password, person_id) VALUES('admin', '21232f297a57a5a743894a0e4a801fc3',(SELECT ID FROM db_telecon.person where email = 'admin@admin.com'));

--Insert line
INSERT INTO db_telecon.line (number) VALUES(982315117);

--add line to person
INSERT INTO db_telecon.line_has_person (line_id,person_id) VALUES((SELECT ID FROM db_telecon.line where number = 982315117), (SELECT ID FROM db_telecon.person where email = 'admin@admin.com'));

--Insert type of services 
INSERT INTO db_telecon.type_services (name, description) VALUES('4G', '4G Internet service');
INSERT INTO db_telecon.type_services (name, description) VALUES('3G', '3G Internet service');
INSERT INTO db_telecon.type_services (name, description) VALUES('5G', '5G Internet service');
INSERT INTO db_telecon.type_services (name, description) VALUES('Voice', 'Voice Service');
INSERT INTO db_telecon.type_services (name, description) VALUES('SMS', 'SMS Service');

-- add services to line
INSERT INTO db_telecon.line_has_type_services (line_id, type_services_id) VALUES((SELECT ID FROM db_telecon.line where number = 982315117), 
(SELECT ID FROM db_telecon.type_services where name = '4G'));
INSERT INTO db_telecon.line_has_type_services (line_id, type_services_id) VALUES((SELECT ID FROM db_telecon.line where number = 982315117), 
(SELECT ID FROM db_telecon.type_services where name = 'Voice'));
INSERT INTO db_telecon.line_has_type_services (line_id, type_services_id) VALUES((SELECT ID FROM db_telecon.line where number = 982315117), 
(SELECT ID FROM db_telecon.type_services where name = 'SMS'));