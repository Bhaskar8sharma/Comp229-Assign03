<%@ Page Title="Course" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="Comp229_Assign03.Course" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
    <fieldset>
        <legend>Student Enrolled In The Course </legend>
        <table>
                <thead>
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Student ID</th>
                        <th>Enrollment Date</th>
                        <th>Grade</th>
                        <th></th>
                    </tr>
                </thead>
             <tbody>
                    <asp:Repeater ID = "StudentInfo" runat="server" OnItemCommand="StudentInfo_ItemCommand">
                        <ItemTemplate>
                           
                            <tr class="text-center">
                                <td>
                                    <asp:Label ID="StudentID" runat = "server" Text='<%# Eval("StudentID") %>' /></td>
                                <td>
                                    <asp:Label ID="firstName" runat = "server" Text='<%# Eval("FirstMidName") %>' /></td>
                                <td>
                                    <asp:Label ID="lastName" runat = "server" Text='<%# Eval("LastName") %>' /></td>
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
                <div>
                    You can enroll a new student only to this course.
                </div>
                <div>
                <asp:Label for = "FirstName" runat="server" Text="First Name: " AutoPostBack="True"/>
                   <asp:TextBox ID = "FirstName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID = "FirstNameRequiredVal" runat="server" ErrorMessage="Empty!" ValidationGroup="InsertValidation" ControlToValidate="FirstName" ForeColor="Red"></asp:RequiredFieldValidator>
                  </div>
                  <div>
                <asp:Label for ="LastName" runat="server" Text="Last Name: " AutoPostBack="True"/>
                   <asp:TextBox ID = "LastName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID = "LastNameRequiredVal" runat="server" ErrorMessage="Empty!" ValidationGroup="InsertValidation" ControlToValidate="LastName" ForeColor="Red"></asp:RequiredFieldValidator>
                  </div>
         <div>
                <asp:Label ID = "GradeValue" runat="server" Text="Grade: " AutoPostBack="True"/>
                   <asp:TextBox ID = "grade" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID = "gradeRequiredVal" runat="server" ErrorMessage="Empty!" ValidationGroup="InsertValidation" ControlToValidate="grade" ForeColor="Red"></asp:RequiredFieldValidator>
                  </div>
                <div>
                        <asp:Button ID = "btnEnroll" runat="server" Text="Enroll Student"  ValidationGroup="InsertValidation" OnClick="btn_Enroll_click" />

                    </div>
                    <div>
                         <asp:Label ID = "ErrorMessage" runat="server" />
                    </div>
        </fieldset>
        </div>
    </asp:Content>


