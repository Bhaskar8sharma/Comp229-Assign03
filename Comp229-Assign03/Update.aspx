<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="Comp229_Assign03.Update" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1 style="text-decoration: underline; border-style: groove; border-width: thick; background-image: none; background-repeat: no-repeat; background-attachment: fixed; background-color: #FFFFFF; color: #FF9933;">Welcome to Update page</h1><br />
    <div id="addStudent">
        <table>
            <tr>
                <td>First Name:</td>
                <td>
                    <asp:TextBox ID="Fname" runat="server" Width="165px"></asp:TextBox><br />
                    <br />
                </td>
            </tr>

            <tr>
                <td>Last Name:</td>
                <td>
                    <asp:TextBox ID="Lname" runat="server" Width="165px"></asp:TextBox>
                    <br />
                </td>
            </tr>
                <tr>
                    <td> Student ID:</td>
                    <td>
                        <br />
                        <asp:TextBox ID="studentID" runat="server" Width="165px"></asp:TextBox>
                        <br />
                    </td>
                </tr>
            <tr>
                <td>Enrollment Date:</td>
                <td>
                    <asp:TextBox ID="EnrDate" runat="server" Width="166px"></asp:TextBox>
                    <br />
                </td>
            </tr>
        </table>

        <asp:Button ID="btnCancel" Text="Cancel" runat="server" OnClick="btnCancel_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnUpdate" Text="Update" runat="server" OnClick="btnUpdate_Click" />
        <br />
        <br />
    </div>

</asp:Content>
