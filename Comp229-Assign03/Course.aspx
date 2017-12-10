<%@ Page Title="Course" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="Comp229_Assign03.Course" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
    <fieldset>
        <legend style="color: #FF9933">Student Enrolled In The Course </legend>
        <table>
                
             <tbody>
                    <asp:Repeater ID = "StudentInfo" runat="server" OnItemCommand="StudentInfo_ItemCommand">
                        <ItemTemplate>
                           
                            <tr class="text-center">
                                <td>
                                    <asp:Label ID="StudentID" runat = "server" Text='<%# Eval("StudentID") %>' /></td>
                                <td>
                                    <asp:Label ID="FirstName" runat = "server" Text='<%# Eval("FirstMidName") %>' /></td>
                                <td>
                                    <asp:Label ID="LastName" runat = "server" Text='<%# Eval("LastName") %>' /></td>
                                <td>
                                    <asp:Label ID="enrollmentDate" runat = "server" Text='<%# Eval("EnrollmentDate") %>' /></td>
                                <td>
                                    <asp:Label ID="StudentGrade" runat = "server" Text='<%# Eval("Grade") %>' /></td>
                                <td>   <asp:Button runat = "server" CommandName="deleteStudent" CommandArgument='<%# Eval("StudentID") %>' Text="Delete" /></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>

                </tbody>
            </table>
         <h3> Enroll Student</h3>
        <p> &nbsp;</p>
                <div>
                    You can enroll a new student only to this course.<br />
&nbsp;</div>
                <div>
                <asp:Label for = "FirstName" runat="server" Text="First Name: " AutoPostBack="True"/>
                   <asp:TextBox ID = "FirstName" runat="server" style="margin-left: 4px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID = "FirstNameRequiredVal" runat="server" ErrorMessage="Empty!" ValidationGroup="InsertValidation" ControlToValidate="FirstName" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                  </div>
                  <div>
                <asp:Label for ="LastName" runat="server" Text="Last Name: " AutoPostBack="True"/>
                   <asp:TextBox ID = "LastName" runat="server" style="margin-left: 5px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID = "LastNameRequiredVal" runat="server" ErrorMessage="Empty!" ValidationGroup="InsertValidation" ControlToValidate="LastName" ForeColor="Red"></asp:RequiredFieldValidator>
                      <br />
                  </div>
         <div>
                <asp:Label ID = "GradeValue" runat="server" Text="Grade: " AutoPostBack="True"/>
                   <asp:TextBox ID = "grade" runat="server" style="margin-left: 33px" Width="145px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID = "gradeRequiredVal" runat="server" ErrorMessage="Empty!" ValidationGroup="InsertValidation" ControlToValidate="grade" ForeColor="Red"></asp:RequiredFieldValidator>
                  </div>
                <div>
                        <asp:Button ID = "btnEnroll" runat="server" Text="Enroll Student"  ValidationGroup="InsertValidation" OnClick="btn_Enroll_click" ForeColor="#FF9933" />

                    </div>
                    <div>
                         <asp:Label ID = "ErrorMessage" runat="server" />
                    </div>
        </fieldset>
        </div>
    </asp:Content>


