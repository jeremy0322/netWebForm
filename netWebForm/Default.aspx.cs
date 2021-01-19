using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using netWebForm.Scripts;
using System.Web.Security;
using System.Security.Cryptography;
using System.Text;
using System.IO;
using System.Windows;


namespace netWebForm
{
    public partial class _Default : Page
    {
        DataClasses1DataContext db = new DataClasses1DataContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public class Security
        {
            public static string GetHash(string strPass)
            {
                byte[] binPass = Encoding.Default.GetBytes(strPass);

                SHA256 sha = SHA256.Create();
                byte[] binHash = sha.ComputeHash(binPass);
                string strHash = Convert.ToBase64String(binHash);

                return strHash;
            }
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[2].Text = Decrypt(e.Row.Cells[2].Text);
            }
        }

        private string Decrypt(string cipherText)
        {
            string EncryptionKey = "test";
            // where is ur db?
            byte[] cipherBytes = Convert.FromBase64String(cipherText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    cipherText = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
            return cipherText;
        }


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string username = txtUsername.Text;
                string password = txtPassword.Text;
         

                user User = db.users.SingleOrDefault(
                                                 x => x.userName == username
                                                 );

                if (User != null && password == Decrypt(User.password.ToString()))
                {
                    if (User.status == "Suspend")
                    {
                        cvInvalidAcc.IsValid = false;
                        
                    }
                    else
                    { 
                        User.lastLogin = DateTime.Now;

                        db.SubmitChanges();
                        Response.Redirect("homePage.aspx");
                    }
                }
                else
                {
                    cvNotMatched.IsValid = false;
                }

            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Server.Transfer("Default.aspx");
        }
    }
}