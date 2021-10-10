SELECT * FROM subject WHERE semester = 2

INSERT INTO subject (name, semester, description) values('BASE DE DATOS I', 2, 'Materia de introduccion a Base de datos')
INSERT INTO subject (name, semester, description) values('PROGRAMACION II', 2, 'Materia de nivel medio de programacion')
INSERT INTO subject (name, semester, description) values('PROGRAMACION WEB I', 2, 'Materia de introduccion a Programacion Web')

DELETE FROM subject
WHERE subjectID = 1

SELECT * FROM users

INSERT INTO users (name, lastName, userName, password, mail, type) values('Michael', 'Sanabria', 'ssm', HASHBYTES('md5','asd'), 'ssm1009631@est.univalle.edu', 1)


INSERT INTO users (name, lastName, userName, password, mail, type) values(@name, @lastName, @userName, HASHBYTES(@password,'14900'), @mail, @type)


select * from users
where password=0xD1C364F4B712DC6C804C2B773DE76D97

select * from coments

INSERT INTO coments (coment, userID, subjectID) values('asdasd', 1, 4);
INSERT INTO coments (coment, userID, teacherID) values('asdasd', 1, 4);