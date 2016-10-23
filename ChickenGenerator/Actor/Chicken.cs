using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

namespace Actor
{
	public class Chicken
	{
		public string Name { get; set; }
		public string Plumage { get; set; }
		public int Age { get; set; }
	}

	public static class ChickenDatabase
	{
		public static IEnumerable<Chicken> AllChickens()
		{
			IEnumerable<Chicken> allChickens = new List<Chicken>
			{
				new Actor.Chicken { Name = "Henny", Plumage = "Shiny black with some red", Age = 2 },
				new Actor.Chicken { Name = "Penny", Plumage = "Red and brown", Age = 1 },
				new Actor.Chicken { Name = "Penny", Plumage = "Translucent blue", Age = 3 },
				new Actor.Chicken { Name = "Penny", Plumage = "White and red", Age = 1 }
			};
			foreach (Chicken chicken in allChickens)
			{
				Console.Error.WriteLine(String.Format("From ALL the chickens: {0}", chicken.Name));
				yield return chicken;
			}
		}

		public static IEnumerable<Chicken> ChickenGenerator(IEnumerable<Chicken> chickenDatabase, string searchTerm)
		{
			foreach (Chicken chicken in chickenDatabase)
			{
				if (chicken.Name == searchTerm)
				{
					Console.Error.WriteLine(String.Format("From the search result: {0}", chicken.Name));
					yield return chicken;
				}
			}
		}
	}
}
