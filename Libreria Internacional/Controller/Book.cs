using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Web;
using m = Libreria_Internacional.Model;

namespace Libreria_Internacional.Controller
{
    public class Book
    {
        public List<m.Book> GetBooks()
        {
            DatabaseHelper.Database db = new DatabaseHelper.Database();

            DataTable ds = db.GetBooks();

            return ConvertDSToList(ds);
        }

        public List<m.Book> GetBook(int id)
        {
            DatabaseHelper.Database db = new DatabaseHelper.Database();

            DataTable ds = db.GetBook(id);

            return ConvertDSToList(ds);
        }

        public List<m.Book> SearchBook(string searchValue)
        {
            DatabaseHelper.Database db = new DatabaseHelper.Database();

            DataTable ds = db.SearchBook(searchValue);

            return ConvertDSToList(ds);
        }

        public List<m.Book> ConvertDSToList(DataTable ds)
        {
            List<m.Book> booksList = new List<m.Book>();

            foreach (DataRow row in ds.Rows)
            {
                booksList.Add(new m.Book
                {
                    Id = Convert.ToInt16(row["id"]),
                    ISBN = Convert.ToInt16(row["isbn"]),
                    Title = row["title"].ToString(),
                    Autor = row["autor"].ToString(),
                    Publication = row["publication"].ToString(),
                    Photo = row["photo"].ToString(),
                    Price = Convert.ToDecimal(row["price"])
                });
            }

            return booksList;
        }
    }
}