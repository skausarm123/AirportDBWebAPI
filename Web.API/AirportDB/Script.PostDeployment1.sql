if not exists(select 5 from dbo.[Airport])
begin
insert into dbo.[Airport] 
values('LGW',1,'Departure and Arrival')
insert into dbo.[Airport] 
values('PMI',2,'Arrival Only')
insert into dbo.[Airport] 
values('LAX',3,'Arrival Only')

end
