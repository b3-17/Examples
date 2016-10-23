using System;
using NUnit.Framework;
using Actor;
using System.Collections.Generic;
using System.Linq;

namespace ChickenGeneratorTests
{
	[TestFixture]
	public class ChickenGeneratorTest
	{
		[Test]
		public void ChickenSearchTest()
		{
			var chickenDatabase = ChickenDatabase.AllChickens();

			string searchTerm = "Penny";
			var searchedChickens = ChickenDatabase.ChickenGenerator(chickenDatabase, searchTerm);

			// count is irrelevant!
			//Assert.AreEqual(3, searchedChickens.Count(), "the results were not accurate");

			foreach (Chicken chicken in searchedChickens)
			{
				Assert.AreEqual(searchTerm, chicken.Name, "the name didn't match the search term!");

			}
		}
	}
}
