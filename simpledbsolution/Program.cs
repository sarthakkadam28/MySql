using MySql.Data.MySqlClient;
using System;
using System.Data;

class Program
{
    static void Main()
    {
        string ConnectionString = "Server=localhost; Port=3306; Database=sample; User=root; Password=password";

        using (MySqlConnection con = new MySqlConnection(ConnectionString))
        {
            try
            {
                con.Open();
                string strCmd = "SELECT * FROM customers";
                using (MySqlCommand cmd = new MySqlCommand(strCmd, con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Console.WriteLine($"customer_id: {reader["customer_id"]}, name: {reader["name"]}, email: {reader["email"]}, created_at: {reader["created_at"]}");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }
        }
    }
}
