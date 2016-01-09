<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeDetails.aspx.cs" Inherits="XjzzDatabase.DataTable.EmployeeDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        function ListToTextBox(fromlist, totext) {          
            document.getElementById(totext).value = fromlist.innerHTML;
     }
    </script>
    <script type="text/javascript">
        $('.datepicker').datepicker()
    </script>
    <div class="body-content">
        <br />
        <p class="text-danger">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>
        <div class="form-group">
            <div class="col-md-3 ">
                 <asp:Label runat="server" Text="姓" AssociatedControlID="FamilyNameTextBox" Style="float: left"></asp:Label>
                <asp:TextBox ID="FamilyNameTextBox" runat="server" Style="float: left; margin-left: 5px"></asp:TextBox>
            </div>
            <div class="col-md-3 ">
                <asp:Label ID="Label1" runat="server" Text="名" AssociatedControlID="FirstNameTextBox" Style="float: left"></asp:Label>
                <asp:TextBox ID="FirstNameTextBox" runat="server" Style="float: left; margin-left: 5px"></asp:TextBox>
            </div>
                <asp:Button ID="Button_Save" runat="server" CssClass="btn btn-default" Text="保存修改" OnClick="Button_Save_Click" />
        </div>
        <div class="tabbable" id="tabs-employee">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#panel-base" data-toggle="tab">基本信息</a>
                </li>
                <li>
                    <a href="#panel-com" data-toggle="tab">联系信息</a>
                </li>
                 <li>
                    <a href="#panel-other" data-toggle="tab">其他信息</a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="panel-base">
                    <div class="container">
                        <br />
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="sexTextBox" CssClass="col-md-2 control-label">性别</asp:Label>
                                    <div class="col-md-10">
                                        <div class="input-group">
                                            <input class="form-control" id="sexTextBox" type="text" runat="server" />
                                            <div class="input-group-btn">
                                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">请选择<span class="caret"></span></button>
                                                <ul class="dropdown-menu" id="sexList" runat="server">
                                                </ul>
                                            </div>
                                            <!-- /btn-group -->
                                        </div>
                                        <!-- /input-group -->
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="profTextBox" CssClass="col-md-2 control-label">职称</asp:Label>
                                    <div class="col-md-10">
                                        <div class="input-group">
                                            <input class="form-control" id="profTextBox" type="text" runat="server" />
                                            <div class="input-group-btn">
                                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">请选择<span class="caret"></span></button>
                                                <ul class="dropdown-menu" id="profList" runat="server">
                                                </ul>
                                            </div>
                                            <!-- /btn-group -->
                                        </div>
                                        <!-- /input-group -->
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="deptTextBox" CssClass="col-md-2 control-label">部门</asp:Label>
                                    <div class="col-md-10">
                                        <div class="input-group">
                                            <input class="form-control" id="deptTextBox" type="text" runat="server" />
                                            <div class="input-group-btn">
                                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">请选择<span class="caret"></span></button>
                                                <ul class="dropdown-menu" id="deptList" runat="server">
                                                </ul>
                                            </div>
                                            <!-- /btn-group -->
                                        </div>
                                        <!-- /input-group -->
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="LabTextBox" CssClass="col-md-2 control-label">实验室</asp:Label>
                                    <div class="col-md-10">
                                        <asp:TextBox runat="server" ID="LabTextBox" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="GroupTextBox" CssClass="col-md-2 control-label">团队</asp:Label>
                                    <div class="col-md-10">
                                        <asp:TextBox runat="server" ID="GroupTextBox" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="typeTextBox" CssClass="col-md-2 control-label">类型</asp:Label>
                                    <div class="col-md-10">
                                        <div class="input-group">
                                            <input class="form-control" id="typeTextBox" type="text" runat="server" />
                                            <div class="input-group-btn">
                                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">请选择<span class="caret"></span></button>
                                                <ul class="dropdown-menu" id="typeList" runat="server">
                                                </ul>
                                            </div>
                                            <!-- /btn-group -->
                                        </div>
                                        <!-- /input-group -->
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="educationTextBox" CssClass="col-md-2 control-label">学历</asp:Label>
                                    <div class="col-md-10">
                                        <div class="input-group">
                                            <input class="form-control" id="educationTextBox" type="text" runat="server" />
                                            <div class="input-group-btn">
                                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">请选择<span class="caret"></span></button>
                                                <ul class="dropdown-menu" id="educationList" runat="server">
                                                </ul>
                                            </div>
                                            <!-- /btn-group -->
                                        </div>
                                        <!-- /input-group -->
                                    </div>
                                </div>                                
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="PositionTextBox" CssClass="col-md-2 control-label">职务</asp:Label>
                                    <div class="col-md-10">
                                        <asp:TextBox runat="server" ID="PositionTextBox" CssClass="form-control" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4 col-md-offset-2">
                                <div>
                                    <asp:Image ID="ImageEmployee" runat="server" Height="200" Width="150" />
                                </div>
                                <div class="control-label">照片（小于200K,格式为gif，png，jpeg，jpg）</div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:FileUpload ID="PicFileUpload" runat="server" /></div>
                                    <div class="col-md-4">
                                        <asp:Button ID="Button_FileUpload" runat="server" Text="上传" OnClick="Button_FileUpload_Click" /></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane " id="panel-com">
                    <div class="container">
                        <br />
                        <div class="row">
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="OfficePositonTextBox" CssClass="col-md-2 control-label">办公地点</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="OfficePositonTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="OfficePhoneTextBox" CssClass="col-md-2 control-label">办公电话</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="OfficePhoneTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="EmailTextBox" CssClass="col-md-2 control-label">Email</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="MobilePhoneTextBox" CssClass="col-md-2 control-label">手机</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="MobilePhoneTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="QQTextBox" CssClass="col-md-2 control-label">QQ</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="QQTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="WeiXinTextBox" CssClass="col-md-2 control-label">微信</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="WeiXinTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="EmergencyPersonTextBox" CssClass="col-md-2 control-label">紧急联系人</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="EmergencyPersonTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="EmergencyPhoneTextBox" CssClass="col-md-2 control-label">紧急联系电话</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="EmergencyPhoneTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="panel-other">
                    <div class="container">
                        <br />
                        <div class="row">
                            <div class="form-group inline">
                                <asp:Label runat="server" AssociatedControlID="EnglishFamilyNameTextBox" CssClass="col-md-2 control-label">English Family Name</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="EnglishFamilyNameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:Label runat="server" AssociatedControlID="EnglishFirstNameTextBox" CssClass="col-md-2 control-label">English First Name</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="EnglishFirstNameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="OtherNamesTextBox" CssClass="col-md-2 control-label">别名</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="OtherNamesTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="BirthdayTextBox" CssClass="col-md-2 control-label">出生日期</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="BirthdayTextBox" runat="server" CssClass="form-control form_datepicker"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="NationalityTextBox" CssClass="col-md-2 control-label">国籍</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="NationalityTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="NationTextBox" CssClass="col-md-2 control-label">民族</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="NationTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="NativePlaceTextBox" CssClass="col-md-2 control-label">籍贯</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="NativePlaceTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="IdNumbersTextBox" CssClass="col-md-2 control-label">身份证号</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="IdNumbersTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="DateWhenInTextBox" CssClass="col-md-2 control-label">入职日期</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="DateWhenInTextBox" runat="server" CssClass="form-control form_datepicker"></asp:TextBox>
                                </div>
                            </div>
                            <script>
                                $('.form_datepicker').datepicker({ format: 'yyyy-mm-dd' });
                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
