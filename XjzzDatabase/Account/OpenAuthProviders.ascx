<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OpenAuthProviders.ascx.cs" Inherits="XjzzDatabase.Account.OpenAuthProviders" %>

<div id="socialLoginList">
    <h4>使用其他服务登录。</h4>
    <hr />
    <asp:ListView runat="server" ID="providerDetails" ItemType="System.String"
        SelectMethod="GetProviderNames" ViewStateMode="Disabled">
        <ItemTemplate>
            <p>
                <button type="submit" class="btn btn-default" name="provider" value="<%#: Item %>"
                    title="使用你的 <%#: Item %> 帐户登录。">
                    <%#: Item %>
                </button>
            </p>
        </ItemTemplate>
        <EmptyDataTemplate>
            <div>
                <p>本站暂不支持外部身份验证服务</p>
            </div>
        </EmptyDataTemplate>
    </asp:ListView>
</div>
