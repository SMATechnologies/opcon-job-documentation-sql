/*
Purpose: To get the documentation from all schedules and jobs
and output them to a file to be imported into other systems

Created 1/27/17 By Bruce Jernell
Version 1.0

Modifications:
*/

use opconxps
declare @doctable table (skdid int,jobname varchar(128),doctext varchar(max))  --table to store the final documentation
declare @temptable table (row int,skdid int, jobname varchar(128))             --temp table to reduce overhead
declare @counter int,@doccount int, @doccount2 int,@skdid varchar(10),@jobname varchar(128),@combinetext varchar(max)

insert into @temptable(row,skdid,jobname)
(SELECT ROW_NUMBER() OVER(ORDER BY skdid ASC) as row,skdid,jobname from (select distinct skdid,jobname FROM dbo.jdocs) as docs);

--Loops through the different distinct schedule/jobnames that have documentation
set @counter = (Select count(*) from @temptable)
while @counter > 0
begin
	set @skdid = (Select skdid from @temptable where [row] = @counter)
	set @jobname =  (Select jobname from @temptable where [row] = @counter)
	set @doccount = (select count(doctext) from dbo.jdocs where skdid=@skdid and jobname=@jobname)
	set @doccount2 = 1
	set @combinetext = ''

	--Loops through the documentation lines for each job and combines them
	while @doccount2 <= @doccount
	begin
		set @combinetext = @combinetext + (select doctext from (select row_number() over (order by skdid desc) as row,doctext from dbo.jdocs where skdid=@skdid and jobname=@jobname) as docs where row=@doccount2)
		set @doccount2 = @doccount2+1
	end

	--Adds the new combined documentation entry to our final table
	insert into @doctable
	values(cast(@skdid as int),@jobname,@combinetext)

	set @counter = @counter-1
end

--Returns final tables with documentation combined
select UPPER(name.skdname) as ScheduleName,sdocs.savalue as [Schedule Doctext]
from dbo.sname as name --all schedules, could change to only jobs with documentation too
join dbo.sname_aux as sdocs
on sdocs.skdid = name.skdid
where sdocs.safc=0

select UPPER(name.skdname) as ScheduleName,UPPER(jobname) as JobName,Doctext
from @doctable as docs
join dbo.sname as name
on name.skdid = docs.skdid
order by skdname,jobname,doctext
