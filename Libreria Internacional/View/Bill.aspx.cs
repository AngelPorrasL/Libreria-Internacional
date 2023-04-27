using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using c = Libreria_Internacional.Controller;
using m = Libreria_Internacional.Model;

namespace Libreria_Internacional.View
{
    public partial class Bill : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["loginInfo"] == null)
                {
                    Response.Redirect("Main.aspx?session=false");
                }

                ShowBill();
            }
        }

        public void ShowBill()
        {
            m.LoginResponsePayload session = (m.LoginResponsePayload)Session["loginInfo"];

            c.BuyBook buybookController = new c.BuyBook();

            repBill.DataSource = buybookController.GetCart(session);
            repBill.DataBind();
        }
    }
}