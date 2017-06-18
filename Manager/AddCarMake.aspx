<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/MangerMaster.master" AutoEventWireup="true"
    CodeFile="AddCarMake.aspx.cs" Inherits="Manager_AddCarMake" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="Server">
Add Car Make
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="formLayout">
        <fieldset>
            <legend style="font-size: 20px">Add Car Make Form</legend>
            <p>
                <label>
                        Make Name:</label>
                
                <asp:TextBox ID="txtName" CssClass="inputs" placeholder="Make Name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtName"
                    ErrorMessage="Make Name is required"></asp:RequiredFieldValidator>
            </p>
            <p>
                <label>
                </label>
                <asp:Button ID="btnSubmit" CssClass="button" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            </p>
        </fieldset>
    </div>
</asp:Content>
