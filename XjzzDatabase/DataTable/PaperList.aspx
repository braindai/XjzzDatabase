<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PaperList.aspx.cs" Inherits="XjzzDatabase.DataTable.PaperList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="row">
            <div class="col-md-8">               
                 <h3><span style="margin-right: 20px">查询条件</span>
                     <span style="margin-right: 20px"><a runat="server" href="#" onclick="javaScript:window.open('PaperDetails.aspx')">添加论文</a></span>
                     <span style="margin-right: 20px"><a runat="server" href="#" onclick="javaScript:window.open('PaperImport.aspx')">批量导入</a></span>
                 </h3>   
                <hr />
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="TitleTextBox" CssClass="col-md-2 control-label">标题</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox ID="TitleTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>                
                <div class="form-group">
                    <asp:Button ID="ButtonSearch" runat="server" Text="查找" CssClass="btn btn-default" OnClick="ButtonSearch_Click" />
                </div>
            </div>
        </div>
        <hr />
        <div class=" row">
            <asp:Label ID="LabelResultNums" runat="server" Text="数目:0"></asp:Label>
            <asp:GridView ID="GridViewPapers" runat="server" ItemType="XjzzDatabase.DataTable.PaperQueryList" AutoGenerateColumns="False" AllowPaging="True"   AllowSorting="True" 
                DataKeyNames="Id" SelectMethod="GridViewPapers_GetData" DeleteMethod="GridViewPapers_DeleteItem" CssClass="table">
                <Columns>
                    <asp:TemplateField HeaderText="序号">
                        <ItemTemplate>
                            <asp:Label runat="server" Text=" <%# this.GridViewPapers.PageIndex * this.GridViewPapers.PageSize + this.GridViewPapers.Rows.Count + 1 %>"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="标题" SortExpression="Title">
                        <ItemTemplate>
                            <a href="#" onclick="javaScript:window.open('PaperDetails.aspx?paperId=<%#Eval("Id")%>')"><%#Eval("Title") %></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="已验证" SortExpression="Verified">
                        <ItemTemplate>
                            <asp:CheckBox ID="VerifiedCheckBox" runat="server" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "Verified")) %>' AutoPostBack="true" OnCheckedChanged="VerifiedCheckedChanged" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="已锁定" SortExpression="Locked" >
                        <ItemTemplate>
                            <asp:CheckBox ID="LockedCheckBox" runat="server" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "Locked")) %>' AutoPostBack="true" OnCheckedChanged="LockedCheckedChanged" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False" HeaderText="删除">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('你确定要删除吗?')" Text="删除"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
</asp:Content>
