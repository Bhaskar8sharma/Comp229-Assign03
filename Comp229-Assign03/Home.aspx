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
                         
            </HeaderTemplate>
            <ItemTemplate>
     
                    <tr>
                        <td><br />
                           <asp:HyperLink NavigateUrl="~/Student.aspx" ID="Hyperlink1" runat="server"><%# Eval("FirstMidName") %><br /></asp:HyperLink>
                        </td>
                        <td><br />
                          <asp:HyperLink NavigateUrl="~/Student.aspx" ID="Hyperlink2" runat="server"><%# Eval("LastName") %><br /></asp:HyperLink>
                        </td>
                       
                               <td><br />&nbsp&nbsp&nbsp<asp:LinkButton ID="detailsButton" runat="server"
                Text='<%#"View more details about " + Eval("FirstMidName")%>'
                CommandName="MoreDetails"
                CommandArgument='<%#Eval("StudentID")  %>'/><br /></td>
                          <td><br />&nbsp&nbsp<asp:LinkButton id="EditButton" 
                 Text="Edit" 
                 CommandName="Edit"
                 runat="server" NavigateUrl="~/Update.aspx"/>
                        </td>
                    </tr>
                </tbody>
            </ItemTemplate>
            <FooterTemplate>
               <%-- <asp:Button ID="Button1" runat="server" Text="Add Student" CommandName="addStudent" OnClick="addStudent_Click" />
              --%>              </table>
            </FooterTemplate>
        </asp:Repeater>
</div>
   

</asp:Content>
