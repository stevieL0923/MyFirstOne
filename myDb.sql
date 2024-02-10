create database IF NOT EXISTS myFirstDB;

use myFirstDB;

show tables;

create table clients (
    cid int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(256),
    address VARCHAR(256),
    city VARCHAR(256),
    state VARCHAR(2),
    zipCode VARCHAR(5)
);

describe  clients;

INSERT into clients VALUES (null, 'Lennar Development', '1221 Poway Ave.', 'Poway', 'CA', '92128');
INSERT into clients VALUES (null, 'K&B Homes', '900 Carmel Mtn', 'Rancho Bernardo', 'CA', '92127');
INSERT into clients VALUES (null, 'Shea Homes', '456 Black Mountain', 'Racho Penaquitos', 'CA', '92120');

SELECT * from clients;

CREATE TABLE meetings (
    mid int PRIMARY KEY AUTO_INCREMENT,
    date DATE,
    startTime TIME,
    endTime TIME,
    purpose VARCHAR(256),
    cid INT,
    CONSTRAINT FK_cidMeetings
    FOREIGN KEY (cid) REFERENCES clients(cid)
);

DESCRIBE meetings;

INSERT into meetings (date, startTime, endTime, purpose, cid) 
    VALUES ('2024-02-05', '09:00:00', '10:00:00', 'New Customer Mtg', 1);
INSERT into meetings (date, startTime, endTime, purpose, cid) 
    VALUES ('2024-02-05', '10:00:00', '11:00:00', 'Finalize Sales', 2);
INSERT into meetings (date, startTime, endTime, purpose, cid) 
    VALUES ('2024-03-05', '09:00:00', '10:00:00', 'Plan New Development', 1);

SELECT * from meetings;

SELECT clients.name, meetings.date, meetings.startTime, meetings.endTime, meetings.purpose 
FROM clients
INNER JOIN meetings on clients.cid = meetings.cid
ORDER by meetings.date, meetings.startTime;

UPDATE meetings
SET date  = '2024-02-06', startTime = '09:00:00', endTime = '10:00:00'
WHERE cid = 2;

SELECT clients.name, meetings.date, meetings.startTime, meetings.endTime, meetings.purpose 
FROM clients
INNER JOIN meetings on clients.cid = meetings.cid
ORDER by meetings.date, meetings.startTime;

DELETE FROM meetings WHERE date = '2024-03-05';

SELECT clients.name, meetings.date, meetings.startTime, meetings.endTime, meetings.purpose 
FROM clients
INNER JOIN meetings on clients.cid = meetings.cid
ORDER by meetings.date, meetings.startTime;

drop database myFirstDB;
