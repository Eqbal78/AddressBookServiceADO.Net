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
    }
}
