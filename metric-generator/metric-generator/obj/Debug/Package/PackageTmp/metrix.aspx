﻿<%@ Page Title="" Language="C#" MasterPageFile="~/rmg.Master" AutoEventWireup="true" CodeBehind="metrix.aspx.cs" Inherits="metric_generator.WebForm1" %>

<%@ Import Namespace="System.Data" %>
<%--Metrix RMG: (R)apid (M)etrics (G)enerator Version 1.0
        Written and Coded by Adam Szablya
        Project Started on:11/15/2014

        Licencing Information:
        Metrix RMG Version 1.0 is freely useable and re-distributable
        under the GNU General Public Licence version 3.
--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/jquery" src="js/jquery-2.1.1.js"></script>
    <script type="text/javascript">
        /*======================================================\
         Javascript graph generator:
         Itterare over the rows in the table using code behind.
        \======================================================*/

        var boxarray = [
                    <%
        if (this.ds != null)
        {
            foreach (DataRow row in this.ds.Tables[0].Rows)
            {
                Response.Write("[\"");
                Response.Write(((DateTime)row.ItemArray[1]).ToString("yyyy-MM-dd"));
                Response.Write("\",");
                Response.Write(row.ItemArray[0]);
                Response.Write("],\r\n");
            }
        }
        %>
        ];

        var xtitle = "<% =title %>";
        var xwidth = "<% =width %>";
        var xheight = "<% =height %>";
    </script>
    <script type="text/javascript" src="js/GUIctl.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--------------------------- 
    HTML / GUI starts here  
----------------------------->
    <!--Div that will hold the charts-->
    <div id="grid" style="width: auto; height: auto"></div>
    <asp:DropDownList ID="graphselector" runat="server" CssClass="dropdown"
        Style="font-size: 11px" AutoPostBack="False">
        <asp:ListItem Selected="True">Select chart</asp:ListItem>
        <asp:ListItem Value="ColumnChart">Column Chart</asp:ListItem>
        <asp:ListItem Value="BarChart">Bar Chart</asp:ListItem>
        <asp:ListItem Value="LineChart">Line Chart</asp:ListItem>
        <asp:ListItem Value="AreaChart">Area Chart</asp:ListItem>
        <asp:ListItem Value="PieChart">Pie Chart</asp:ListItem>
    </asp:DropDownList>
    <input type="checkbox" id="imgtickbox" />
    click to activate savable images
    <!--data selection tick boxes and button -->
    <div id="selectionID" class="selection">
        <textarea rows="10" cols="90" id="sqlbox" runat="server">"Raw SQL query here"</textarea>
        <br />
        Title:<input type="text" name="title" runat="server" id="xtitle" value="enter text" />
        Width:<input type="text" name="width" runat="server" id="xwidth" value="400" />
        Height:<input type="text" name="height" runat="server" id="xheight" value="400" />
        <asp:Button ID="DataSelectButton" Text="update query" runat="server" OnClick="btn1_Click"></asp:Button>
    </div>
</asp:Content>
