// using MySql.Data.MySqlClient;
// using System;
// using System.Data;


// class directconnectivity {
    
//     static void Main()
//     {   
//         string connectionString = "Server=localhost;Port=3306;Database=sample;User=root;Password=password;";
//         MySqlConnection connection = new MySqlConnection(connectionString);
//         try
//         {
//             connection.Open();
//             Console.WriteLine("Connected to MySQL!");
//             string createTableSql = "CREATE TABLE IF NOT EXISTS users(" +
//                                     "id INT AUTO_INCREMENT PRIMARY KEY," +
//                                      "name VARCHAR(255) NOT NULL," +
//                                      "email VARCHAR(255) NOT NULL)";

//             using (MySqlCommand createTableCmd = new MySqlCommand(createTableSql, connection))
//             {
//                 createTableCmd.ExecuteNonQuery();
//             }
//             string insertSql = "INSERT INTO users (name, email) VALUES (@name, @email)";
//             using (MySqlCommand insertCommand = new MySqlCommand(insertSql, connection))
//             {
//                 insertCommand.Parameters.AddWithValue("@name", "Shital Patil");
//                 insertCommand.Parameters.AddWithValue("@email", "shital@tfl.com");

//                 int rowsAffected = insertCommand.ExecuteNonQuery();
//                 Console.WriteLine($"Inserted {rowsAffected} row(s) into the users table.");
//             }
//         }
//         catch (Exception ex)
//         {
//             Console.WriteLine($"Error: {ex.Message}");
//         }
//         finally
//         {
//             connection.Close();
//         }
//     }
// }