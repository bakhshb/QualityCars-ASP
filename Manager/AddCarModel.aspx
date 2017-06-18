<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/MangerMaster.master" AutoEventWireup="true"
    CodeFile="AddCarModel.aspx.cs" Inherits="Manager_AddCarModel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="Server">
    Add Car Model
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="formLayout">
        <fieldset>
            <legend style="font-size: 20px">New Car Model Form</legend>
            <p>
                <label>
                    Make ID:
                </label>
                <asp:DropDownList ID="drpdwnMake" CssClass="inputs" runat="server" DataSourceID="SqlDataSource1"
                    DataTextField="Name" DataValueField="Id" AutoPostBack="true" OnSelectedIndexChanged="drpdwnMake_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QualityCarConnectionString %>"
                    SelectCommand="SELECT * FROM [CarMake]"></asp:SqlDataSource>
            </p>
            <p>
                <label>
                    Supplier ID:
                </label>
                <asp:DropDownList ID="drpdwnSupplier" CssClass="inputs" runat="server" DataSourceID="SqlDataSource2"
                    DataTextField="Name" DataValueField="Id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:QualityCarConnectionString %>"
                    SelectCommand="SELECT * FROM [Supplier]"></asp:SqlDataSource>
            </p>
            <p>
                <label>
                    Name:
                </label>
                <asp:TextBox ID="txtName" CssClass="inputs" placeholder="Model Name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                    ErrorMessage="Name is required"></asp:RequiredFieldValidator>
            </p>
            <p>
                <label>
                    Year:
                </label>
                <asp:TextBox ID="txtYear" CssClass="inputs" placeholder="Year" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtYear"
                    ErrorMessage="Year is required"></asp:RequiredFieldValidator>
            </p>
            <p>
                <label>
                    Price:
                </label>
                <asp:TextBox ID="txtPrice" CssClass="inputs" placeholder="Price" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPrice"
                    ErrorMessage="Price is required"></asp:RequiredFieldValidator>
            </p>
            <p>
                <label>
                    Image:
                </label>
                <asp:FileUpload ID="filMyFile" CssClass="inputs" runat="server" Width="217px" />
            </p>
            <p>
                <label>
                    Feature:
                </label>
                <asp:TextBox ID="txtFeature" CssClass="inputs" Height="100px" placeholder="Feature" runat="server"
                    TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFeature"
                    ErrorMessage="Feature is required"></asp:RequiredFieldValidator>
            </p>
            <p>
                <label>
                </label>
                <asp:Button ID="btnSubmit" CssClass="button" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            </p>
        </fieldset>
    </div>
</asp:Content>
