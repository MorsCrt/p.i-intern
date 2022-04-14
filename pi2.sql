DO $$
DECLARE  
	url varchar(250) :='<url>https://tr.linkedin.com/company/piworksinc</url>';
   a integer :=  position('//' in url)+2;  
   b integer :=  position('com' in url)+3;  
   c varchar(250);  
BEGIN  
   c :=  SUBSTRING( url,a , b-a);
    RAISE NOTICE'Result: %', c;	
END $$;
