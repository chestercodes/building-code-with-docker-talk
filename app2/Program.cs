using System;

Console.WriteLine("App started :)");

if (args.Length > 0)
    foreach (var arg in args) Console.WriteLine($"Argument={arg}");
else
    Console.WriteLine("No arguments");

PrintOutEnvVar("THE_ARG_VAR");
PrintOutEnvVar("THE_ENV_VAR");

void PrintOutEnvVar (string name)
{
    var v = Environment.GetEnvironmentVariable(name);
    if(string.IsNullOrEmpty(v))
        Console.WriteLine($"The env var {name} is null or empty");
    else
        Console.WriteLine($"The env var {name} equals {v}");
}