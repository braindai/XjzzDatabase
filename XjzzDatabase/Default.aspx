<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="XjzzDatabase._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <div>
            基础表：<br />
            <ul class="nav nav-pills">
           <li><a runat="server" href="~/DataTable/EmployeeList">教职工</a></li>
           <li><a runat="server" href="~/DataTable/PaperList">论文</a></li>
            </ul>
         </div>
        <div>
            关联表：</div>
    </div>
    <div class="row">
        <div class="h4">
            开发中...</div>
    </div>
</asp:Content>
