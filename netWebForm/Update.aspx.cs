using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using netWebForm.Scripts;

namespace netWebForm
{
    public partial class Update : System.Web.UI.Page
    {
        DataClasses1DataContext db = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) // Initial page load
            {
                string username = Request.QueryString["userName"];

                user User = db.users.SingleOrDefault(x => x.userName == username);
                if (User != null)
                {
                    lblId.Text = User.Id.ToString();
                    lblUserName.Text = User.userName;
                    txtEmail.Text = User.email;
                    txtDOD.Text = User.dob.ToString("dd/MM/yyyy");
                    ddlStatus.Text = User.status;
                }
                else
                {
                    Response.Redirect("homePage.aspx");
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string Dob = txtDOD.Text;
                string Email = txtEmail.Text;
                DateTime ModifiedOn = DateTime.Now;
                string Status = ddlStatus.Text;

                user User = db.users.SingleOrDefault(x => x.userName == lblUserName.Text);
                if (User != null)
                {
                    User.email = Email;
                    User.dob = DateTime.Parse(Dob);
                    User.modifiedOn = ModifiedOn;
                    User.status = Status;

                    db.SubmitChanges();
                    Response.Redirect("homePage.aspx");
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("homePage.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            user User = db.users.SingleOrDefault(x => x.userName == lblUserName.Text);

            if (User != null)
            {
                db.users.DeleteOnSubmit(User);
                db.SubmitChanges();
                Response.Redirect("homePage.aspx");
            }
        }
    }
}