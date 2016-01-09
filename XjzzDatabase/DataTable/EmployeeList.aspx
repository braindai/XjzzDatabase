<%@ Page Title="Teachers Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeList.aspx.cs" Inherits="XjzzDatabase.DataTable.Employees" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="body-content"> 
        <br /> 
<%--         <asp:ListView ID="employeeList"  
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
            </asp:ListView>   --%>   
      
          <a href="EmployeeDetails.aspx"><input class="btn btn-default" type="button" value="添加用户"/></a>
          <hr class ="divider" >  
        <div class="row">       
           <asp:GridView ID="GridViewEmployees" runat="server" AutoGenerateColumns ="False" AllowPaging="True" AllowSorting="True" DataKeyNames="Id" 
               ItemType="XjzzDatabase.Models.Employee" SelectMethod="GridViewEmployees_GetData" DeleteMethod="GridViewEmployees_DeleteItem" CssClass="table" >
                <Columns>
                    <asp:HyperLinkField DataTextField="FullName" DataNavigateUrlFormatString="~/DataTable/EmployeeDetails.aspx?employeeId={0}" DataNavigateUrlFields="Id" />
                    <asp:BoundField DataField="CreateDate" HeaderText="修改日期" SortExpression="CreateDate" />
                    <asp:BoundField DataField="LoginUserName" HeaderText="关联登录名" SortExpression="LoginUserName" />
                    <asp:TemplateField HeaderText="状态">
                        <ItemTemplate>
                            <asp:CheckBox ID="有效" runat="server" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "State")) %>' AutoPostBack="true" OnCheckedChanged="StateCheckedChanged" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick ="return confirm('你确定要删除吗?')" Text="删除"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView> 
            </div>
      </div>  
</asp:Content>