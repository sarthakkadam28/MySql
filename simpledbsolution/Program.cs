using MySql.Data.MySqlClient;
using System;
using System.Data;

class directconnectivity
{

    static void Main()
    {
        string connectionString = "Server=localhost;Port=3306;Database=sample;User=root;Password=password;";
        MySqlConnection connection = new MySqlConnection(connectionString);
        try
        {
            connection.Open();
            Console.WriteLine("Connected to MySQL!");
            string createTableSql = "CREATE TABLE IF NOT EXISTS users(" +
                                    "id INT AUTO_INCREMENT PRIMARY KEY," +
                                     "name VARCHAR(255) NOT NULL," +
                                     "email VARCHAR(255) NOT NULL)";

            using (MySqlCommand createTableCmd = new MySqlCommand(createTableSql, connection))
            {
                // createTableCmd.ExecuteNonQuery();
            }

            // string insertSql = "INSERT INTO users (name, email) VALUES (@name, @email)";
            // using (MySqlCommand insertCommand = new MySqlCommand(insertSql, connection))
            // {
            //     insertCommand.Parameters.AddWithValue("@name", "Shital Patil");
            //     insertCommand.Parameters.AddWithValue("@email", "shital@tfl.com");

            //     int rowsAffected = insertCommand.ExecuteNonQuery();
            //     Console.WriteLine($"Inserted {rowsAffected} row(s) into the users table.");
            // }
            string updateSql = "UPDATE users SET email = @newEmail WHERE name = @name";
            using (MySqlCommand updateCommand = new MySqlCommand(updateSql, connection))
            {
                updateCommand.Parameters.AddWithValue("@newEmail", "updated@tfl.com");
                updateCommand.Parameters.AddWithValue("@name", "Shital Patil");
                updateCommand.ExecuteNonQuery();
            }
            string deleteSql = "DELETE FROM users WHERE id = 1";
            using (MySqlCommand deleteCommand = new MySqlCommand(deleteSql, connection))
            {
                deleteCommand.Parameters.AddWithValue("@id", "1");
                 deleteCommand.ExecuteNonQuery();
               
            }
            
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error: {ex.Message}");
        }
        finally
        {
            connection.Close();
        }



        {
            try
            {
                connection.Open();
                string strCmd = "SELECT * FROM users";
                using (MySqlCommand cmd = new MySqlCommand(strCmd, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Console.WriteLine($"id: {reader["id"]}, name: {reader["name"]}, email: {reader["email"]}");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }
             finally
           {
            connection.Close();
          }
        }

    }
}