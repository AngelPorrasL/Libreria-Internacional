using Libreria_Internacional.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using m = Libreria_Internacional.Model;

namespace Libreria_Internacional.Controller
{
    public class BuyBook
    {
        public bool SaveBook(m.BuyBook buybook)
        {
            try
            {
                DatabaseHelper.Database db = new DatabaseHelper.Database();

                db.SaveBookss(buybook);

                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool DeleteBookCart(string email, int buybookId)
        {
            try
            {
                DatabaseHelper.Database db = new DatabaseHelper.Database();

                db.DeleteBookCart(email, buybookId);

                return true;
            }
            catch
            {
                return false;
            }
        }

        public m.BuyBook GetBookCart(int buybookId)
        {
            DatabaseHelper.Database db = new DatabaseHelper.Database();

            DataTable ds = db.GetBookCart(buybookId);

            foreach (DataRow row in ds.Rows)
            {
                return new m.BuyBook
                {
                    Id = Convert.ToInt16(row["bookId"]),
                    BuyBookId = Convert.ToInt16(row["buybookId"]),
                    Name = row["name"].ToString(),
                    LastName = row["lastname"].ToString(),
                    Address = row["address"].ToString(),
                    Country = row["country"].ToString(),
                    State = row["state"].ToString(),
                    Zip = Convert.ToInt16(row["zip"]),
                    ccNumber = Convert.ToInt16(row["ccnumber"]),
                    ccExpiration = row["ccexpiration"].ToString(),
                    SecurityCode = Convert.ToInt16(row["securitycode"]),
                    Cost = Convert.ToDecimal(row["cost"]),
                    Total = Convert.ToDecimal(row["total"]),
                };
            }

            return null;
        }

        public List<m.BuyBook> GetCart(LoginResponsePayload session)
        {
            List<m.BuyBook> cartList = new List<m.BuyBook>();
            DatabaseHelper.Database db = new DatabaseHelper.Database();

            DataTable ds = db.GetCart(session.email);

            foreach (DataRow row in ds.Rows)
            {
                cartList.Add(new m.BuyBook
                {
                    Id = Convert.ToInt16(row["bookId"]),
                    BuyBookId = Convert.ToInt16(row["buybookId"]),
                    Name = row["name"].ToString(),
                    LastName = row["lastname"].ToString(),
                    Address = row["address"].ToString(),
                    Country = row["country"].ToString(),
                    State = row["state"].ToString(),
                    Zip = Convert.ToInt16(row["zip"]),
                    ccNumber = Convert.ToInt16(row["ccnumber"]),
                    ccExpiration = row["ccexpiration"].ToString(),
                    SecurityCode = Convert.ToInt16(row["securitycode"]),
                    Cost = Convert.ToDecimal(row["cost"]),
                    Total = Convert.ToDecimal(row["total"]),
                    Photo = row["photo"].ToString(),
                    Title = row["title"].ToString(),
                });
            }

            return cartList;
        }
    }
}