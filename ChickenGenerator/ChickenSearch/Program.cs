using System;
using System.Collections.Generic;
using System.Linq;
using Actor;

namespace ChickenSearch
{
	class MainClass
	{
		public static void Main(string[] args)
		{
			Console.WriteLine("Hi there! Welcome to ChickenActor search! Search by typing in the name below:");
			string searchTerm = Console.ReadLine();
			Console.WriteLine("Search results are ...");

			foreach (var chicken in ChickenDatabase.ChickenGenerator(ChickenDatabase.AllChickens(), searchTerm))
			{
				Console.WriteLine(String.Format("Name: {0}, All important plumage: {1}, Age: {2}",
																			  chicken.Name, chicken.Plumage, chicken.Age.ToString()));
			}
		
			Console.WriteLine("Press enter to exit");
			Console.ReadLine();
		}
	}
}
