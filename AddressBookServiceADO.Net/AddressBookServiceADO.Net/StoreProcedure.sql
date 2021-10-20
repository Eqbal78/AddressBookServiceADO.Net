create proc SpAddContactDetail
(
	@FirstName varchar(220),
	@LastName varchar(220),
	@Address varchar(220),
	@City varchar(220),
	@State varchar(225),
	@Zipcode varchar(225) ,
	@PhoneNumber varchar(225),
	@Email varchar(225),
	@addressbook_name varchar(225),
	@type varchar(225)
	
)
as
begin
	insert into Address_Book values
(
	@FirstName,
	@LastName,
	@Address,
	@City,
	@State,
	@Zipcode,
	@PhoneNumber,
	@Email,
	@addressbook_name,
	@type
)
end;