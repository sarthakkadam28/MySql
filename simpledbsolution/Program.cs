using MySql.Data.MySqlClient;
using Org.BouncyCastle.Asn1.Misc;
using System;
using System.Data;
using System.Formats.Asn1;
using System.Security;
using System.Threading.Tasks;

class directconnectivity
{
    // This is a simple C# program that connects to a MySQL database, creates a table,
    static async Task MainAsync()
    {
        string connectionString = "Server=localhost;Port=3306;Database=sample;User=root;Password=password;";
        using (MySqlConnection connection = new MySqlConnection(connectionString))
        {
            // try
            // {
                // connection.Open();
                // Console.WriteLine("conected to MYSQL");
                int choice;
                do
                {
                    Console.WriteLine("=====MENU====");
                    Console.WriteLine("1. Create Users Table");
                    Console.WriteLine("2. Insert New User");
                    Console.WriteLine("3. Update User Email");
                    Console.WriteLine("4. Delete Users by ID Range");
                    Console.WriteLine("5. View All Users");
                    Console.WriteLine("6. Exit");
                    Console.Write("Enter your choice: ");


                    if (!int.TryParse(Console.ReadLine(), out choice)) continue;
                    switch (choice)
                    {
                        case 1:
                            await CreateTableAsync(connection);
                            break;
                        case 2:
                            Console.Write("Enter name: ");
                            string name = Console.ReadLine();
                            Console.Write("Enter email: ");
                            string email = Console.ReadLine();
                           await InsertUserAsync(connection, name, email);
                            break;
                        case 3:
                            Console.Write("Old Name: ");
                            string oldName = Console.ReadLine();
                            Console.Write("New Name: ");
                            string newName = Console.ReadLine();
                            Console.Write("New Email: ");
                            string newEmail = Console.ReadLine();
                            await UpdateUserEmailAsync(connection, newName, newEmail, oldName);
                            break;
                        case 4:
                            Console.Write("Start ID: ");
                            int startId = int.Parse(Console.ReadLine());
                            Console.Write("End ID: ");
                            int endId = int.Parse(Console.ReadLine());
                            await DeleteUserAsync(connection, startId, endId);
                            break;
                        case 5:
                            await showUsersAsync(connection);
                            break;
                        case 6:
                            Console.WriteLine("Exiting program.");
                            return;
                    }
                }
                while (choice != 6);
            // }
            // catch (Exception ex)
            // {
            //     Console.WriteLine("Error: " + ex.Message);
            // }
            // finally
            // {
            //     connection.Close();
            // }


        }
    }
    // The following methods are used to create a table, insert a user, update a user's email, and delete a user.
    static async Task CreateTableAsync(MySqlConnection connection)
    {
        string createTableSql = "CREATE TABLE IF NOT EXISTS users(" + "id INT AUTO_INCREMENT PRIMARY KEY," + "name VARCHAR(255) NOT NULL," + "email VARCHAR(255) NOT NULL)";
        try
        {
           await connection.OpenAsync();
            using (MySqlCommand createTableCmd = new MySqlCommand(createTableSql, connection))
            {
               await createTableCmd.ExecuteNonQueryAsync();
            }

        }
        catch (Exception ex)
        {
            Console.WriteLine("Error: " + ex.Message);
        }
        finally
        {
            await connection.CloseAsync();
        }
    }

    static async Task InsertUserAsync(MySqlConnection connection, string name, string email)
    {
        string insertSql = "INSERT INTO users (name, email) VALUES (@name, @email)";
        try
        {
           await connection.OpenAsync();
            using (MySqlCommand insertCommand = new MySqlCommand(insertSql, connection))
            {
                insertCommand.Parameters.AddWithValue("@name", name);
                insertCommand.Parameters.AddWithValue("@email", email);
                 int rowsAffected = await insertCommand.ExecuteNonQueryAsync();
                Console.WriteLine($"Inserted {rowsAffected} row(s) into the users table.");
            }

        }
        catch (Exception ex)
        {
            Console.WriteLine("Error: " + ex.Message);
        }
        finally
        {
           await connection.CloseAsync();
        }
    }



    static async Task UpdateUserEmailAsync(MySqlConnection connection, string name, string newEmail, string oldname)
    {

        string updateSql = "UPDATE users SET  name =@newname ,email = @newEmail WHERE name = @oldname";
        try
        {
           await connection.OpenAsync();
            using (MySqlCommand updateCommand = new MySqlCommand(updateSql, connection))
            {
                updateCommand.Parameters.AddWithValue("@newEmail", newEmail);
                updateCommand.Parameters.AddWithValue("@newname", name);
                updateCommand.Parameters.AddWithValue("@oldname", oldname);
                await updateCommand.ExecuteNonQueryAsync();

            }
        }
        catch (Exception ex)
        {
            Console.WriteLine("Error: " + ex.Message);
        }
        finally
        {
           await connection.CloseAsync();
        }
    }
    static async Task DeleteUserAsync(MySqlConnection connection, int startId, int endId)
    {
        string deleteSql = "DELETE FROM users WHERE id BETWEEN @startId AND @endId";
        try
        {
            await connection.OpenAsync();
            using (MySqlCommand deleteCommand = new MySqlCommand(deleteSql, connection))
            {
                deleteCommand.Parameters.AddWithValue("@startId", startId);
                deleteCommand.Parameters.AddWithValue("@endId", endId);
                int rowsAffected = await deleteCommand.ExecuteNonQueryAsync();
                Console.WriteLine($"Deleted {rowsAffected} row(s) from the users table.");
            }
        }

        catch (Exception ex)
        {
            Console.WriteLine("Error: " + ex.Message);
        }
        finally
        {
            await connection.CloseAsync();
        }
    }

    static async Task showUsersAsync(MySqlConnection connection)
    {
        try
        {
            await connection.OpenAsync();
            string strCmd = "SELECT * FROM users";
            using (MySqlCommand cmd = new MySqlCommand(strCmd, connection))
            {
                cmd.CommandType = CommandType.Text;
                using (MySqlDataReader reader = (MySqlDataReader)await cmd.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
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
           await connection.CloseAsync();
        }
    }
}