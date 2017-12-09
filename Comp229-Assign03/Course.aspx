<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="Comp229_Assign03.Course" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 <asp:GridView ID="CourseList" runat="server" AutoGenerateColumns="False" DataKeyNames="StudentID" >
        <Columns>
            <asp:BoundField DataField="StudentID" HeaderText="Student ID" InsertVisible="False" ReadOnly="True" SortExpression="StudentID" />
            <asp:BoundField DataField="LastName" HeaderText="Last Name" />
            <asp:BoundField DataField="FirstMidName" HeaderText="First Name" />
            <asp:BoundField DataField="EnrollmentDate" HeaderText="Enrollment Date" />
        
            <asp:CommandField HeaderText="Delete" DeleteText="Delete" 
                ShowDeleteButton="true" ButtonType="Link" />
        
        </Columns>
    </asp:GridView>
        <br />
        <br />
    <a href="Update.aspx">Update Page</a>
    <a id="BtnsForCourseAdd" href="AddStudent.aspx"><i class="fa fa-plus"></i>Add Student to Course</a>
  

</asp:Content>

