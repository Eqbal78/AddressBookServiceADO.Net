using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace AddressBookServiceADO.Net
{
    public class AddressBookRepo
    {
        /// <summary>
        /// Database server store in string
        /// </summary>
        public static string connectionString = @"Data Source=DESKTOP-AB32E02;Initial Catalog=AddressBookService;Integrated Security=True";
        SqlConnection connection = new SqlConnection(connectionString);

        /// <summary>
        /// check database connection methods
        /// </summary>
        public void DBconnection()
        {
            //open server
            connection.Open();
            if (connection.State == ConnectionState.Open)
            {
                Console.WriteLine("Database connection is succesfull & is opened !!");
            }
            else
            {
                Console.WriteLine("Connection is not established !!");
            }
            connection.Close();
        }


        /// <summary>
        /// Fetch all data method
        /// </summary>
        public void GetAllEntries()
        {
            //instance of EmployeeModel class
            AddressBookModel model = new AddressBookModel();
            try
            {
                using (connection)
                {
                    string query = @"select * from Address_Book";
                    //define the SqlCommand object
                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();
                    //define SqlDataReader Object
                    SqlDataReader reader = command.ExecuteReader();
                    //check if there are record
                    if (reader.HasRows)
                    {
                        Console.Write("FirstName" + "\t" + "LastName" + "\t" + "City " + "\t\t" + "State");
                        Console.Write("\t\t" + "Zip" + "\t\t" + "PhoneNo" + "\t\t" + "Email" + "\t\t\t\t" + "AddressBookName" +  "\n");
                        while (reader.Read())
                        {
                            model.FirstName = reader["FirstName"].ToString();
                            model.LastName = reader["LastName"].ToString(); 
                            model.City = reader["City"].ToString();
                            model.State =reader["State"].ToString();
                            model.Zip = reader["Zipcode"].ToString();
                            model.PhoneNo = reader["PhoneNumber"].ToString();
                            model.Email = reader["Email"].ToString();
                            model.AddressBookName = reader["addressbook_name"].ToString();
                            model.ContactType = reader["type"].ToString();
                            //model.Address = reader["Address"].ToString();

                            Console.Write("{0}\t\t{1}\t\t{2}\t{3}\t", model.FirstName, model.LastName, model.City, model.State);
                            Console.Write("{0}\t{1}\t\t{2}\t{3}\t\t{4}\n", model.Address, model.Zip, model.PhoneNo, model.Email, model.AddressBookName);
                        }
                    }
                    else
                        Console.WriteLine("No data found");
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
            finally
            {
                connection.Close();
            }
        }
    }
}