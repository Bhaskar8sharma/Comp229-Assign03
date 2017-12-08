<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="Comp229_Assign03.Student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Repeater id="myRepeater" runat="server">
<ItemTemplate>
<%# Eval("First Name") %>
</ItemTemplate>
</asp:Repeater>
</asp:Content>
