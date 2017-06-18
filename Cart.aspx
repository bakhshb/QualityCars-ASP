<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="Server">
    Cart
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <fieldset>
            <legend style="font-size: 20px">Cart</legend>
    <asp:GridView ID="grdCart" CssClass="grdCart" runat="server" BackColor="White" BorderColor="#CC9966"
        BorderStyle="None" BorderWidth="1px" CellPadding="4" AutoGenerateColumns="False"
        OnRowEditing="grdCart_RowEditing" OnRowCancelingEdit="grdCart_RowCancelingEdit"
        OnRowDeleting="grdCart_RowDeleting" OnRowUpdating="grdCart_RowUpdating">
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#c80000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
        <Columns>
            <asp:BoundField DataField="ModelId" HeaderText="Car ID" ReadOnly="True">
                <ItemStyle Font-Size="120%" />
            </asp:BoundField>
            <asp:BoundField DataField="ModelName" HeaderText="Car Model" ReadOnly="True" />
            <asp:BoundField DataField="Color" HeaderText="Color"  ReadOnly="True" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
            <asp:BoundField DataField="Price" DataFormatString="{0:c}" HeaderText="Price" ReadOnly="True" />
            <asp:BoundField DataField="SubTotal" DataFormatString="{0:c}" HeaderText="SubTotal"
                ReadOnly="True" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
        <EmptyDataTemplate>
            Your Shopping Cart is empty, add items <a href="Default.aspx">Add Car</a>
        </EmptyDataTemplate>
    </asp:GridView>
    <div style="text-align: right; background-color: #c80000; margin-left: 100px; width: 800px;
        height: 50px; font-size: 14px; font-weight: bold; color: White;">
        OrderTotal:
        <asp:Label ID="lblTotal" runat="server"></asp:Label><br />
        <asp:Label ID="Label2" Font-Size="14px" runat="server" Text="GST 15%: "></asp:Label>
        <asp:Label ID="lblGstTotal" Font-Size="14px" runat="server"></asp:Label>
    </div>
    <div style=" float:right; margin-top: 20px; margin-right:75px;">
        <asp:Button ID="btnClear" CssClass="button" runat="server" Text="Clear" OnClick="btnClear_Click" />
    </div><br />
    <div style="float:right; clear:both; margin-top: 20px; margin-bottom:20px; margin-right:75px;">
        <asp:Button ID="btnConShopping" CssClass="button" Width="160px" runat="server" Text="Continue Shopping"
            OnClick="btnbtnConShopping_Click" />
        <asp:Button ID="btnCheckOut" CssClass="button" BackColor="Orange" runat="server"
            Text="CheckOut" OnClick="btnCheckOut_Click" />
    </div>
        </fieldset>
</asp:Content>
