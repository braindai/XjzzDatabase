<%@ Page Title="Teachers Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeList.aspx.cs" Inherits="XjzzDatabase.DataTable.Employees" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

        <br /> 
      
          <a href="EmployeeDetails.aspx"><input class="btn btn-default" type="button" value="添加教职工"/></a>
          <hr />  
        <div class="row">
            <div class ="col-md-8">
            <asp:GridView ID="GridViewEmployees" runat="server" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" DataKeyNames="Id"
                ItemType="XjzzDatabase.Models.Employee" SelectMethod="GridViewEmployees_GetData" DeleteMethod="GridViewEmployees_DeleteItem" CssClass="table">
                <Columns>
                    <asp:TemplateField HeaderText="用户姓名" SortExpression="FullName">
                        <ItemTemplate>
                            <a href="#" onclick="javaScript:window.open('EmployeeDetails.aspx?employeeId=<%#Eval("Id")%>')"><%#Eval("FullName") %></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="CreateDate" HeaderText="最后修改日期" SortExpression="CreateDate" />
                    <asp:BoundField DataField="LoginUserName" HeaderText="关联登录名" SortExpression="LoginUserName" />
                    <asp:TemplateField HeaderText="状态" SortExpression="State">
                        <ItemTemplate>
                            <asp:CheckBox ID="有效" runat="server" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "State")) %>' AutoPostBack="true" OnCheckedChanged="StateCheckedChanged" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False" HeaderText="删除">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('你确定要删除吗?')" Text="删除"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>                 
                <HeaderStyle HorizontalAlign="Center" />
                <RowStyle HorizontalAlign="Center" />
            </asp:GridView>
                </div>
        </div>
</asp:Content>