using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using c = Libreria_Internacional.Controller;
using m = Libreria_Internacional.Model;

namespace Libreria_Internacional.View
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["loginInfo"] == null)
                {
                    Response.Redirect("Main.aspx?session=false");
                }

                LoadBookings();
            }
        }

        public void LoadBookings()
        {
            m.LoginResponsePayload session = (m.LoginResponsePayload)Session["loginInfo"];

            c.BuyBook buybookController = new c.BuyBook();

            repCart.DataSource = buybookController.GetCart(session);
            repCart.DataBind();
        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            var button = (HtmlButton)sender;
            Session["buybookId"] = Convert.ToInt16(button.Attributes["dataId"]);

            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction",
                "showModal('Eliminar del carrito','Deseas eliminar este libro de tu carrito de compras?')", true);
        }
    }
}