<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Pageheader" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" Runat="Server">
Contact Us
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="formLayout">
        <fieldset>
            <legend style="font-size: 20px">Contact Form</legend>
            <p>
                <label></label>
                <asp:Label ID="lblMsg" Font-Size="14px" runat="server"></asp:Label>
            </p>
            <p>
                <label>
                     Name:</label>
                <asp:TextBox ID="txtName" CssClass="inputs" placeholder="Name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is required"
                    ControlToValidate="txtName"></asp:RequiredFieldValidator>
            </p>
            <p>
                <label>
                    Email:</label>
                <asp:TextBox ID="txtEmail" CssClass="inputs" placeholder="Email" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="Email is invalid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email is Required" 
                    ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>
            </p>
            <p>
                <label>
                    Subject:</label>
                <asp:TextBox CssClass="inputs" placeholder="Subject" ID="txtSubject" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Subject is required"
                    ControlToValidate="txtSubject"></asp:RequiredFieldValidator>
            </p>
            <p>
                <label>
                    Message:</label>

                <asp:TextBox ID="txtMsg" CssClass="inputs" Height="80px" placeholder="Message" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtMsg"
                    ErrorMessage="Message is required"></asp:RequiredFieldValidator>
            </p>
            <p>
                <label>
                </label>
                <asp:Button ID="btnSubmit" CssClass="button" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                <input id="Reset1" class="button" type="reset" value="reset" />
            </p>
        </fieldset>
    </div>
</asp:Content>

