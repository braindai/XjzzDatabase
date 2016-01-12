<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PaperImport.aspx.cs" Inherits="XjzzDatabase.DataTable.PaperImport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        $(document).ready(function () {
            $('#<%=typeList.ClientID%>').change(function () {
                      var p1 = $(this).val();
                      if (p1 == "0") {
                          $('#type_desc').html("请选择具体类型");
                          $('#<%=indexTypeList.ClientID%>').val("NONE");
                      }
                      else if (p1 == "1") {
                          $('#type_desc').html("从web of knowledge上下载的PlainText文件列表");
                          $('#<%=indexTypeList.ClientID%>').val("SCIE");
                      }
                  })
              })
    </script>

        <div class="row">
            <div class="col-md-2">
                <h4>1.请选择导入文件类型</h4>
            </div>
            <div class="col-md-10">

                <select id="typeList" runat="server">
                    <option value="0" selected="selected">请选择</option>
                    <option value="1">SCI(WOK) PlainText</option>
                </select>
                <span class="help-block" id="type_desc">请选择具体类型</span>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-2">

                <h4>2.选择上传文件</h4>
            </div>
            <div class="col-md-10">
                <asp:FileUpload ID="FileUpload" runat="server" />               
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-2">
                <h4>3.确认导入</h4>
            </div>
            <div class="col-md-10">
                <select id="indexTypeList" runat="server">
                    <option value="NONE" selected="selected">请选择索引类型</option>
                    <option value="SCIE">SCI/SCIE</option>
                     <option value="EI">EI</option>
                     <option value="ISTP">ISTP</option>
                    <option value="SSCI">SSCI</option>
                    <option value="CORE">核心期刊</option>
                </select>
                <span class="help-block" >请选择索引类型，注意本次批量导入的文章都将自动更改为对应的索引类型</span>
                 <asp:Button ID="Button_FileUpload" runat="server" CssClass="btn btn-default" Text="批量导入" OnClick="Button_FileUpload_Click" />
                 <p class="text-danger">
                 <asp:Literal ID="ErrorMessage" runat="server"></asp:Literal>
                     </p>
            </div>
        </div>
         <div class="row">
             <p class="text-success h3">
                 <asp:Literal ID="ResultMessage"  runat="server"></asp:Literal>
             </p>
          <asp:GridView ID="GridViewResult" runat="server" CssClass="table"></asp:GridView>
        </div>
</asp:Content>
