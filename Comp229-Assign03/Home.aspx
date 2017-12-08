<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Comp229_Assign03.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="jumbotron">
        <asp:Repeater ID="myRepeater" runat="server" OnItemCommand="myRepeater_ItemCommand">
            <HeaderTemplate>
                <table class="table1">
                    <thead>
                        <tr>
                            <th>
                                First name:<br />
                            </th><br />
                            <th>
                                Last name:
                            </th><br />
                            <th>
                                Student ID
                            </th>
                            <th>
                                EnrollmentDate
                            </th>
                        </tr>
                    </thead>
                </table>
            </HeaderTemplate>
            <ItemTemplate>
                <tbody>
                    <tr>
                        <td>
                            <%# Eval("FirstMidName") %>
                        </td>
                        <td>
                            <%# Eval("LastName") %>
                        </td>
                        <td>
                            <%# Eval("StudentID") %>
                        </td>
                        <td>
                            <%# Eval("EnrollmentDate") %>
                        </td>
                        <%--<asp:Button ID="SendButton" CssClass="btn btn-primary btn-lg" runat="server" Text="Send" OnClick="SendButton_Click" />--%>
<a href="Student.aspx" class="btn btn-success btn-sm">
                    </tr>
                </tbody>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
    <%--<div class="table2">
        <table>
            <tr>
            <td>
                <asp:Label ID="addStudentId" Text="Add new student: " runat="server" />
            </td>
            <td>
                <asp:TextBox ID="addStudentFname" Text="First Name" runat="server" />
                <asp:RequiredFieldValidator ID="FnameReqFieldValidator" runat="server" 
                    ControlToValidate="addStudentFname" ErrorMessage="!" required="true" />
            </td>
                <td><asp:TextBox ID="addStudentLname" Text="Last Name" runat="server"/>
            <asp:RequiredFieldValidator ID="LnameReqFieldValidator"
                                        runat="server"
                                        ControlToValidate="addStudentLname"
                                        ErrorMessage="!" 
                                        required="true"/>
                </td>
            <td><asp:Button ID="addStudentButton" 
                            Text="Add"
                            runat="server" 
                            Enabled="true" 
                            OnClick="addStudentButton_Click"/></td>

            <td><asp:Label  ID="addButtonClickedLabel" 
                            Text="" 
                            runat="server"
                            Visible="false" /></td>   
                </tr>       
        </table>
    </div>--%>

</asp:Content>
