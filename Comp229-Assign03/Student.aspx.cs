using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Comp229_Assign03
{
    public partial class Student : System.Web.UI.Page
    {
        private SqlConnection conn = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Comp229Assign03;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
        protected void Page_Load(object sender, EventArgs e)

        {
            if (!IsPostBack)
            {
                Studentinfo();
            }
        }
        private void Studentinfo()
        {
            string StudentID = Session["StudentID"] as string;
            int StID;
            int.TryParse(StudentID, out StID);
            SqlCommand comnd = new SqlCommand("Select * from Students " +
                "where Students.StudentID = @StudentID;", conn);
            comnd.Parameters.Add("@StudentID", System.Data.SqlDbType.Int);
            comnd.Parameters["@StudentID"].Value = StudentID;
            try
            {
                conn.Open();
                SqlDataReader reader = comnd.ExecuteReader();
                if (reader.Read())
                {
                    StudentName.Text = reader["FirstMidName"] + " " + reader["LastName"];
                   // StudentID.Text = reader["StudentID"] + "";
                    EnrollDate.Text = reader["EnrollmentDate"] + "";
                    //Session["StudentID"] = StudentID.Text;
                }
                reader.Close();
                SqlCommand comm = new SqlCommand("SELECT * FROM dbo.Courses " +
                    "INNER JOIN dbo.Enrollments ON dbo.Courses.CourseID = dbo.Enrollments.CourseID " +
                    "WHERE dbo.Enrollments.StudentID = @StudentID;", conn);
                comm.Parameters.Add("@StudentID", System.Data.SqlDbType.Int);
                comm.Parameters["@StudentID"].Value = StudentID;
                reader = comm.ExecuteReader();
                course.DataSource = reader;
                course.DataBind();
                reader.Close();
            }
            catch
            {
                Response.Write("Error!");
            }
        }
        protected void Update(object source, EventArgs e)
        {
            LinkButton button = (LinkButton)(source);
            string value = button.CommandName;
            if (value == "update")  
            {
                Response.Redirect("Update.aspx");
            }
            else if (value == "Delete")
            {
                Page.Validate();
                if (Page.IsValid)
                {
                    SqlConnection connection = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Comp229Assign03;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
                    SqlCommand comm = new SqlCommand("DELETE FROM Enrollments WHERE StudentID='" + StudentID.Text + "'", conn);
                    SqlCommand comn = new SqlCommand("DELETE FROM Students WHERE StudentID='" + StudentID.Text + "'", conn);

                    try
                    {
                        connection.Open();
                        comm.ExecuteNonQuery();
                        comn.ExecuteNonQuery();

                        connection.Close();
                    }
                    catch (Exception excep)
                    {
                        throw excep;

                    }
                    finally
                    {
                        Response.Redirect("~/Home.aspx");
                    }
                }
            }
        }
        //checked this code on stackoverflow but couldn,t make it working
        protected void CourseList(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "detail")
            {
                Session["StudentID"] = e.CommandArgument.ToString();

                Response.Redirect("Course.aspx");
            }
        }


    }
}