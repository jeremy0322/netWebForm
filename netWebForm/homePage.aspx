<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="homePage.aspx.cs" Inherits="netWebForm.homePage" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script src="vendors/jquery-1.9.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="vendors/easypiechart/jquery.easy-pie-chart.js"></script>
    <script src="assets/scripts.js"></script>
    <script type="text/javascript">
        function ShowPopup(title, body) {
            $("#MyPopup .modal-title").html(title);
            $("#MyPopup .modal-body").html(body);
            $("#MyPopup").modal("show");
        }
    </script>

    <!-- Bootstrap -->
    <script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script>
    <script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js'></script>
    <link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css'
        media="screen" />
    <!-- Bootstrap -->
    <!-- Modal Popup -->
    <div id="MyPopup" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title">
                    </h4>
                </div>
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        Close</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal Popup -->

    <p>

        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="netWebForm.Scripts.DataClasses1DataContext" EntityTypeName="" Select="new (Id, userName, email, lastLogin, dob, createOn, modifiedOn, status)" TableName="users" OnSelecting="LinqDataSource1_Selecting" Where="@status == null || status == @status || @email == null" OrderBy="createOn desc">
            <WhereParameters>
                <asp:QueryStringParameter Name="status" QueryStringField="status" Type="String" />
            </WhereParameters>
      
        </asp:LinqDataSource>

        <asp:QueryExtender ID="QueryExtender1" runat="server" TargetControlID="LinqDataSource1">

            <asp:SearchExpression DataFields="userName" SearchType="Contains">
                <asp:ControlParameter ControlID="txtSearchUsername" />
            </asp:SearchExpression>

            <asp:SearchExpression DataFields="email" SearchType="Contains">
                <asp:ControlParameter ControlID="txtSearchEmail" />
            </asp:SearchExpression>

            <asp:RangeExpression DataField="lastLogin" MinType="Inclusive" MaxType="Inclusive">
                 <asp:ControlParameter ControlID="txtSearchLogin1" DbType="Date"  />
                 <asp:ControlParameter ControlID="txtSearchLogin2" DbType="Date" />
         </asp:RangeExpression>

            <%--<asp:SearchExpression DataFields="lastLogin" SearchType="StartsWith">
                <asp:ControlParameter ControlID="txtSearchLogin"/>
            </asp:SearchExpression>--%>

        </asp:QueryExtender>

    </p>
    <h3><a href="Insert.aspx">Insert</a></h3>

    <p>
        Filter:
                <a href="homePage.aspx">All</a> |
                <a href="homePage.aspx?status=Active">Active</a> |
                <a href="homePage.aspx?status=Suspend">Suspend</a>
    </p>

    <p>
    </p>

    <p>
    </p>

    <table style="width: 829px; height: 58px">  
        <tr>  
            <td style="width: 21px">   
                Search UserName : 
            </td>  
            <td style="width: 207px">  
                <asp:TextBox ID="txtSearchUsername" runat="server"  Width="210px" Height="22px" CausesValidation="False" placeholder="Search UserName"></asp:TextBox> 
            </td>  
       </tr>  
        <tr>  
            <td style="width: 21px">   
                Search Email : 
            </td>  
            <td style="width: 207px">  
                <asp:TextBox ID="txtSearchEmail" runat="server"  Width="210px" Height="22px" CausesValidation="False" placeholder="Search Email"></asp:TextBox> 
            </td>  
       </tr>  
        <tr>  
            <td style="width: 21px">   
                Search Last Login : 
            </td>  
            <td style="width: 207px">  
                <asp:TextBox ID="txtSearchLogin1" runat="server"  Width="210px" Height="22px" CausesValidation="False" textmode="Date"></asp:TextBox> 
                TO
                <asp:TextBox ID="txtSearchLogin2" runat="server"  Width="210px" Height="22px" CausesValidation="False" textmode="Date"></asp:TextBox> 
            </td>  
       </tr> 
        <tr>
            <td style="width: 21px">
                <asp:Button ID="btnSearch" runat="server" Text="Search" />
                <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" />
            </td>
        </tr>
    </table>  

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="gridview" DataSourceID="LinqDataSource1" Width="1400px">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="userName" HeaderText="USER NAME" ReadOnly="True" SortExpression="userName" />
            <asp:BoundField DataField="email" HeaderText="EMAIL" ReadOnly="True" SortExpression="email" />
            <asp:BoundField DataField="dob" HeaderText="DOB" ReadOnly="True" SortExpression="dob" />
            <asp:BoundField DataField="lastLogin" HeaderText="LAST LOGIN" ReadOnly="True" SortExpression="lastLogin" />
            <asp:BoundField DataField="createOn" HeaderText="CREATE ON" ReadOnly="True" SortExpression="createOn" />
            <asp:BoundField DataField="modifiedOn" HeaderText="MODIFIED ON" ReadOnly="True" SortExpression="modifiedOn" />
            <asp:TemplateField HeaderText="STATUS" SortExpression="status">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("status") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="16px" ImageAlign="TextTop" ImageUrl='<%# Eval("status", "Image/{0}.png") %>' Width="16px" />
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="userName" DataNavigateUrlFormatString="Update.aspx?userName={0}" Text="Edit" />
        </Columns>
        <SortedAscendingHeaderStyle CssClass="sort-asc" />
        <SortedDescendingHeaderStyle CssClass="sort-desc" />
    </asp:GridView>
    

</asp:Content>