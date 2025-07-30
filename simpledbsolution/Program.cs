using MySql.Data.MySqlClient;
using Org.BouncyCastle.Asn1.Misc;
using System;
using System.Data;

class directconnectivity
{
    // This is a simple C# program that connects to a MySQL database, creates a table,
    static void Main()
    { 
     string connectionString = "Server=localhost;Port=3306;Database=sample;User=root;Password=password;";
      using(MySqlConnection connection = new MySqlConnection(connectionString))
      {
            try
            {
                connection.Open();
                Console.WriteLine("Connected to MySQL!");
                CreateTable(connection);
                InsertUser(connection, "Shital Patil", "Shital@tfl.com");
                InsertUser(connection, "Sridhar Patil", "Sridhar@tfl.com");
                UpdateUserEmail(connection, "Shital Patil", "Update@tfl.com");
                DeleteUser(connection, 2);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }
            finally
            {
                connection.Close();
            }
            // The following methods are used to create a table, insert a user, update a user's email, and delete a user.
            
            static void CreateTable(MySqlConnection connection)
            {
                string createTableSql = "CREATE TABLE IF NOT EXISTS users(" + "id INT AUTO_INCREMENT PRIMARY KEY," + "name VARCHAR(255) NOT NULL," + "email VARCHAR(255) NOT NULL)";

                using (MySqlCommand createTableCmd = new MySqlCommand(createTableSql, connection))
                {
                    createTableCmd.ExecuteNonQuery();
                }

            }
            static void InsertUser(MySqlConnection connection, string name,string email)
            {
              string insertSql = "INSERT INTO users (name, email) VALUES (@name, @email)";
                using (MySqlCommand insertCommand = new MySqlCommand(insertSql, connection))
                {
                    insertCommand.Parameters.AddWithValue("@name", name);
                    insertCommand.Parameters.AddWithValue("@email", email);

                    int rowsAffected = insertCommand.ExecuteNonQuery();
                    Console.WriteLine($"Inserted {rowsAffected} row(s) into the users table.");
                }

            }
            static void UpdateUserEmail(MySqlConnection connection, string name,string newEmail)
            {
                    
                    string updateSql = "UPDATE users SET email = @newEmail WHERE name = @name";
                using (MySqlCommand updateCommand = new MySqlCommand(updateSql, connection))
                {
                    updateCommand.Parameters.AddWithValue("@name", name);
                    updateCommand.Parameters.AddWithValue("@newEmail", newEmail);   
                    updateCommand.ExecuteNonQuery();
                    
                    }
            }
            static void DeleteUser(MySqlConnection connection,int id)
            {
                    string deleteSql = "DELETE FROM users WHERE id = @id";
                    using (MySqlCommand deleteCommand = new MySqlCommand(deleteSql, connection))
                    {
                        deleteCommand.Parameters.AddWithValue("@id", id);
                        deleteCommand.ExecuteNonQuery();

                    }
            }
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