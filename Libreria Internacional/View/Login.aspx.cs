using Libreria_Internacional.Model;
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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_ServerClick(object sender, EventArgs e)
        {
            string msg = string.Empty;
            c.Login loginController = new c.Login();

            LoginResponsePayload loginInfo = loginController.SignInWithPassword(new Model.LoginResponsePayload
            {
                email = txtEmail.Value,
                password = txtPassword.Value
            });

            if (loginInfo != null && loginInfo.registered)
            {
                Session["loginInfo"] = loginInfo;
                msg = "Bienvenido! " + txtEmail.Value;
                IsLogged();
            }
            else
            {
                msg = "Correo o contrasenna incorrectos";
            }

            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showModal('Login','" + msg + "')", true);
        }

        public void IsLogged()
        {
            if (Session["loginInfo"] != null)
            {
                m.LoginResponsePayload session = (m.LoginResponsePayload)Session["loginInfo"];

                lblName.InnerText = session.email;
                cardUser.Attributes.Remove("hidden");
            }
        }

        private void IsLogOut()
        {
            if (Session["loginInfo"] == null)
            {
                cardUser.Attributes.Add("hidden", "hidden");
            }
        }

        protected void btnLogout_ServerClick(object sender, EventArgs e)
        {
            Session.Clear();
            IsLogOut();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showModal('Login','Gracias por la visita a Libreria Internacinal')", true);
        }
    }
}