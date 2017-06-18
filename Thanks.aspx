<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Thanks.aspx.cs" Inherits="Thanks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="Server">
    Thanks
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div style="text-align: center;">
        <h1>
            Thanks for shopping with us</h1>
        <h2>
            You will receive an email shortly with details</h2>
    </div>
    <div style="float: right; margin: 20px 20px 20px;">
        <asp:Button ID="btnClear" CssClass="button" Width="170px" runat="server" Text="Go Shopping" OnClick="btnClear_Click" />
    </div>
</asp:Content>
