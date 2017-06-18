<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/MangerMaster.master" AutoEventWireup="true" CodeFile="ModifySupplier.aspx.cs" Inherits="Manager_ModifySupplier" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="Server">
    Modify Supplier
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<fieldset>
    <legend style="font-size:20px">Modify Supplier</legend>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
        BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        DataKeyNames="Id" DataSourceID="SqlDataSource1"
        CssClass="grd">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
                ReadOnly="True" SortExpression="Id" >
            <ControlStyle Width="20px" />
            </asp:BoundField>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" >
            <ControlStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" >
            <ControlStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="Street" HeaderText="Street" 
                SortExpression="Street" >
            <ControlStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="Subrub" HeaderText="Subrub" 
                SortExpression="Subrub" >
            <ControlStyle Width="40px" />
            </asp:BoundField>
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" >
            <ControlStyle Width="40px" />
            </asp:BoundField>
            <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" 
                SortExpression="ZipCode" >
            <ControlStyle Width="25px" />
            </asp:BoundField>
            <asp:BoundField DataField="LandLine" HeaderText="LandLine" 
                SortExpression="LandLine" >
            <ControlStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="Mobile" HeaderText="Mobile" 
                SortExpression="Mobile" >
            <ControlStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="Fax" HeaderText="Fax" SortExpression="Fax" >
            <ControlStyle Width="60px" />
            </asp:BoundField>
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
            No Supplier. Add<a href="AddSupplier.aspx">Supplier</a>
        </EmptyDataTemplate>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:QualityCarConnectionString %>" 
        DeleteCommand="DELETE FROM [Supplier] WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [Supplier] ([Name], [Email], [Street], [Subrub], [City], [ZipCode], [LandLine], [Mobile], [Fax]) VALUES (@Name, @Email, @Street, @Subrub, @City, @ZipCode, @LandLine, @Mobile, @Fax)" 
        SelectCommand="SELECT * FROM [Supplier]" 
        UpdateCommand="UPDATE [Supplier] SET [Name] = @Name, [Email] = @Email, [Street] = @Street, [Subrub] = @Subrub, [City] = @City, [ZipCode] = @ZipCode, [LandLine] = @LandLine, [Mobile] = @Mobile, [Fax] = @Fax WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Street" Type="String" />
            <asp:Parameter Name="Subrub" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="ZipCode" Type="Int32" />
            <asp:Parameter Name="LandLine" Type="String" />
            <asp:Parameter Name="Mobile" Type="String" />
            <asp:Parameter Name="Fax" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Street" Type="String" />
            <asp:Parameter Name="Subrub" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="ZipCode" Type="Int32" />
            <asp:Parameter Name="LandLine" Type="String" />
            <asp:Parameter Name="Mobile" Type="String" />
            <asp:Parameter Name="Fax" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
 </fieldset>
</asp:Content>

