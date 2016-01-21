<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PaperList.aspx.cs" Inherits="XjzzDatabase.DataTable.PaperList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function tabColSelAll(chkhandle, col, tblid) {
            //var tblid;
            //if (tblid)
            //    tableId = tblid;
            //else
            //    tableId = $(chkid).val();
            $("#" + tblid + " tr").each(function () {
                var bState = $(chkhandle).is(":checked");
                $(this).children("td:eq("+col+")").find(":checkbox").prop("checked", bState);
            })
        }
    </script>
    <div class="row">
        <h3><span style="margin-right: 20px">查询条件</span>
            <span style="margin-right: 20px"><a runat="server" href="#" onclick="javaScript:window.open('PaperDetails.aspx')">添加论文</a></span>
            <span style="margin-right: 20px"><a runat="server" href="#" onclick="javaScript:window.open('PaperImport.aspx')">文件导入</a></span>
        </h3>
        <hr />

      <%--  <div class="search-criteria">
            <div class="search-criteria-list">
                <table border="0" id="search_table">
                    <tbody>
                        <tr id="searchrow1" class="search-criteria-item">
                            <td class="search-criteria-cell1" colspan="2">
                                <div id="container(input1)" class="search-criteria-input-wr">
                                    <input type="text" class="search-criteria-input" alt="Enter a search term" placeholder="Example: oil spill* mediterranean" id="value(input1)" name="value(input1)" value="" onchange="markFormUpdated('UA_GeneralSearch_input_form');saveForm('UA_GeneralSearch_input_form')"><i id="clearIcon1" class="icon-clear" title="Clear Field"></i></div>
                                <div class="example" id="fieldText1"></div>
                                <div class="search-criteria-action add-search-row" id="addSearchRow1"><span class="search-criteria-link j-add-criteria"><a href="javascript:;" alt="Add another search field" title="Add another search field" onclick="javascript:addSearchRow('http://images.webofknowledge.com/WOKRS520B4.1/images', '', 'TS', 'true'); prepareACForAddSearchRow('true', 'EDITION-SELECTION', 'UA-GeneralSearch-input','UA_GeneralSearch_input_form', 'UA', 'http://ac.webofknowledge.com/AC/autoComplete.do?appName=UA&amp;id=1AuJYAdWpDg4uzu3Byt', '3', '10'); markFormUpdated('UA_GeneralSearch_input_form');saveForm('UA_GeneralSearch_input_form')" oncontextmenu="javascript:return IsAllowedRightClick(this);" hasautosubmit="true">+ Add Another Field</a></span> <span><span class="divider">|</span> <span class="search-criteria-link j-clear-criteria"><a href="/UA_ClearGeneralSearch.do?action=clear&amp;product=UA&amp;search_mode=GeneralSearch&amp;SID=1AuJYAdWpDg4uzu3Byt" alt="Clear all search fields" title="Clear all search fields" id="resetForm" oncontextmenu="javascript:return IsAllowedRightClick(this);" hasautosubmit="true">Reset Form</a></span> </span></div>
                            </td>
                            <td class="search-criteria-cell2">
                                <div class="select2-container j-custom-select select-criteria2" id="s2id_select1"><a href="javascript:void(0)" class="select2-choice" tabindex="-1" oncontextmenu="javascript:return IsAllowedRightClick(this);" hasautosubmit="true"><span class="select2-chosen" id="select2-chosen-1">Topic</span><abbr class="select2-search-choice-close"></abbr>
                                    <span class="select2-arrow" role="presentation"><b role="presentation"></b></span></a>
                                    <label for="s2id_autogen1" class="select2-offscreen"></label>
                                    <input class="select2-focusser select2-offscreen" type="text" aria-haspopup="true" role="button" aria-labelledby="select2-chosen-1" id="s2id_autogen1"><div class="select2-drop select2-display-none">
                                        <div class="select2-search select2-search-hidden select2-offscreen">
                                            <label for="s2id_autogen1_search" class="select2-offscreen"></label>
                                            <input type="text" autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false" class="select2-input" role="combobox" aria-expanded="true" aria-autocomplete="list" aria-owns="select2-results-1" id="s2id_autogen1_search" placeholder="">
                                        </div>
                                        <ul class="select2-results" role="listbox" id="select2-results-1"></ul>
                                    </div>
                                </div>
                                <select class="control" alt="Select a search field" name="value(select1)" id="select1" onchange="searchFieldChanged(this, 'http://images.webofknowledge.com/WOKRS520B4.1/images', ''); markFormUpdated('UA_GeneralSearch_input_form');saveForm('UA_GeneralSearch_input_form')" onkeyup="searchFieldChanged(this, 'http://images.webofknowledge.com/WOKRS520B4.1/images', ''); markFormUpdated('UA_GeneralSearch_input_form');saveForm('UA_GeneralSearch_input_form')" onkeydown="searchFieldChanged(this, 'http://images.webofknowledge.com/WOKRS520B4.1/images', ''); markFormUpdated('UA_GeneralSearch_input_form');saveForm('UA_GeneralSearch_input_form')" tabindex="-1" title="">
                                    <option value="TS" id="TS_search_field" selected="">Topic</option>
                                    <option value="TI" id="TI_search_field">Title</option>
                                    <option value="AU" id="AU_search_field">Author</option>
                                    <option value="AI" id="AI_search_field">Author Identifiers</option>
                                    <option value="ED" id="ED_search_field">Editor</option>
                                    <option value="GP" id="GP_search_field">Group Author</option>
                                    <option value="SO" id="SO_search_field">Publication Name</option>
                                    <option value="DO" id="DO_search_field">DOI</option>
                                    <option value="PY" id="PY_search_field">Year Published</option>
                                    <option value="AD" id="AD_search_field">Address</option>
                                </select>
                                <div class="search-criteria-link-wr" id="searchAidText1"></div>
                            </td>
                            <td class="search-criteria-cell3"><span id="searchCell1" class="button5"><span class="searchButton">
                                <input type="image" name="" src="http://images.webofknowledge.com/WOKRS520B4.1/images/search.gif" align="absmiddle" border="0" onclick="return JQcheck_form_inputs('UA_GeneralSearch_input_form', 'search');" id="UA_GeneralSearch_input_form_sb" title="Search" alt="Search">
                            </span><span class="searchRunning">
                                <img align="absmiddle" border="0" src="http://images.webofknowledge.com/WOKRS520B4.1/images/search_disabled.gif" alt="Search in process" title="Search in process">
                            </span></span></td>
                            <td>
                                <input type="hidden" name="value(hidInput1)" id="value(hidInput1)" value=""></td>
                        </tr>
                        
                    </tbody>
                </table>
            </div>
        </div>

        <div class="form-group">
        <div class="col-md-10 col-md-offset-2">
            <select class="form-control site-searchprefix" style="width: 100px">
                <option value="title">标题0</option>
                <option value="author">作者0</option>
                <option value="source">出版物0</option>
            </select>
            <input class="form-control site-searchtext" id="sexTextBox" type="text" />
            <select class="form-control site-searchfild" style="width: 100px">
                <option value="title">标题</option>
                <option value="author">作者</option>
                <option value="source">出版物</option>
            </select>
        </div>
                <div class="col-md-11 col-md-offset-1">
            <select class="form-control site-searchprefix" style="width: 100px">
                <option value="title">标题0</option>
                <option value="author">作者0</option>
                <option value="source">出版物0</option>
            </select>
            <input class="form-control site-searchtext" id="sexTextBox" type="text" />
            <select class="form-control site-searchfild" style="width: 100px">
                <option value="title">标题</option>
                <option value="author">作者</option>
                <option value="source">出版物</option>
            </select>
        </div>
            </div>--%>
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
        <hr />
        <div class=" row">
            <script>var tableid = "<%=GridViewPapers.ClientID%>";</script>
            <asp:Label ID="LabelResultNums" runat="server" Text="数目:0"></asp:Label>
            <asp:GridView ID="GridViewPapers" runat="server" ItemType="XjzzDatabase.DataTable.PaperQueryList" AutoGenerateColumns="False" AllowPaging="True"   AllowSorting="True" 
                DataKeyNames="Id" SelectMethod="GridViewPapers_GetData" DeleteMethod="GridViewPapers_DeleteItem" CssClass="table">
                 <Columns>
                    <asp:TemplateField HeaderText="全选">
                        <HeaderTemplate>                            
                            <input type="checkbox" id="chkallcol0" onclick='tabColSelAll(this, 0, tableid)'/>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkItem" runat="server" />
                        </ItemTemplate>
 <%--                       <FooterTemplate>
                            <input type="checkbox" id="chkallcol0" value="<%=GridViewPapers.ClientID%>" onclick='tabColSelAll(this, 0)'/>
                        </FooterTemplate>--%>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="序号">
                        <ItemTemplate>
                            <asp:Label runat="server" Text=" <%# this.GridViewPapers.PageIndex * this.GridViewPapers.PageSize + this.GridViewPapers.Rows.Count + 1 %>"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="标题" SortExpression="Title">
                        <ItemTemplate>
                            <%# Item.getAuthorSimpleString() %>
                            <br />
                            <a href="#" onclick="javaScript:window.open('PaperDetails.aspx?paperId=<%#Item.Id%>')"><%#Item.getRefString() %></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="已验证" SortExpression="Verified">
                        <ItemTemplate>
                            <asp:CheckBox ID="VerifiedCheckBox" runat="server" Checked='<%# Convert.ToBoolean(Item.Verified) %>' AutoPostBack="true" OnCheckedChanged="VerifiedCheckedChanged" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="已锁定" SortExpression="Locked" >
                        <ItemTemplate>
                            <asp:CheckBox ID="LockedCheckBox" runat="server" Checked='<%# Convert.ToBoolean(Item.Locked) %>' AutoPostBack="true" OnCheckedChanged="LockedCheckedChanged" />
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
