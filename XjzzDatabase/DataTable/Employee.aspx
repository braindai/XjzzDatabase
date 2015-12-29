<%@ Page Title="Teachers Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="XjzzDatabase.DataTable.Employees" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="body-content">  
         <asp:ListView ID="categoryList"  
                ItemType="XjzzDatabase.Models.Employee" 
                runat="server"
                SelectMethod="GetEmployee" >
                <ItemTemplate>
                    <b style="font-size: large; font-style: normal">   
                        <%#: Item.Name %>                   
                    </b>
                </ItemTemplate>
                <ItemSeparatorTemplate>  |  </ItemSeparatorTemplate>
            </asp:ListView>    
    </div>

    </div>
</asp:Content>