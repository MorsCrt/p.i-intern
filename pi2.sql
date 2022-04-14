DO $$
DECLARE  
   a integer :=  position('//' in '<url>https://www.w3schools.com</url>')+2;  
   d integer :=  position('com' in '<url>https://www.w3schools.com</url>')+3;  
   c varchar(50);  
BEGIN  
   c :=  SUBSTRING( '<url>https://www.w3schools.com</url>',a , d-a);
    RAISE NOTICE'Value of c: %', c;	
END $$;
