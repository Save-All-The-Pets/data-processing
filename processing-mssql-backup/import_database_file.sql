drop database if exists SaveAllThePets
GO

RESTORE DATABASE SaveAllThePets
FROM DISK = '/app/sql/SaveAllThePets.bak'
With Move 'SaveAllThePets' To '/app/sql/SaveAllThePets.mdf',
MOVE 'SaveAllThePets_log' TO'/app/sql/SaveAllThePets_log.ldf'
GO