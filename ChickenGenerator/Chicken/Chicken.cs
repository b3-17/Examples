using System;
using System.Collections;
using System.Collections.Generic;
namespace Actors
{
	public class Chicken
	{
		public string Name { get; set; }
		public string Plumage { get; set; }
		public int Age { get; set; }
	}

	public static class ChickenDatabase
	{
		public static List<Actors.Chicken> AllChickens()
		{
			return new List<Actors.Chicken>
			{
				new Actors.Chicken{ Name = "Henny", Plumage = "Shiny black with some red", Age = 2 },
				new Actors.Chicken { Name = "Penny", Plumage = "Red and brown", Age = 1 }
			};
		}
	}
}
