<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/MangerMaster.master" AutoEventWireup="true" CodeFile="ModifyCustomer.aspx.cs" Inherits="Manager_ModifyCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
Modify Customer
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHeader" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
 <fieldset>
    <legend style="font-size:20px">Modify Customer</legend>
    <div style="padding:20px;">
     <asp:Button ID="btnRegister" runat="server" Text="Insert New Customer"  
            CssClass="button" Width="155px" onclick="btnRegister_Click"/>
     </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" 
        CssClass="grd" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ShowSelectButton="True"/>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" 
                SortExpression="Id" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                SortExpression="FirstName" >
            <ControlStyle Width="65px" />
            </asp:BoundField>
            <asp:BoundField DataField="LastName" HeaderText="LastName" 
                SortExpression="LastName" >
            <ControlStyle Width="65px" />
            </asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" >
            <ControlStyle Width="65px" />
            </asp:BoundField>
            <asp:BoundField DataField="Password" HeaderText="Password" 
                SortExpression="Password" >
            <ControlStyle Width="65px" />
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
            No Customer is Added
        </EmptyDataTemplate>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:QualityCarConnectionString %>" 
        
        SelectCommand="SELECT Id, FirstName, LastName, Email, Password FROM Customer " 
        ConflictDetection="CompareAllValues" 
        DeleteCommand="DELETE FROM [Customer] WHERE [Id] = @original_Id AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND [Email] = @original_Email AND [Password] = @original_Password" 
        InsertCommand="INSERT INTO [Customer] ([Id], [FirstName], [LastName], [Email], [Password]) VALUES (@Id, @FirstName, @LastName, @Email, @Password)" 
        OldValuesParameterFormatString="original_{0}" 
        
        
         UpdateCommand="UPDATE [Customer] SET [FirstName] = @FirstName, [LastName] = @LastName, [Email] = @Email, [Password] = @Password WHERE [Id] = @original_Id AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND [Email] = @original_Email AND [Password] = @original_Password">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="String" />
            <asp:Parameter Name="original_FirstName" Type="String" />
            <asp:Parameter Name="original_LastName" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_Password" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Id" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="original_Id" Type="String" />
            <asp:Parameter Name="original_FirstName" Type="String" />
            <asp:Parameter Name="original_LastName" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_Password" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" 
        AutoGenerateRows="False" BackColor="White" BorderColor="#CC9966" 
        BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" 
        DataSourceID="SqlDataSource2" CssClass="grd">
        <EditRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <Fields>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" 
                SortExpression="Id" />
            <asp:BoundField DataField="Street" HeaderText="Street" 
                SortExpression="Street" />
            <asp:BoundField DataField="Subrub" HeaderText="Subrub" 
                SortExpression="Subrub" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" 
                SortExpression="ZipCode" />
            <asp:BoundField DataField="LandLine" HeaderText="LandLine" 
                SortExpression="LandLine" />
            <asp:BoundField DataField="Mobile" HeaderText="Mobile" 
                SortExpression="Mobile" />
            <asp:BoundField DataField="Fax" HeaderText="Fax" SortExpression="Fax" />
            <asp:TemplateField HeaderText="Status" SortExpression="Status">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" SelectedValue='<%# Bind("Status") %>'> 
                        <asp:ListItem Value="0">Disable</asp:ListItem>
                        <asp:ListItem Value="1">Enable</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
        </Fields>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#c80000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:QualityCarConnectionString %>" 
        
        SelectCommand="SELECT [Id], [Street], [Subrub], [City], [ZipCode], [LandLine], [Mobile], [Fax],[Status]  FROM [Customer] WHERE ([Id] = @Id)" 
        UpdateCommand="UPDATE  [Customer] SET [Street] = @Street , [Subrub]= @Subrub , [City]= @City, [ZipCode]= @ZipCode, [LandLine]= @LandLine, [Mobile]= @Mobile, [Fax]= @Fax , [Status]=@Status WHERE [Id] = @Id
">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Id" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Street" />
            <asp:Parameter Name="Subrub" />
            <asp:Parameter Name="City" />
            <asp:Parameter Name="ZipCode" />
            <asp:Parameter Name="LandLine" />
            <asp:Parameter Name="Mobile" />
            <asp:Parameter Name="Fax" />
            <asp:Parameter Name="Status" />
            <asp:Parameter Name="Id" />
        </UpdateParameters>
    </asp:SqlDataSource>
</fieldset>
</asp:Content>

