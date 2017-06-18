<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="CarModel.aspx.cs" Inherits="CarModel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Pageheader" runat="Server">
    <style type="text/css">
        #list {
            border: 1px solid #808080;
            display: inline;
            float: left;
            margin-left: 20px;
            margin-right: 20px;
            margin-bottom: 20px;
            font-size: 10pt;
            padding: 15pt;
        }
        #list div{
            text-align:center;
            padding-top:10px;
        }
    </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" runat="Server">
    Car Model
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <fieldset>
        <legend style="font-size: 20px">
            <asp:Label ID="lblCarMake" runat="server" Text="CarModel"></asp:Label>
        </legend>
            <asp:DataList ID="dlstCarModel" runat="server" RepeatDirection="Horizontal" RepeatColumns="3"
                Width="100%">
                <ItemTemplate>
                    <div id="list">
                        <br />
                        <b>Car Model: </b><%# HttpUtility.HtmlEncode(Eval("Name").ToString()) %>
                        <br />
                        <b>Year: </b>
                        <%#(Eval("Year"))%>
                        <br />
                        <b>Price: $</b>
                        <%#(Eval("Price"))%>
                        <br /><br />
                        <img src='../uploads/cars/<%# (Eval("Image")) %>' align="middle" height="100" width="150"
                            border="1" />
                        <br />
                        <div><a href='<%# Layers.Link.ToCarDetail(Eval("Id").ToString()) %>'>
                        <img src="images/viewbtn.PNG"></img> </a></div>
                    </div>
                </ItemTemplate>
            </asp:DataList><br />
    </fieldset>
</asp:Content>
