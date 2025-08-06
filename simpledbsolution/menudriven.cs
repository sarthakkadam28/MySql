static void Main()
{
    string connectionString = "Server=localhost;Port=3306;Database=sample;User=root;Password=password;";
    using (MySqlConnection connection = new MySqlConnection(connectionString))
    {
        connection.Open();
        Console.WriteLine("Connected to MySQL!");

        int choice;
        do
        {
            Console.WriteLine("\n==== MENU ====");
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
                    CreateTable(connection);
                    break;

                case 2:
                    Console.Write("Enter name: ");
                    string name = Console.ReadLine();
                    Console.Write("Enter email: ");
                    string email = Console.ReadLine();
                    InsertUser(connection, name, email);
                    break;

                case 3:
                    Console.Write("Old Name: ");
                    string oldName = Console.ReadLine();
                    Console.Write("New Name: ");
                    string newName = Console.ReadLine();
                    Console.Write("New Email: ");
                    string newEmail = Console.ReadLine();
                    UpdateUserEmail(connection, newName, newEmail, oldName);
                    break;

                case 4:
                    Console.Write("Start ID: ");
                    int startId = int.Parse(Console.ReadLine());
                    Console.Write("End ID: ");
                    int endId = int.Parse(Console.ReadLine());
                    DeleteUser(connection, startId, endId);
                    break;

                case 5:
                    ShowUsers(connection);
                    break;

                case 6:
                    Console.WriteLine("Exiting program.");
                    break;

                default:
                    Console.WriteLine("Invalid option.");
                    break;
            }
        } while (choice != 6);
    }
}
