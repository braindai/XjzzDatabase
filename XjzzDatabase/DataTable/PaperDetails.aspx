<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PaperDetails.aspx.cs" Inherits="XjzzDatabase.DataTable.PaperDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <h3>
            <asp:Label ID="TitleLabel" runat="server" Text="新论文" /></h3>
        <br />
        <div class="form-group">
            <p class="text-danger">
                <asp:Literal runat="server" ID="ErrorMessage" />
                <asp:Button ID="Button_Save" runat="server" CssClass="btn btn-default" Text="保存修改" OnClick="Button_Save_Click" />
            </p>
        </div>
        <div class="tabbable" id="tabs-employee">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#panel-base" data-toggle="tab">基本信息</a>
                </li>
                <li>
                    <a href="#panel-doc" data-toggle="tab">文档信息</a>
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
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="TitleTextBox" CssClass="col-md-1 control-label" >标题</asp:Label>
                                <div class="col-md-11 ">
                                    <asp:TextBox runat="server" ID="TitleTextBox" CssClass="form-control" placeholder="注意尽量与出版物上名字相同，比如大小写" Style="max-width: 700px"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="AuthorTextBox" CssClass="col-md-1 control-label" >作者</asp:Label>
                                <div class="col-md-11 ">
                                    <asp:TextBox runat="server" ID="AuthorTextBox" CssClass="form-control" placeholder="不同作者用分号(英文半角)分隔，比如 Ni Kai;Dai Xiaoqing" Style="max-width: 700px"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="SourceTextBox" CssClass="col-md-1 control-label" >来源</asp:Label>
                                <div class="col-md-11 ">
                                    <asp:TextBox runat="server" ID="SourceTextBox" CssClass="form-control" placeholder="比如期刊名" Style="max-width: 700px"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="PublishYearTextBox" CssClass="col-md-1 control-label" >出版年份</asp:Label>
                                <div class="col-md-11 ">
                                    <asp:TextBox runat="server" ID="PublishYearTextBox" CssClass="form-control" placeholder="四位年份,比如2015" />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="PublishMonthTextBox" CssClass="col-md-1 control-label" >出版月份</asp:Label>
                                <div class="col-md-11 ">
                                    <asp:TextBox runat="server" ID="PublishMonthTextBox" CssClass="form-control" placeholder="输入数字,比如9" />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="VolumeTextBox" CssClass="col-md-1 control-label" >卷</asp:Label>
                                <div class="col-md-11 ">
                                    <asp:TextBox runat="server" ID="VolumeTextBox" CssClass="form-control" placeholder="Volume" />
                                </div>
                            </div>
                              <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="IssueTextBox" CssClass="col-md-1 control-label" >期</asp:Label>
                                <div class="col-md-11 ">
                                    <asp:TextBox runat="server" ID="IssueTextBox" CssClass="form-control" placeholder="Issue" />
                                </div>
                            </div>
                             <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="StartPageTextBox" CssClass="col-md-1 control-label" >起始页</asp:Label>
                                <div class="col-md-11 ">
                                    <asp:TextBox runat="server" ID="StartPageTextBox" CssClass="form-control" placeholder="" />
                                </div>
                            </div>
                              <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="EndPageTextBox" CssClass="col-md-1 control-label" >截止页</asp:Label>
                                <div class="col-md-11 ">
                                    <asp:TextBox runat="server" ID="EndPageTextBox" CssClass="form-control" placeholder="" />
                                </div>
                            </div> 
                        </div>
                    </div>
                </div>
                <div class="tab-pane " id="panel-doc">
                    <div class="container">
                        <br />
                        <div class="row">
                              <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="AccessionNumberTextBox" CssClass="col-md-1 control-label">检索号</asp:Label>
                                <div class="col-md-11">
                                    <asp:TextBox ID="AccessionNumberTextBox" runat="server" CssClass="form-control"  placeholder="SCI:WOS:000231460000032;EI:20100712718633" Style="max-width: 700px"></asp:TextBox>
                                </div>
                            </div>
                             <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="DOITextBox" CssClass="col-md-1 control-label">文档号</asp:Label>
                                <div class="col-md-11">
                                    <asp:TextBox ID="DOITextBox" runat="server" CssClass="form-control"  placeholder="DOI号，比如10.1002/jms.3707" Style="max-width: 700px"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row" style="margin-left: 0px">
                                <label class="col-md-1 control-label">索引类型</label>
                                <div class="col-md-11">
                                    <label  class="checkbox-inline" style="margin-left: 40px">
                                      <input type="checkbox" id="Checkbox_EI" runat="server" value="option1"> EI
                                    </label>
                                    <label class="checkbox-inline" >
                                      <input type="checkbox" id="Checkbox_SCIE" runat="server" value="option2"> SCIE
                                    </label>
                                    <label class="checkbox-inline" >
                                      <input type="checkbox" id="Checkbox_SSCI" runat="server" value="option3"> SSCI
                                    </label>
                                     <label class="checkbox-inline">
                                      <input type="checkbox" id="Checkbox_ISTP" runat="server" value="option2"> ISTP
                                    </label>
                                    <label class="checkbox-inline" >
                                      <input type="checkbox" id="Checkbox_Core" runat="server" value="option3"> 核心
                                    </label>                                    
                                 </div>
                            </div>
                            
                             <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="PaperTypeTextBox" CssClass="col-md-1 control-label">文档类型</asp:Label>
                                <div class="col-md-11">
                                    <asp:TextBox ID="PaperTypeTextBox" runat="server" CssClass="form-control"  placeholder="类别为国外期刊,国内期刊,国际会议，国内会议" Style="max-width: 700px"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="IFTypeTextBox" CssClass="col-md-1 control-label">分区</asp:Label>
                                <div class="col-md-11">
                                    <asp:TextBox ID="IFTypeTextBox" runat="server" CssClass="form-control"  placeholder="比如JCR1" Style="max-width: 700px"></asp:TextBox>
                                </div>
                            </div>
                             <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="IFTextBox" CssClass="col-md-1 control-label">影响因子</asp:Label>
                                <div class="col-md-11">
                                    <asp:TextBox ID="IFTextBox" runat="server" CssClass="form-control"  placeholder="影响因子，比如：1.2" Style="max-width: 700px"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="panel-other">
                    <div class="container">
                        <br />
                        <div class="row">
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="AuthorFullTextBox" CssClass="col-md-1 control-label">全名作者</asp:Label>
                                <div class="col-md-11">
                                    <asp:TextBox ID="AuthorFullTextBox" runat="server" CssClass="form-control"  Style="max-width: 700px"></asp:TextBox>
                                </div>
                            </div>
                              <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="RemarksTextBox" CssClass="col-md-1 control-label" >备注</asp:Label>
                                <div class="col-md-11 ">
                                    <asp:TextBox runat="server" ID="RemarksTextBox" CssClass="form-control" placeholder="" Style="max-width: 700px" />
                                </div>
                            </div> 
                             <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="FundingTextBox" CssClass="col-md-1 control-label" >基金</asp:Label>
                                <div class="col-md-11 ">
                                    <asp:TextBox runat="server" ID="FundingTextBox" CssClass="form-control" placeholder="" Style="max-width: 700px" />
                                </div>
                            </div> 
                             <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="LanguageTextBox" CssClass="col-md-1 control-label" >语言</asp:Label>
                                <div class="col-md-11 ">
                                    <asp:TextBox runat="server" ID="LanguageTextBox" CssClass="form-control" placeholder="" Style="max-width: 700px" />
                                </div>
                            </div> 
                             <div class="form-group">
                                <label class="col-md-1 control-label" for="AbstractTextArea">摘要</label>
                                <div class="col-md-11 ">
                                    <textarea class="form-control" id="AbstractTextArea" runat="server" rows="8" style="max-width: 700px"></textarea>
                                </div>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
