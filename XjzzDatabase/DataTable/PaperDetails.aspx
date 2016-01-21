<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PaperDetails.aspx.cs" Inherits="XjzzDatabase.DataTable.PaperDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <h3>
            <asp:Label ID="TitleLabel" runat="server" Text="新论文" />
        </h3>
            <p class="text-danger">
                <asp:Literal runat="server" ID="ErrorMessage" />
                <asp:Button ID="Button_Save" runat="server" CssClass="btn btn-default" Text="保存修改" OnClick="Button_Save_Click" OnClientClick="makeAuthorStringFromAuthorList()" />
            </p>
        <div class="tabbable" id="tabs-paper">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#panel-base" data-toggle="tab">基本信息</a>
                </li>
                <li>
                    <a href="#panel-author" data-toggle="tab">作者信息</a>
                </li>
                <li>
                    <a href="#panel-other" data-toggle="tab">其他信息</a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="panel-base">
                        <br />
                        <div class="row">
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="TitleTextBox" CssClass="col-md-1 control-label">标题</asp:Label>
                                <div class="col-md-11 ">
                                    <asp:TextBox runat="server" ID="TitleTextBox" CssClass="form-control" placeholder="注意尽量与出版物上名字相同，比如大小写" Style="max-width: 700px" />
                                </div>
                            </div>
<%--                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="AuthorTextBox" CssClass="col-md-1 control-label">作者</asp:Label>
                                <div class="col-md-11 ">
                                    <asp:TextBox runat="server" ID="AuthorTextBox" CssClass="form-control" placeholder="不同作者用分号(英文半角)分隔，比如 Ni Kai;Dai Xiaoqing" Style="max-width: 700px" />
                                </div>
                            </div>--%>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="SourceTextBox" CssClass="col-md-1 control-label">来源</asp:Label>
                                <div class="col-md-11 ">
                                    <asp:TextBox runat="server" ID="SourceTextBox" CssClass="form-control" placeholder="比如期刊名" Style="max-width: 700px" />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="PublishYearTextBox" CssClass="col-md-1 control-label">出版年份</asp:Label>
                                <div class="col-md-11 ">
                                    <asp:TextBox runat="server" ID="PublishYearTextBox" CssClass="form-control" placeholder="四位年份,比如2015" />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="PublishMonthTextBox" CssClass="col-md-1 control-label">出版月份</asp:Label>
                                <div class="col-md-11 ">
                                    <asp:TextBox runat="server" ID="PublishMonthTextBox" CssClass="form-control" placeholder="输入数字,比如9" />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="VolumeTextBox" CssClass="col-md-1 control-label">卷</asp:Label>
                                <div class="col-md-11 ">
                                    <asp:TextBox runat="server" ID="VolumeTextBox" CssClass="form-control" placeholder="Volume" />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="IssueTextBox" CssClass="col-md-1 control-label">期</asp:Label>
                                <div class="col-md-11 ">
                                    <asp:TextBox runat="server" ID="IssueTextBox" CssClass="form-control" placeholder="Issue" />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="StartPageTextBox" CssClass="col-md-1 control-label">起始页</asp:Label>
                                <div class="col-md-11 ">
                                    <asp:TextBox runat="server" ID="StartPageTextBox" CssClass="form-control" placeholder="" />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="EndPageTextBox" CssClass="col-md-1 control-label">截止页</asp:Label>
                                <div class="col-md-11 ">
                                    <asp:TextBox runat="server" ID="EndPageTextBox" CssClass="form-control" placeholder="" />
                                </div>
                            </div>
                            <div class="row" style="margin-left: 0px">
                                <label class="col-md-1 control-label">索引类型</label>
                                <div class="col-md-11">
                                    <label class="checkbox-inline" style="margin-left: 40px">
                                        <input type="checkbox" id="Checkbox_EI" runat="server" >
                                        EI
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" id="Checkbox_SCIE" runat="server" >
                                        SCIE
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" id="Checkbox_SSCI" runat="server" >
                                        SSCI
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" id="Checkbox_ISTP" runat="server">
                                        ISTP
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" id="Checkbox_Core" runat="server">
                                        核心
                                    </label>
                                </div>
                            </div>
                             <div class="row" style="margin-left: 0px">
                                <label class="col-md-1 control-label">文档类型</label>
                                <div class="col-md-11">
                                    <label class="radio-inline" style="margin-left: 40px">
                                        <input type="radio" id="Radio_J" name="PaperType" runat="server" >
                                        期刊
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" id="Radio_C" name="PaperType" runat="server" >
                                        会议
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="AccessionNumberTextBox" CssClass="col-md-1 control-label">检索号</asp:Label>
                                <div class="col-md-11">
                                    <asp:TextBox ID="AccessionNumberTextBox" runat="server" CssClass="form-control" placeholder="SCI:WOS:000231460000032;EI:20100712718633" Style="max-width: 700px"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="DOITextBox" CssClass="col-md-1 control-label">文档号</asp:Label>
                                <div class="col-md-11">
                                    <asp:TextBox ID="DOITextBox" runat="server" CssClass="form-control" placeholder="DOI号，比如10.1002/jms.3707" Style="max-width: 700px"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-1 control-label" for="AbstractTextArea">摘要</label>
                                <div class="col-md-11 ">
                                    <textarea class="form-control" id="AbstractTextArea" runat="server" rows="8" style="max-width: 700px"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="RemarksTextBox" CssClass="col-md-1 control-label">备注</asp:Label>
                                <div class="col-md-11 ">
                                    <asp:TextBox runat="server" ID="RemarksTextBox" CssClass="form-control" placeholder="" Style="max-width: 700px" />
                                </div>
                            </div>

                        </div>
                    </div>

                <div class="tab-pane " id="panel-author">
                        <br />
                    <div class="row">                        
                        <input id="authorListString" runat="server" type="hidden"  value=""/> 
                        <script type="text/javascript">
                            $(document).ready(function () {
                                makeAuthorListFromAuthorString();
                            })

                            function makeAuthorListFromAuthorString() {
                                var authorArr = $("#<%=authorListString.ClientID%>").val().split(";");
                                var index = 2;
                                for (var i = 0; i < authorArr.length; i++) {
                                    var item = authorArr[i];
                                    if (item.trim() != "") {
                                        addPubAuthor("tblPsns", "selPsns", 1);
                                        var num = setNumberLen(index - 1, 2);
                                        var propertyArr = item.split("|");
                                        var ispos = false;
                                        if (propertyArr[0].indexOf("*") >= 0) {
                                            $("#_pub_members_pub_member_" + num + "_member_psn_name").val(propertyArr[0].replace("*", ""));
                                            ispos = true;
                                        }
                                        else {
                                            $("#_pub_members_pub_member_" + num + "_member_psn_name").val(propertyArr[0]);
                                        }

                                        if (index == 2)   //first author
                                            $("#_pub_members_pub_member_" + num + "_first_author").prop("checked", true);
                                        else if (propertyArr[1] != null)
                                            $("#_pub_members_pub_member_" + num + "_first_author").prop("checked", propertyArr[1] != "0" ? true : false);

                                        if (ispos)    //post author
                                            $("#_pub_members_pub_member_" + num + "_author_pos").prop("checked", true)
                                        else if (propertyArr[2] != null)
                                            $("#_pub_members_pub_member_" + num + "_author_pos").prop("checked", propertyArr[2] != "0" ? true : false);

                                        $("#_pub_members_pub_member_" + num + "_auto_ins_name").val(propertyArr[3]);

                                        index++;
                                    }
                                }
                            }

                            function makeAuthorStringFromAuthorList() {
                                var str = "";
                                $("#tblPsns>tbody> tr").each(function (i) {
                                    if (i < 2)
                                        return true;   //continue
                                    var num = setNumberLen(i - 1, 2);
                                    var name = $("#_pub_members_pub_member_" + num + "_member_psn_name").val().trim();
                                    if (name == "")
                                        return true;
                                    name = name.replace("*", "");
                                    str += name;
                                    str += "|";
                                    str += $("#_pub_members_pub_member_" + num + "_first_author").is(':checked') ? "1" : "0"
                                    str += "|";
                                    str += $("#_pub_members_pub_member_" + num + "_author_pos").is(':checked') ? "1" : "0";
                                    str += "|";
                                    str += $("#_pub_members_pub_member_" + num + "_auto_ins_name").val().trim();
                                    str += ";"
                                })
                                if (str != "") {
                                    str = str.substring(0, str.length - 1);
                                }
                                $("#<%=authorListString.ClientID%>").val(str);
                                return true;
                            }

                            function makeAuthorSimpleStringFromAuthorList() {
                                var str = "";
                                $("#tblPsns>tbody> tr").each(function (i) {
                                    if (i < 2)
                                        return true;   //continue
                                    var num = setNumberLen(i - 1, 2);
                                    var name = $("#_pub_members_pub_member_" + num + "_member_psn_name").val().trim();
                                    if (name == "")
                                        return true;
                                    name = name.replace("*", "");
                                    str += name;
                                    if ($("#_pub_members_pub_member_" + num + "_author_pos").is(':checked'))
                                        str += "*;"
                                    else
                                        str += ";"
                                })
                                if (str != "") {
                                    str = str.substring(0, str.length - 1);
                                }
                                return str;
                            }


                        function btnclickAuthorStringtoList()
                        {
                            if ($("#authorStringTextbox").val().trim() == "")
                                return;
                            $("#tblPsns>tbody> tr").each(function (i) {
                                if (i < 2)
                                    return true;
                                $(this).remove();
                            })
                            var temp = $("#<%=authorListString.ClientID%>").val();
                            $("#<%=authorListString.ClientID%>").val($("#authorStringTextbox").val());
                                makeAuthorListFromAuthorString();
                                $("#<%=authorListString.ClientID%>").val(temp);
                         }

                       function btnclickAuthorListtoSimpleString()
                       {
                           $("#authorStringTextbox").val(makeAuthorSimpleStringFromAuthorList());
                        }


                         <%--   $("#MainForm").submit(function () {
                                var str = "";
                                $("#tblPsns>tbody> tr").each(function(i){
                                    if(i<2)
                                        return true;   //continue
                                    var num = setNumberLen(i - 1, 2);
                                    var name = $("#_pub_members_pub_member_"+num+"_member_psn_name").val().trim();
                                    if(name=="")
                                        return true;
                                    str+=name;
                                    str+="|";
                                    str += $("#_pub_members_pub_member_" + num + "_first_author").is(':checked') ? "1" : "0"
                                    str+="|";
                                    str+=$("#_pub_members_pub_member_"+num+"_author_pos").is(':checked')?"1":"0";
                                    str+="|";
                                    str+=$("#_pub_members_pub_member_"+num+"_auto_ins_name").val().trim();
                                    str+=";"
                                })
                                if(str!="")
                                {
                                    str = str.substring(0,str.length-1);
                                }
                                $("#<%=authorListString.ClientID%>").val(str);
                                return true;
                            })--%>

                        </script>
                        
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <a data-toggle="collapse" href="#collapseOne">自动生成辅助工具</a>
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <a class="btn btn-default site-authorliststring-btn"  onclick="btnclickAuthorStringtoList()">从输入自动填充下面列表</a>
                                    <input type="text" class="form-control site-authorliststring-txt" style="max-width:550px" id="authorStringTextbox" />
                                    <a class="btn btn-default site-authorliststring-btn"  onclick="btnclickAuthorListtoSimpleString()">从下面列表生成作者字符串</a>
                                </div>
                            </div>
                        </div>
                        <table id="tblPsns" class="table" style="text-align:center; max-width: 768px">
                            <tr >
                                <td style = "width: 10%">选择</td>
                                <td style = "width: 10%">序号</td>
                                <td style = "width: 30%"><b style="color:red">*</b>作者</td>
                                <td style = "width: 30%">单位</td>
                                <td style = "width: 10%">通讯作者</td>
                                <td style = "width: 10%">第一作者</td>
                            </tr>
                            <tr class="site-template">
                                <td>
                                    <input id="selPsns" name="selPsns" type="radio" />
                                </td>
                                <td><span id="_pub_members_pub_member_0_sequence_no"  name="/pub_members/pub_member[0]/:sequence_no" ></span></td>
                                <td>
                                    <input type="text"  id="_pub_members_pub_member_0_member_psn_name" name="/pub_members/pub_member[0]/:member_psn_name" maxlength="61" value=""  /></td>
                                <td>
                                    <input type="text" maxlength="100" id="_pub_members_pub_member_0_auto_ins_name" name="/pub_members/pub_member[0]/:auto_ins_name" value="" />
                                </td>                               
                                <td>
                                    <input type="checkbox" id="_pub_members_pub_member_0_author_pos" name="/pub_members/pub_member[0]/:author_pos" value="1" /></td>
                                <td>
                                    <input type="checkbox" id="_pub_members_pub_member_0_first_author"  name="/pub_members/pub_member[0]/@first_author" value="1" /></td>
                            </tr>
                        </table>
                          <div >
          	                <a class="btn btn-sm" id="cmdAddbeforePsn"  onclick="addPubAuthor('tblPsns','selPsns',1);">添加</a> 
          	                <a class="btn btn-sm" id="cmdMoveNextPsn"  onclick="movePrev('tblPsns','selPsns','1');">上移</a> 
          	                <a class="btn btn-sm" id="cmddelPsn"  onclick="moveNext('tblPsns','selPsns','1');">下移</a> 
          	                <a class="btn btn-sm" id="cmdMovePrevPsn"   onclick="removePubAuthor('tblPsns','selPsns','1');">删除</a>
                          </div>	                   
                    </div>
                </div>
                <div class="tab-pane" id="panel-other">
                        <br />
                        <div class="row">
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="IFTypeTextBox" CssClass="col-md-1 control-label">分区</asp:Label>
                                <div class="col-md-11">
                                    <asp:TextBox ID="IFTypeTextBox" runat="server" CssClass="form-control" placeholder="比如JCR1" Style="max-width: 700px"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="IFTextBox" CssClass="col-md-1 control-label">影响因子</asp:Label>
                                <div class="col-md-11">
                                    <asp:TextBox ID="IFTextBox" runat="server" CssClass="form-control" placeholder="影响因子，比如：1.2" Style="max-width: 700px"></asp:TextBox>
                                </div>
                            </div>

                             <div class="row" style="margin-left: 0px">
                                <label class="col-md-1 control-label">文档类型</label>
                                <div class="col-md-11">
                                    <label class="radio-inline" style="margin-left: 40px">
                                        <input type="radio" id="Radio_Unknow" name="IsForeign" runat="server" >
                                        未知
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" id="Radio_Chinease" name="IsForeign" runat="server" >
                                        国内
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" id="Radio_Foreign" name="IsForeign" runat="server" >
                                        国外
                                    </label>
                                </div>
                            </div>
                           <%-- <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="PaperTypeTextBox" CssClass="col-md-1 control-label">文档类型</asp:Label>
                                <div class="col-md-11">
                                    <asp:TextBox ID="PaperTypeTextBox" runat="server" CssClass="form-control" placeholder="类别为国外期刊,国内期刊,国际会议，国内会议" Style="max-width: 700px"></asp:TextBox>
                                </div>
                            </div>--%>

<%--                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="AuthorFullTextBox" CssClass="col-md-1 control-label">全名作者</asp:Label>
                                <div class="col-md-11">
                                    <asp:TextBox ID="AuthorFullTextBox" runat="server" CssClass="form-control" Style="max-width: 700px"></asp:TextBox>
                                </div>
                            </div>--%>

                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="FundingTextBox" CssClass="col-md-1 control-label">基金</asp:Label>
                                <div class="col-md-11 ">
                                    <asp:TextBox runat="server" ID="FundingTextBox" CssClass="form-control" placeholder="" Style="max-width: 700px" />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="LanguageTextBox" CssClass="col-md-1 control-label">语言</asp:Label>
                                <div class="col-md-11 ">
                                    <asp:TextBox runat="server" ID="LanguageTextBox" CssClass="form-control" placeholder="" Style="max-width: 700px" />
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
</asp:Content>
