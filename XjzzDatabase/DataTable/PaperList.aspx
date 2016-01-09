<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PaperList.aspx.cs" Inherits="XjzzDatabase.DataTable.PaperList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <div class ="body-content"">

         <div class ="form_group">
             <input id="test" type="text" runat="server" />
             </div>
        <div class ="form group">
            <asp:Label ID="LabelTitle" runat="server" Text="标题" CssClass ="col-md-5 control-label"></asp:Label>          
            <asp:TextBox ID="TextBoxTitle" runat="server" CssClass="col-md-10"></asp:TextBox>
            <asp:Button ID="ButtonSearch" runat="server" Text="查找" OnClick="ButtonSearch_Click" />
        </div>
        <div class =" form group">
            <asp:GridView ID="GridViewPapers" runat="server" AutoGenerateColumns ="false" >
                <Columns>
                    <asp:TemplateField HeaderText="Test">
                          <itemTemplate>
                                <a runat="server" href="~/"><%# Eval("FullName") %></a>
                         </ItemTemplate>                       
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
