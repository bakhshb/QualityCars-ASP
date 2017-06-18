<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Pageheader" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" runat="Server">
    Login
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="formLayout">
        <fieldset>
            <legend style="font-size: 20px">Login</legend>
            <p>
                <label>
                </label>
                <asp:Label ID="lblChecker" runat="server" Text=""></asp:Label>
            </p>
            <p>
                <label>
                    Email:</label>
                <asp:TextBox ID="txtEmail" CssClass="inputs" placeholder="Email" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="Email is required" ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email is invalid"
                    ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>   
            </p>
            <p>
                <label>
                    Password:</label>
                <asp:TextBox ID="txtPass" CssClass="inputs" placeholder="Password" runat="server"
                    TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Password is requird"
                    ControlToValidate="txtPass"></asp:RequiredFieldValidator>
            </p>
            <p>
                <label>
                </label>
                <asp:Button ID="btnLogin" CssClass="button" runat="server" Text="Login" OnClick="btnLogin_Click" />
                <a href="Register.aspx" style="font-size:16px; padding-left:10px;"> Register Now</a>
            </p>
        </fieldset>
    </div>
</asp:Content>
