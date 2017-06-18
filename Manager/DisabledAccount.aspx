<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/MangerMaster.master" AutoEventWireup="true" CodeFile="DisabledAccount.aspx.cs" Inherits="Manager_DisabledAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
Customer Account Status
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHeader" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
<fieldset>
            <legend style="font-size: 20px">Disabled Account</legend>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" 
    DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CC9966" 
        BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="grd">
    <Columns>
        <asp:CommandField ShowEditButton="True" />
        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" 
            SortExpression="Id" />
        <asp:BoundField DataField="FirstName" HeaderText="FirstName" ReadOnly="True" 
            SortExpression="FirstName" />
        <asp:BoundField DataField="LastName" HeaderText="LastName" ReadOnly="True"  
            SortExpression="LastName" />
        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" ReadOnly="True"  />
        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" ReadOnly="True"  />
        <asp:TemplateField HeaderText="Status" SortExpression="Status">
            <EditItemTemplate>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" SelectedValue='<%# Bind("Status") %>'>
                    <asp:ListItem Value="0">Disable</asp:ListItem>
                    <asp:ListItem Value="1">Enable</asp:ListItem>
                </asp:DropDownList>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#c80000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
        <EmptyDataTemplate>
            No Accounts is disable
        </EmptyDataTemplate>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:QualityCarConnectionString %>" 
    SelectCommand="SELECT Id, FirstName, LastName, Email, City, Status FROM Customer WHERE (Status = 0)" 
    UpdateCommand="UPDATE  Customer SET  [Id]=@Id ,[Status]=@Status  WHERE [Id] = @Id">
    <UpdateParameters>
        <asp:Parameter Name="Id" />
        <asp:Parameter Name="Status" />
    </UpdateParameters>
</asp:SqlDataSource>
</fieldset>
</asp:Content>

