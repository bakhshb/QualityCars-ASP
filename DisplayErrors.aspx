<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DisplayErrors.aspx.cs" Inherits="DisplayErrors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Pageheader" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" runat="Server">
Error
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">

<table border="1" cellspacing="0" > 
<tr><th colspan="2"><h1>Exception Information</h1></th></tr>
<tr><td><h3>Error from:</h3></td>
<td><asp:Label id="lblErrorFrm" runat="server" Width="90%"></asp:Label></td></tr>
<tr><td><h3>HelpLink:</h3></td>
<td><asp:Label id="lblHlpLnk" runat="server" Width="90%"></asp:Label></td></tr>
<tr><td><h3>InnerException:</h3></td>
<td><asp:Label id="lblInrError" runat="server" Width="90%"></asp:Label></td></tr>
<tr><td><h3>Message:</h3></td>
<td><asp:Label id="lblMsg" runat="server" Width="90%"></asp:Label></td></tr>
<tr><td><h3>Source:</h3></td>
<td><asp:Label id="lblSrc" runat="server" Width="90%"></asp:Label></td></tr>
<tr><td><h3>StackTrace:</h3></td>
<td><asp:Label id="lblStkTrc" runat="server" Width="90%"></asp:Label></td></tr>
<tr><td><h3>TargetSite:</h3></td>
<td><asp:Label id="lblTrgtSit" runat="server" Width="90%"></asp:Label></td></tr>
</table>


</asp:Content>

