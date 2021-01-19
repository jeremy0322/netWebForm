<%@ Page Title="Login Page" Language="C#" MasterPageFile="~/SiteLogin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="netWebForm._Default" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   
    <table style="width: 635px">
        <tr>
            <td>LOGIN</td>
        </tr>
        <tr>
            <td>Username :</td>
            <td>
                <asp:TextBox ID="txtUsername" runat="server" MaxLength="50" placeholder="Enter Username"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername" CssClass="error" Display="Dynamic" ErrorMessage="Please enter [Username]" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Password :</td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="50" placeholder="Enter Password"></asp:TextBox>    
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" CssClass="error" Display="Dynamic" ErrorMessage="Please enter [Password]" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="cvNotMatched" runat="server" CssClass="error" Display="Dynamic" ErrorMessage="[Password] and [Username] not matched" ForeColor="Red"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [user]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:CustomValidator ID="cvInvalidAcc" runat="server" CssClass="error" Display="Dynamic" ErrorMessage="User account has been suspended." ForeColor="Red"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                <asp:Button ID="btnReset" runat="server" Text="Reset" CausesValidation="False" OnClick="btnReset_Click" />
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <p>
                    No account yet? Please
                    [ <a href="registerPage.aspx">Register</a> ].
                </p>
            </td>
        </tr>
    </table>



    

</asp:Content>
