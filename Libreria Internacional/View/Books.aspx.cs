using Libreria_Internacional.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using c = Libreria_Internacional.Controller;
using m = Libreria_Internacional.Model;

namespace Libreria_Internacional.View
{
    public partial class Books : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["loginInfo"] == null)
                {
                    Response.Redirect("Main.aspx?session=false");
                }

                int id = Convert.ToInt16(Request.QueryString["id"]);
                //string BuyBookId = Request.QueryString["BuyBookId"];

                c.Book bookController = new c.Book();
                //c.BuyBooks buybookController = new c.BuyBooks();
                List<m.Book> book = bookController.GetBook(id);
                Session["book"] = book;

                CalculateBookCost(false);

                repBooks.DataSource = book;
                repBooks.DataBind();
            }
        }

        private void CalculateBookCost(bool flag)
        {
            List<m.Book> book = (List<m.Book>)Session["book"];

            m.BuyBook buybook = new m.BuyBook()
            {
                Id = book[0].Id,
                Session = (m.LoginResponsePayload)Session["loginInfo"],
                Price = book[0].Price
            };

            buybook.Cost = buybook.GetCost();
            buybook.Total = buybook.GetTotal();

            /*lblPrice.InnerText = buybook.Price.ToString();
            lblCost.InnerText = buybook.Cost.ToString();
            lblTotal.InnerText = buybook.Total.ToString();*/

            buybook.isReady = flag;
            Session["BuyBook"] = buybook;
        }

        protected void btnSave_ServerClick(object sender, EventArgs e)
        {
            //string buybookId = Request.QueryString["buybookId"];
            string msg = string.Empty;
            m.BuyBook buybook = (m.BuyBook)Session["BuyBook"];

            if (buybook.isReady)
            {
                c.BuyBook controllerBuyBook = new c.BuyBook();

                if (controllerBuyBook.SaveBook(buybook))
                {
                    msg = "Tu compra fue realizada con exito!";
                }
                else
                {
                    msg = "Error al intentar ejecutar la compra";
                }
            }
            else
            {
                msg = "Por favor completa todo antes de realizar la compra";
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showModal('Informacion de la compra','" + msg + "')", true);
        }
    }
}