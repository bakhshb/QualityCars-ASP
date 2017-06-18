<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ErrorPage.aspx.cs" Inherits="ErrorPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Pageheader" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" runat="Server">
Error
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
            <h1>
			<hr/>
			Sorry, an error has occurred. Please contact our system administrator.
			<hr/>
			The following is the error message:
			<%=Request.QueryString["ErrorMessage"] %>
			<hr/> 
            <//h1>


</asp:Content>

