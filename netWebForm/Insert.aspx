<%@ Page Title="Insert" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Insert.aspx.cs" Inherits="netWebForm.Insert" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Insert User</h1>
    <table style="width: 635px">
        <tr>
            <td>Username :</td>
            <td>
                <asp:TextBox ID="txtUsername" runat="server" MaxLength="50" placeholder="Entername"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername" CssClass="error" Display="Dynamic" ErrorMessage="Please enter [Username]" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtUsername" CssClass="error" Display="Dynamic" ErrorMessage="The [Username] has been used" OnServerValidate="CustomValidator1_ServerValidate" ForeColor="Red"></asp:CustomValidator>
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
            <td>Password :</td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="50" placeholder="Enter Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" CssClass="error" Display="Dynamic" ErrorMessage="Please enter [Password]" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td>Confirm Password :</td>
            <td>
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" MaxLength="50" placeholder="Enter Confirm Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtConfirmPassword" CssClass="error" Display="Dynamic" ErrorMessage="Please enter [Confirm Password]" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" CssClass="error" Display="Dynamic" ErrorMessage="[Confirm Password] and [Password] not matched" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>

        <tr>
            <td>Date of Brith :</td>
            <td>
                <asp:TextBox ID="txtDOD" runat="server" MaxLength="10" textmode="Date"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDOD" CssClass="error" Display="Dynamic" ErrorMessage="Please enter [DOB]" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>

    </table>
    <p>
        <asp:Button ID="btnInsert" runat="server" Text="Insert" OnClick="btnInsert_Click" />
        <asp:Button ID="btnReset" runat="server" Text="Reset" CausesValidation="False" OnClick="btnReset_Click" />
        <asp:Button ID="btnBack" runat="server" Text="Back" CausesValidation="False" OnClick="btnBack_Click" />
    </p>


</asp:Content>