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

            addressBookRepo.GetAllEntries();
        }
    }
}
