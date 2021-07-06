using DbUp;
using DbUp.Engine;
using System;
using System.Linq;
using System.Reflection;

namespace dbup
{
    class Program
    {
        static void Main(string[] args)
        {
            var connectionString = args.FirstOrDefault() ?? "Host=localhost;Port=5432;Database=dbup";
            EnsureDatabase.For.PostgresqlDatabase(connectionString);
            
            UpgradeEngine upgrader = DeployChanges.To
                .PostgresqlDatabase(connectionString)
                .WithScriptsEmbeddedInAssembly(Assembly.GetExecutingAssembly())
                .LogToConsole()
                .Build();

            DatabaseUpgradeResult result = upgrader.PerformUpgrade();
            if (!result.Successful)
            {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine(result.Error);
                Console.ResetColor();
                return;
            }

            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine("Success!");
            Console.ResetColor();
        }
    }
}
