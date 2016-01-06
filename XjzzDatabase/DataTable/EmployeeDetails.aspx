<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeDetails.aspx.cs" Inherits="XjzzDatabase.DataTable.EmployeeDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="body-content">
        <div class="form group">
            <asp:Button ID="Button_Save" runat="server" CssClass="btn btn-default" Text="保存" />
            <asp:Button ID="Button_Delete" runat="server" CssClass="btn btn-default" Text="删除" />
        </div>
        <br />
        <p class="text-danger">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>
        <div class="row">
            <div class="col-md-3 ">
                <asp:Label runat="server" Text="姓" AssociatedControlID="FamilyNameTextBox" Style="float: left"></asp:Label>
                <asp:TextBox ID="FamilyNameTextBox" runat="server" Style="float: left; margin-left: 10px"></asp:TextBox>
            </div>
            <div class="col-md-3 ">
                <asp:Label ID="Label1" runat="server" Text="名" AssociatedControlID="FirstNameTextBox" Style="float: left"></asp:Label>
                <asp:TextBox ID="FirstNameTextBox" runat="server" Style="float: left; margin-left: 10px"></asp:TextBox>
            </div>
        </div>
        <br />
        <div class="tabbable" id="tabs-employee">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#panel-base" data-toggle="tab">基本信息</a>
                </li>
                <li>
                    <a href="#panel-other" data-toggle="tab">其他信息</a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="panel-base">
                    <div class="container">
                        <div class="row">
                            <br />
                            <div class="col-md-8">
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="SexDropDownList" CssClass="col-md-1 control-label">性别</asp:Label>
                                    <div class="col-md-11">
                                        <asp:DropDownList ID="SexDropDownList" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="ProfTitleTextBox" CssClass="col-md-1 control-label">职称</asp:Label>
                                    <div class="col-md-11">
                                        <asp:TextBox runat="server" ID="ProfTitleTextBox" CssClass=" form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="DeptTextBox" CssClass="col-md-1 control-label">部门</asp:Label>
                                    <div class="col-md-11">
                                        <asp:TextBox runat="server" ID="DeptTextBox" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="LabTextBox" CssClass="col-md-1 control-label">部门</asp:Label>
                                    <div class="col-md-11">
                                        <asp:TextBox runat="server" ID="LabTextBox" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="GroupTextBox" CssClass="col-md-1 control-label">团队</asp:Label>
                                    <div class="col-md-11">
                                        <asp:TextBox runat="server" ID="GroupTextBox" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="TypesTextBox" CssClass="col-md-1 control-label">类型</asp:Label>
                                    <div class="col-md-11">
                                        <asp:TextBox runat="server" ID="TypesTextBox" CssClass="form-control" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <img alt="200x300" src="img/a.jpg" />

                            </div>
                        </div>
                    </div>
                    <%--<asp:FormView ID="FormView1" runat="server">
                            <EditItemTemplate>
                                Id:
                                <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                                <br />
                                LoginUserName:
                                <asp:TextBox ID="LoginUserNameTextBox" runat="server" Text='<%# Bind("LoginUserName") %>' />
                                <br />
                                FullName:
                                <asp:TextBox ID="FullNameTextBox" runat="server" Text='<%# Bind("FullName") %>' />
                                <br />
                                EnglishFamilyName:
                                <asp:TextBox ID="EnglishFamilyNameTextBox" runat="server" Text='<%# Bind("EnglishFamilyName") %>' />
                                <br />
                                EnglishFirstName:
                                <asp:TextBox ID="EnglishFirstNameTextBox" runat="server" Text='<%# Bind("EnglishFirstName") %>' />
                                <br />
                                EnglishFullName:
                                <asp:TextBox ID="EnglishFullNameTextBox" runat="server" Text='<%# Bind("EnglishFullName") %>' />
                                <br />
                                Sex:
                                <asp:TextBox ID="SexTextBox" runat="server" Text='<%# Bind("Sex") %>' />
                                <br />
                                ProfTitle:
                                <asp:TextBox ID="ProfTitleTextBox" runat="server" Text='<%# Bind("ProfTitle") %>' />
                                <br />
                                Dept:
                                <asp:TextBox ID="DeptTextBox" runat="server" Text='<%# Bind("Dept") %>' />
                                <br />
                                Lab:
                                <asp:TextBox ID="LabTextBox" runat="server" Text='<%# Bind("Lab") %>' />
                                <br />
                                Group:
                                <asp:TextBox ID="GroupTextBox" runat="server" Text='<%# Bind("Group") %>' />
                                <br />
                                Types:
                                <asp:TextBox ID="TypesTextBox" runat="server" Text='<%# Bind("Types") %>' />
                                <br />
                                Education:
                                <asp:TextBox ID="EducationTextBox" runat="server" Text='<%# Bind("Education") %>' />
                                <br />
                                Position:
                                <asp:TextBox ID="PositionTextBox" runat="server" Text='<%# Bind("Position") %>' />
                                <br />
                                State:
                                <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
                                <br />
                                Email:
                                <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                                <br />
                                OfficePhone:
                                <asp:TextBox ID="OfficePhoneTextBox" runat="server" Text='<%# Bind("OfficePhone") %>' />
                                <br />
                                MobilePhone:
                                <asp:TextBox ID="MobilePhoneTextBox" runat="server" Text='<%# Bind("MobilePhone") %>' />
                                <br />
                                OfficePositon:
                                <asp:TextBox ID="OfficePositonTextBox" runat="server" Text='<%# Bind("OfficePositon") %>' />
                                <br />
                                EmergencyPhone:
                                <asp:TextBox ID="EmergencyPhoneTextBox" runat="server" Text='<%# Bind("EmergencyPhone") %>' />
                                <br />
                                IdNumbers:
                                <asp:TextBox ID="IdNumbersTextBox" runat="server" Text='<%# Bind("IdNumbers") %>' />
                                <br />
                                EmergencyPerson:
                                <asp:TextBox ID="EmergencyPersonTextBox" runat="server" Text='<%# Bind("EmergencyPerson") %>' />
                                <br />
                                Nationality:
                                <asp:TextBox ID="NationalityTextBox" runat="server" Text='<%# Bind("Nationality") %>' />
                                <br />
                                Nation:
                                <asp:TextBox ID="NationTextBox" runat="server" Text='<%# Bind("Nation") %>' />
                                <br />
                                NativePlace:
                                <asp:TextBox ID="NativePlaceTextBox" runat="server" Text='<%# Bind("NativePlace") %>' />
                                <br />
                                OtherNames:
                                <asp:TextBox ID="OtherNamesTextBox" runat="server" Text='<%# Bind("OtherNames") %>' />
                                <br />
                                Birthday:
                                <asp:TextBox ID="BirthdayTextBox" runat="server" Text='<%# Bind("Birthday") %>' />
                                <br />
                                DateWhenIn:
                                <asp:TextBox ID="DateWhenInTextBox" runat="server" Text='<%# Bind("DateWhenIn") %>' />
                                <br />
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                            </EditItemTemplate>

                        </asp:FormView>--%>
                </div>
                <div class="tab-pane" id="panel-other">
                    <p>
                        第二部分内容.
                    </p>
                </div>

            </div>

        </div>

    </div>
</asp:Content>
