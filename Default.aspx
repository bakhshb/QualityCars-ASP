<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Pageheader" runat="Server">
    <style type="text/css">
        .CarList li {
            display: inline;
            float: left;
            margin-left: 10px;
            margin-right: 10px;
            margin-bottom: 50px;
            font-size: 10pt;
            padding: 15pt;
        }

        .CarList div {
            border: 1px solid #808080;
            padding: 10pt;
        }
        .CarList div div{
            border: none;
            text-align:center;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" runat="Server">
    Home
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ListView ID="lstView" runat="server" pa >
        <LayoutTemplate>
            <ul class="CarList">
                <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
            </ul>
        </LayoutTemplate>
        <ItemTemplate>

            <li>
                <div>
                    <br />
                    <b>Car Model: </b><%# HttpUtility.HtmlEncode(Eval("Name").ToString()) %>
                    <br />
                    <b>Year: </b>
                    <%#(Eval("Year"))%>
                    <br />
                    <b>Price: $</b>
                    <%#(Eval("Price"))%>
                    <br />
                    <br />
                    <img src='../uploads/cars/<%# (Eval("Image")) %>' align="middle" height="100" width="150" border="1" />
                    <div><a href='<%# Layers.Link.ToCarDetail(Eval("Id").ToString()) %>'>
                        <img src="images/viewbtn.PNG"></img> </a></div>
                </div>
            </li>
        </ItemTemplate>
    </asp:ListView>
    <div style="margin: 10px auto; font-size:12px; padding:20px;" align="center">
    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lstView" PageSize="3" OnDataBinding="Page_Load" OnPreRender="DataPager1_PreRender">
        <Fields>
            <asp:NextPreviousPagerField ButtonType="Image" PreviousPageImageUrl="images/pervious-arrow.gif" ShowFirstPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
            <asp:NumericPagerField />
            <asp:NextPreviousPagerField ButtonType="Image"   NextPageImageUrl="images/next-arrow.gif" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="False" />
        </Fields>
    </asp:DataPager>
    </div>
</asp:Content>
