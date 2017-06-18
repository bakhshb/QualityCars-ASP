<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/MangerMaster.master" AutoEventWireup="true"
    CodeFile="AddSupplier.aspx.cs" Inherits="Manager_AddSupplier" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="Server">
    Add Supplier
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div style="margin-left: 150px; width: 500px;">
        <fieldset>
            <legend style="font-size: 20px">New Supplier Form</legend>
            <p>
                <label>
                    Name:
                </label>
                <asp:TextBox ID="txtName" CssClass="inputs" placeholder="Name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="style11"
                    ErrorMessage="First Name is required" ControlToValidate="txtName"></asp:RequiredFieldValidator>
            </p>
            <p>
                <label>
                    Email:
                </label>
                <asp:TextBox ID="txtEmail" CssClass="inputs" placeholder="Email" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="Email is required" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="Email is invalid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </p>
            <p>
                <label>
                    Street:
                </label>
                <asp:TextBox ID="txtStreet" CssClass="inputs" placeholder="Street" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Street is required"
                    ControlToValidate="txtStreet"></asp:RequiredFieldValidator>
            </p>
            <p>
                <label>
                    Subrub:
                </label>
                <asp:TextBox ID="txtSubrub" CssClass="inputs" placeholder="Subrub" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtSubrub"
                    ErrorMessage="Subrub is required"></asp:RequiredFieldValidator>
            </p>
            <p>
                <label>
                    City:
                </label>
                <asp:TextBox ID="txtCity" CssClass="inputs" placeholder="City" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtCity"
                    ErrorMessage="City is required"></asp:RequiredFieldValidator>
            </p>
            <p>
                <label>
                    ZipCode:
                </label>
                <asp:TextBox ID="txtZipCode" CssClass="inputs" placeholder="ZipCode" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ErrorMessage="ZipCode is required" ControlToValidate="txtZipCode" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtZipCode"
                    ErrorMessage="ZipCode is invalid" ValidationExpression="\d{4}" Display="Dynamic"></asp:RegularExpressionValidator>
            </p>
            <p>
                <label>
                    LandLine:
                </label>
                <asp:TextBox ID="txtlandline" CssClass="inputs" placeholder="Land Line" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtlandline"
                    ErrorMessage="LandLine is invalid " ValidationExpression="(\(\d{3}\)|\d{3}-)?\d{10}"></asp:RegularExpressionValidator>
            </p>
            <p>
                <label>
                    Mobile:
                </label>
                <asp:TextBox ID="txtMobile" CssClass="inputs" placeholder="Mobile" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Mobile  is required"
                    ControlToValidate="txtMobile" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtMobile"
                    ErrorMessage="Mobile is invalid" ValidationExpression="(\(\d{3}\)|\d{3}-)?\d{10}" Display="Dynamic"></asp:RegularExpressionValidator>
            </p>
            <p>
                <label>
                    Fax:
                </label>
                <asp:TextBox ID="txtFax" CssClass="inputs" placeholder="Fax" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Fax is required" ControlToValidate="txtFax" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtFax"
                    ErrorMessage="Fax is invalid" ValidationExpression="(\(\d{3}\)|\d{3}-)?\d{10}" Display="Dynamic"></asp:RegularExpressionValidator>
            </p>
            <p>
                <label>
                </label>
                <asp:Button ID="btnSubmit" CssClass="button" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                <input id="Reset1" class="button" type="reset" value="reset" />
        </fieldset>
    </div>
</asp:Content>
