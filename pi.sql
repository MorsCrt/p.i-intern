do
$$
declare
    rec record;
begin
    
for rec in select country, percentile_cont(0.5) within group (order by daily_vaccinations) from pidata group by country

loop 
	if rec.percentile_cont is null then
	UPDATE pidata 
	SET daily_vaccinations = 0				   
	where daily_vaccinations is null and country =rec.country;
	
	else
	UPDATE pidata 
	SET daily_vaccinations = rec.percentile_cont
	where daily_vaccinations is NULL and country = rec.country;
	
	end if ;
	raise notice '% - % ', rec.country, rec.percentile_cont;
    end loop;
end;
$$;
select * from pidata 
