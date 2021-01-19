using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using netWebForm.Scripts;
using System.Web.Security;
using System.Security.Cryptography;
using System.Text;
using System.Globalization;
using System.IO;

namespace netWebForm
{
    public partial class registerPage : Page
    {
        DataClasses1DataContext db = new DataClasses1DataContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string username = args.Value;

            // Check for duplicated username
            if (db.users.Any(u => u.userName == username))
            {
                args.IsValid = false;
            }
            
        }

        private string Encrypt(string clearText)
        {
            string EncryptionKey = "test";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string Username = txtUsername.Text;
                string Email = txtEmail.Text;
                string Password = txtPassword.Text;
                DateTime Dob = DateTime.Parse(txtDOD.Text);
                DateTime CreatedOn = DateTime.Now;
                DateTime ModifiedOn = DateTime.Now;
                DateTime LastLogin = DateTime.Now;
                string Status = "Active";

                // Insert new user account
                user u = new user
                {
                    Id = Guid.NewGuid(),
                    userName = Username,
                    email = Email,
                    password = Encrypt(Password.Trim()),
                    lastLogin = LastLogin,
                    dob = Dob,
                    createOn = CreatedOn,
                    modifiedOn = ModifiedOn,
                    status = Status
                };

                db.users.InsertOnSubmit(u);
                db.SubmitChanges();

                Response.Redirect("Default.aspx");
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Server.Transfer("registerPage.aspx");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Server.Transfer("Default.aspx");
        }
    }
}