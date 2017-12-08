<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Comp229_Assign03.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <asp:Repeater ID="myRepeater" runat="server">
            <HeaderTemplate>
                <table class="table1">
                    <thead>
                        <tr>
                            <th>First name &nbsp</th>
                            <th>Last name &nbsp</th>
                            <th> Student ID &nbsp</th>
                            <th>Enrollment Date &nbsp</th>
            </HeaderTemplate>
            <ItemTemplate>
     
                    <tr>
                        <td><br />
                            <%# Eval("FirstMidName") %><br />
                        </td>
                        <td><br />
                            <%# Eval("LastName") %><br />
                        </td>
                        <td><br />
                            <%# Eval("StudentID") %><br />
                        </td>
                        <td><br />
                            <%# Eval("EnrollmentDate") %><br />
                        </td>
                        

                    </tr>
                </tbody>
            </ItemTemplate>
            <FooterTemplate>
                <asp:Button ID="Button1" runat="server" Text="Add Student" OnClick="Page_Load" PostBackUrl="~/Student.aspx" />
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
