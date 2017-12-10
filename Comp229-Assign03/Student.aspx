<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="Comp229_Assign03.Student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <div>
    <table>
                <tr>
                    <td>
                        Student ID:
                    </td> 
                    <th>
                    <asp:Label ID="StudentID" runat="server" Text='<%#Eval("StudentID")%>' />
                    </th>
                </tr>
                <tr>
                    <td>
                        Full Name
                    </td> 
                    <th>
                    <asp:Label ID="StudentName" runat="server" Text='<%#Eval("FirstMidName") + " " + Eval("LastName") %>' />
                    </th>
                </tr>
                    <tr>
                    <td>
                        Enrollment Date
                    </td> 
                    <th>
                    <asp:Label ID="EnrollDate" runat="server" Text='<%#Eval("EnrollmentDate")%>' />
                    </th>
                    </tr>
                    <tr>
                    <td>
                        Course 
                    </td> 
                    <th>                  
                    <asp:DataList runat="server" ID="course" OnItemCommand="CourseList">            
           <ItemTemplate>                          
                    <asp:LinkButton ID="detail" runat="server"
                                        Text='<%#Eval("Title") +" - Grade: " + Eval("Grade")%>'
                                        CommandName="detail"
                                        CommandArgument='<%#Eval("CourseID")%>' OnClick="detail"/>                               
                            </ItemTemplate>
                        </asp:DataList>
                     </th>
                     </tr>    
            </table>
         <asp:LinkButton ID="update" OnClick="update" CommandName="update" CommandArgument="Update" Text="Update Info" runat="server" />
    <br />
    <asp:LinkButton ID="Linkbtn2" OnClick="Delete" CommandName="Delete" Text="Delete this data?" runat="server"  OnClientClick="return confirm('Do you want to delete this?')" CommandArgument='<%#Eval("StudentID")%>' />
     </div>
</asp:Content>