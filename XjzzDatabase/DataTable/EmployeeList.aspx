<%@ Page Title="Teachers Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeList.aspx.cs" Inherits="XjzzDatabase.DataTable.Employees" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="body-content">  
         <asp:ListView ID="employeeList"  
                ItemType="XjzzDatabase.Models.Employee" 
                runat="server"
                SelectMethod="GetEmployee" >
                <ItemTemplate>
                    <b style="font-size: large; font-style: normal">   
                     <a  href ="EmployeeDetails.aspx?employeeId=<%#:Item.Id %>">
                        <%#: Item.FamilyName %> <%#: Item.FirstName %>     
                     </a>               
                    </b>
                </ItemTemplate>
                <ItemSeparatorTemplate>  |  </ItemSeparatorTemplate>
            </asp:ListView>  
      </div>  
</asp:Content>