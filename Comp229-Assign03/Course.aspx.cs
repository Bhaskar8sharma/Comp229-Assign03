using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Comp229_Assign03
{
    public partial class Course : System.Web.UI.Page
    {
        private SqlConnection conn = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Comp229Assign03;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetStudentsForCourse();
            }
        }
        private void GetStudentsForCourse()
        {
            SqlCommand comm = new SqlCommand("Select  st.*, e.StudentID, e.Grade, e.CourseID, c.CourseID, " +
                "c.Title from Students st" +
                " join Enrollments e on st.StudentID = e.StudentID " +
                "join Courses c on e.CourseID = c.CourseID " +
                "where c.CourseID = @courseID;", conn);
            //comm.Parameters.AddWithValue("@CourseID", StudentID);

            try
            {
                conn.Open();
            }
            catch (Exception excep)
            {
                throw excep;
            }
            finally
            {
                conn.Close();
            }
        }

        protected void btn_Enroll_click(object sender, EventArgs e)
        {
            int courseID = -1;
            if (Session["CourseID"] != null)
                courseID = Convert.ToInt32(Session["CourseID"]);

            if (courseID > 4000) 
            {
               SqlConnection conn = new SqlConnection("Server=(localdb)\\MSSQLLocalDB;" +
           "Database=Comp229Assign03;Integrated Security=True");
                conn.Open();
 
                SqlCommand insertStudent = new SqlCommand("INSERT INTO Students (FirstMidName, LastName, EnrollmentDate) " +
                                "VALUES (@FirstName, @LastName, @EnrollmentDate);", conn);

                insertStudent.Parameters.Add("@FirstName", System.Data.SqlDbType.VarChar);
                insertStudent.Parameters["@FirstName"].Value = FirstName.Text;

                insertStudent.Parameters.Add("@LastName", System.Data.SqlDbType.VarChar);
                insertStudent.Parameters["@LastName"].Value = LastName.Text;

                insertStudent.Parameters.Add("@EnrollmentDate", System.Data.SqlDbType.Date);
                insertStudent.Parameters["@EnrollmentDate"].Value = DateTime.Now;
                insertStudent.ExecuteNonQuery();

                SqlCommand findLastStudentIDComm = new SqlCommand(
                         "SELECT MAX(StudentID) AS StudentID FROM Students;", conn);
                int newStudentID = Convert.ToInt32(findLastStudentIDComm.ExecuteScalar().ToString());

                SqlCommand enrollStudent = new SqlCommand("INSERT INTO Comp229-Assign03.[dbo].Enrollments(CourseID, StudentID, Grade) VALUES(@CourseID, @StudentID, @Grade);", conn);

                enrollStudent.Parameters.Add("@CourseID", System.Data.SqlDbType.Int);
                enrollStudent.Parameters["@CourseID"].Value = Convert.ToInt32(courseID);
                enrollStudent.Parameters.AddWithValue("@StudentID", newStudentID);
                enrollStudent.Parameters.Add("@Grade", System.Data.SqlDbType.Int);
                enrollStudent.Parameters["@Grade"].Value = Convert.ToInt32(grade.Text);
                conn.Close();
                try
                {
                    conn.Open();
                    enrollStudent.ExecuteNonQuery();
                    ErrorMessage.Text = "Enrolled a new student";
                }
                catch (SqlException error)
                {
                    ErrorMessage.Text += error.Message;
                }
                finally
                {
                    conn.Close();
                }
                GetStudentsForCourse();
            }
        }

        protected void StudentInfo_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "deleteStudent")
            {
                try
                {
                    SqlCommand deleteEnrollments = new SqlCommand("DELETE FROM Enrollments WHERE StudentID=@StudentID", conn);
                    deleteEnrollments.Parameters.AddWithValue("@StudentID", e.CommandArgument);
                    conn.Open();
                    deleteEnrollments.ExecuteNonQuery();
                    ErrorMessage.Text = "Deleted";
                }
                catch (SqlException error)
                {
                    ErrorMessage.Text += error.Message;
                }
                finally
                {
                    conn.Close();
                }
                GetStudentsForCourse();
            }
        }
    }
}