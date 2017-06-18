<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/MangerMaster.master" AutoEventWireup="true" CodeFile="ModifyCarModel.aspx.cs" Inherits="Manager_ModifyCarModel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="Server">
    Modify Car Model
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<fieldset>
    <legend style="font-size:20px">Modify Car Model</legend>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
    BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
    DataKeyNames="Id" DataSourceID="SqlDataSource1" CssClass="grd">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
            ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="MakeId" HeaderText="MakeId" 
            SortExpression="MakeId" >
        <ControlStyle Width="25px" />
        </asp:BoundField>
        <asp:BoundField DataField="SupplierId" HeaderText="SupplierId" 
            SortExpression="SupplierId" >
        <ControlStyle Width="25px" />
        </asp:BoundField>
        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" >
        <ControlStyle Width="50px" />
        </asp:BoundField>
        <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" >
        <ControlStyle Width="30px" />
        </asp:BoundField>
        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" >
        <ControlStyle Width="60px" />
        </asp:BoundField>
        <asp:BoundField DataField="Feature" HeaderText="Feature" 
            SortExpression="Feature" />
        <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
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
            No Car Model. Add <a href="AddCarModel.aspx">Car Model</a>
        </EmptyDataTemplate>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:QualityCarConnectionString %>" 
    DeleteCommand="DELETE FROM [CarModel] WHERE [Id] = @Id" 
    InsertCommand="INSERT INTO [CarModel] ([MakeId], [SupplierId], [Name], [Year], [Price], [Feature], [Image]) VALUES (@MakeId, @SupplierId, @Name, @Year, @Price, @Feature, @Image)" 
    SelectCommand="SELECT * FROM [CarModel]" 
    UpdateCommand="UPDATE [CarModel] SET [MakeId] = @MakeId, [SupplierId] = @SupplierId, [Name] = @Name, [Year] = @Year, [Price] = @Price, [Feature] = @Feature, [Image] = @Image WHERE [Id] = @Id">
    <DeleteParameters>
        <asp:Parameter Name="Id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="MakeId" Type="Int32" />
        <asp:Parameter Name="SupplierId" Type="Int32" />
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Year" Type="Int32" />
        <asp:Parameter Name="Price" Type="Decimal" />
        <asp:Parameter Name="Feature" Type="String" />
        <asp:Parameter Name="Image" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="MakeId" Type="Int32" />
        <asp:Parameter Name="SupplierId" Type="Int32" />
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Year" Type="Int32" />
        <asp:Parameter Name="Price" Type="Decimal" />
        <asp:Parameter Name="Feature" Type="String" />
        <asp:Parameter Name="Image" Type="String" />
        <asp:Parameter Name="Id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
</fieldset>
</asp:Content>

