<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uc_Menu.ascx.cs" Inherits="Control_uc_CarMake" %>

<style type="text/css">
li
{
    list-style: none;
}
</style>
<asp:Repeater runat="server" ID="repMenu">
<ItemTemplate>
    <dd class="first">
        <a href='<%#Layers.Link.ToCarModel(Eval("id").ToString()) %>'> <%# HttpUtility.HtmlEncode(Eval("Name").ToString()) %></a>
    </dd>
</ItemTemplate>
</asp:Repeater>