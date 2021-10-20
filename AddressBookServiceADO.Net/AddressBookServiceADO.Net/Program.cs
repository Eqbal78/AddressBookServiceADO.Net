using System;

namespace AddressBookServiceADO.Net
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Welcome to address book problem ADO.net");
            /// Creating an object of AddressBookRepo class
            AddressBookRepo addressBookRepo = new AddressBookRepo();
            /// Calling the GetAllEntries method from AddressBookRepo class
            addressBookRepo.DBconnection();

            AddressBookModel model = new AddressBookModel();
            model.FirstName = "Natasha";
            model.LastName = "Romanova";
            model.City = "New York City";
            model.State = "New York";
            model.Zip = "100254";
            model.PhoneNo = "3645217896";
            model.Email = "blackwidow@gmail.com";
            model.AddressBookName = "office";
            model.ContactType = "Friend";
            model.Address = "Stark Tower 59th Street Broadway";
            Console.WriteLine(addressBookRepo.AddContacts(model) ? "Record inserted successfully " : "Failed");
            //addressBookRepo.GetAllEntries();
        }
    }
}
