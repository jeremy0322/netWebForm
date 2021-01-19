<%@ Page Title="Update" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="netWebForm.Update" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Update User</h1>
    <table style="width: 635px">
        <tr>
            <td>Id :</td>
            <td>
                <asp:Label ID="lblId" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>Username :</td>
            <td>
                <asp:Label ID="lblUserName" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
            </td>
        </tr>
        
        <tr>
            <td>Email :</td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" MaxLength="100" placeholder="Enter Email"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail" CssClass="error" Display="Dynamic" ErrorMessage="Please enter [Email]" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td>Date of Brith :</td>
            <td>
                <asp:TextBox ID="txtDOD" runat="server" MaxLength="15" placeholder="Enter DOB"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDOD" CssClass="error" Display="Dynamic" ErrorMessage="Please enter [DOB]" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td>Status:</td>
            <td>
                <asp:DropDownList ID="ddlStatus" runat="server">
                    <asp:ListItem>Active</asp:ListItem>
                    <asp:ListItem>Suspend</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>

    </table>
    <p>
        <asp:Button ID="btnInsert" runat="server" Text="Update" OnClick="btnUpdate_Click" />
        <asp:Button ID="btnBack" runat="server" Text="Cancel" CausesValidation="False" OnClick="btnCancel_Click" />
        <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
    </p>

</asp:Content>