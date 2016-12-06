using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.String;

namespace Task1
{
    public static class FunctionOfKebabShawarma
    {
        /// <summary>
        /// Add new ingradient category in database.
        /// </summary>
        /// <param name="ingradientCategoryName">Name new ingradient category.</param>

        public static void AddIngradientCategory(string ingradientCategoryName)
        {
            if (IsNullOrEmpty(ingradientCategoryName))
                throw new ArgumentException();

            using (var ctx = new ShawarmaEntities())
            {
                IngradientCategory ingradientCategory = new IngradientCategory { CategoryName = ingradientCategoryName };
                ctx.IngradientCategories.Add(ingradientCategory);
                ctx.SaveChanges();
            }
        }

        /// <summary>
        /// Add new ingradient in database.
        /// </summary>
        /// <param name="ingradientName">Name new ingradient.</param>
        /// <param name="totalWeight">Total weight shawarma ingradients.</param>
        /// <param name="idIngradientCategory">Id ingradient category name.</param>
        public static void AddIngradient(string ingradientName, int totalWeight, int idIngradientCategory)
        {
            if (IsNullOrEmpty(ingradientName))
                throw new ArgumentException();

            using (var ctx = new ShawarmaEntities())
            {
                int maxId = ctx.IngradientCategories.Select(s => s.CategoryId).Max();

                if (idIngradientCategory <= 0 || idIngradientCategory > maxId)
                {
                    idIngradientCategory = 1;
                }

                Ingradient ingradient = new Ingradient { IngradientName = ingradientName, TotalWeight = totalWeight, CategoryId = idIngradientCategory };
                ctx.Ingradients.Add(ingradient);
                ctx.SaveChanges();
            }
        }

        /// <summary>
        /// Reduce ingradient weight from database.
        /// </summary>
        /// <param name="ingradientName">Name ingradient.</param>
        /// <param name="reduceWeight">Reduce weight shawarma ingradients.</param>

        public static void ReduceIngradient(string ingradientName, int reduceWeight)
        {
            if (IsNullOrEmpty(ingradientName))
                throw new ArgumentException();

            using (var ctx = new ShawarmaEntities())
            {
                Ingradient ingradient = ctx.Ingradients
                    .FirstOrDefault(ingr => ingr.IngradientName == ingradientName);


                if (ingradient?.TotalWeight < reduceWeight)
                {
                    throw new ArgumentException();
                }

                Debug.Assert(ingradient != null, "ingradient != null");
                ingradient.TotalWeight -= reduceWeight;

                ctx.Ingradients.AddOrUpdate(ingradient);
                ctx.SaveChanges();
            }

        }

        public static void AddNewReciptShawarma()
        {
        }
    }
}
