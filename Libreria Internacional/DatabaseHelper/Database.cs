using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using m = Libreria_Internacional.Model;

namespace Libreria_Internacional.DatabaseHelper
{
    public class Database
    {
        const string database = "Libreria";
        const string server = "localhost";
        SqlConnection connection = new SqlConnection($"Data Source={server};Initial Catalog={database};Integrated Security=True");

        public DataTable GetBooks()
        {
            return this.Fill("[dbo].[spGetBooks]", null);
        }

        public DataTable GetBook(int id)
        {
            List<SqlParameter> param = new List<SqlParameter>()
            {
                new SqlParameter("@id", id),
            };

            return this.Fill("[dbo].[spGetBook]", param);
        }

        public DataTable SearchBook(string searchValue)
        {
            List<SqlParameter> param = new List<SqlParameter>();

            if (Int32.TryParse(searchValue, out int isbn))
            {
                param.Add(new SqlParameter("@isbn", isbn));
            }
            else
            {
                param.Add(new SqlParameter("@title", searchValue));
            }

            return this.Fill("[dbo].[spSearch]", param);
        }

        public void SaveBookss(m.BuyBook buybook)
        {
            if (buybook == null)
            {
                throw new ArgumentNullException(nameof(buybook));
            }

            List<SqlParameter> param = new List<SqlParameter>()
            {
                new SqlParameter("@bookId", buybook.Id),
                new SqlParameter("@email", buybook.Session.email),
                new SqlParameter("@name", buybook.Name),
                new SqlParameter("@lastname", buybook.LastName),
                new SqlParameter("@address", buybook.Address),
                new SqlParameter("@country", buybook.Country),
                new SqlParameter("@state", buybook.State),
                new SqlParameter("@zip", buybook.Zip),
                new SqlParameter("@ccnumber", buybook.ccNumber),
                new SqlParameter("@ccexpiration", buybook.ccExpiration),
                new SqlParameter("@securitycode", buybook.SecurityCode),
                new SqlParameter("@cost", buybook.Cost),
                new SqlParameter("@total", buybook.Total),
            };

            this.ExecuteQuery("[dbo].[spSaveBookss]", param);
        }

        public DataTable GetCart(string email)
        {
            List<SqlParameter> param = new List<SqlParameter>()
            {
                new SqlParameter("@email", email),
            };

            return this.Fill("[dbo].[spGetCart]", param);
        }

        public DataTable GetBookCart(int buybookId)
        {
            List<SqlParameter> param = new List<SqlParameter>()
            {
                new SqlParameter("@bookId", buybookId),
            };

            return this.Fill("[dbo].[spGetBookCart]", param);
        }

        public void DeleteBookCart(string email, int buybookId)
        {
            List<SqlParameter> param = new List<SqlParameter>()
            {
                new SqlParameter("@email", email),
                new SqlParameter("@buybookId", buybookId),
            };

            this.ExecuteQuery("[dbo].[spDeleteBookCart]", param);
        }

        public DataTable Fill(string storedProcedure, List<SqlParameter> param)
        {
            try
            {
                using (this.connection)
                {
                    connection.Open();
                    SqlCommand cmd = connection.CreateCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = storedProcedure;

                    if (param != null)
                    {
                        foreach (SqlParameter p in param)
                        {
                            cmd.Parameters.Add(p);
                        }
                    }

                    DataTable ds = new DataTable();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(ds);
                    return ds;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void ExecuteQuery(string storedProcedure, List<SqlParameter> param)
        {
            try
            {
                using (this.connection)
                {
                    connection.Open();
                    SqlCommand cmd = connection.CreateCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = storedProcedure;

                    if (param != null)
                    {
                        foreach (SqlParameter p in param)
                        {
                            cmd.Parameters.Add(p);
                        }
                    }

                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}