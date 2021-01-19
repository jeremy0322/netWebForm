using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using netWebForm.Scripts;

namespace netWebForm
{
    public partial class homePage : System.Web.UI.Page
    {
        DataClasses1DataContext db = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string Status = Request.QueryString["status"];

            }


            var Users = db.users.Where(x => x.status == "Active");

            foreach(var user in Users)
            {
                DateTime chkBirthday = user.dob;
                DateTime chkToday = DateTime.Today;

                if (chkToday.Month == chkBirthday.Month && chkToday.Day == chkBirthday.Day)
                    {
                        string dobName = user.userName;
                        string title = "Happy Bithday!";
                        string body = "Today is " + dobName + " birthday...";
                        ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
                }
            }

        }

        //private void SearchUsers()
        //{
        //    DataClasses1DataContext db = new DataClasses1DataContext();
        //    var searchUsers = (from u in db.users where u.userName.ToString() == txtSearch.Text select u);

        //    if(searchUsers != null)
        //    {
        //        DataTable dt = new DataTable();
        //       // sda.Fill(dt);
        //        GridView1.DataSource = dt;
        //        GridView1.DataBind();
        //    }
        //}

        //protected void Search(object sender, EventArgs e)
        //{
        //    this.SearchUsers();
        //}

        //protected void OnPaging(object sender, GridViewPageEventArgs e)
        //{
        //    GridView1.PageIndex = e.NewPageIndex;
        //    this.SearchUsers();
        //}

        protected void LinqDataSource1_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtSearchEmail.Text = "";
            txtSearchUsername.Text = "";
            txtSearchLogin1.Text = "";
            txtSearchLogin2.Text = "";

        }
    }
}