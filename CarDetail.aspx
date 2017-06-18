<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CarDetail.aspx.cs" Inherits="CarDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
    Car Detail
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHeader" Runat="Server">
   <style type="text/css">
        #holder{
            margin:0;
            padding:0;
            height:500px;
        }
        #image{
            float:left;
            margin:10px;
            width:350px;
            height:350px;
            border: 1px solid #808080;
        }
        #detailcontainer{
            float:left;
            margin-left:20px;
            width: 350px;
        }
        #title{
            font-size:35px;
            text-align:center;
            padding:10px;

        }
        #detail{
            font-size:15px;
            text-align:left;
             padding:10px;
        }
        #detail div {
            text-align:center;
        }
        #feature{
            clear:both;
            width:740px;
            font-size:15px;
            text-align:left;
            padding:15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="holder">
        <div id="image">
            <asp:Image ID="Image" runat="server"  Width="350px" Height="350px"/>
        </div>
        <div id="detailcontainer">
            <div id="title">
                <asp:Label ID="lblCarMake" runat="server" Text="lblCarMake"></asp:Label>
            </div>
            <div id="detail">
                <asp:Label ID="Label1" runat="server" Text="Model Name:"></asp:Label>&nbsp;&nbsp;<asp:Label ID="lblCarModel" runat="server" Text="Label"></asp:Label><br /><br />
                <asp:Label ID="Label2" runat="server" Text="Color:"></asp:Label>&nbsp;&nbsp;<asp:DropDownList 
                    ID="drpdwnColor" runat="server" AutoPostBack="true"
                    onselectedindexchanged="drpdwnColor_SelectedIndexChanged"></asp:DropDownList><br /><br />
                <asp:Label ID="Label3" runat="server" Text="Year:"></asp:Label>&nbsp;&nbsp;<asp:Label ID="lblyearMake" runat="server" Text="Label"></asp:Label><br /><br />
                <asp:Label ID="Label5" runat="server" Text="Price: $"></asp:Label>&nbsp;&nbsp;<asp:Label ID="lblCarPrice" runat="server" Text="Label"></asp:Label><br /><br />
                <asp:Label ID="Label6" runat="server" Text="Qunatity:"></asp:Label>&nbsp;&nbsp;<asp:TextBox ID="txtQty" runat="server" Text="1" Width="20"></asp:TextBox><br /><br />
                 <div><asp:Button ID="btnAddToCart" CssClass="button" runat="server" Text="Add to Cart" 
                 onclick="btnAddToCart_Click" /></div>
            </div>
        </div>
        <div id="feature">
            <asp:Label ID="Label4" runat="server" Text="Feature: "></asp:Label> <br /><asp:Label ID="lblFeature" runat="server" Text="Label"></asp:Label>
        </div>
    </div>
</asp:Content>

