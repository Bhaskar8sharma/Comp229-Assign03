using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Comp229_Assign03
{
    public partial class Update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.UpdateBindList();
            }
        }
        private void UpdateBindList()
        {
            SqlConnection conn;
            SqlCommand comm;
            conn = new SqlConnection("Server=(localdb)\\MSSQLLocalDB;" +
            "Database=Comp229Assign03;Integrated Security=True");
            comm = new SqlCommand(
            "SELECT StudentID, FirstMidName, LastName, EnrollmentDate " +
            "FROM Students", conn);
            try
            {
                conn.Open();
                SqlDataReader reader = comm.ExecuteReader();
                if (reader.Read())
                {
                    Lname.Text += reader["LastName"];
                    Fname.Text += reader["FirstMidName"];
                    studentID.Text += reader["StudentID"];
                    EnrDate.Text += reader["EnrollmentDate"];
                }
                reader.Close();
            }
            finally
            {
                conn.Close();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int StudentID = Convert.ToInt32(Request.QueryString["StudentID"]);
            String LastName = Convert.ToString(Fname.Text);
            SqlConnection conn;
            
            conn = new SqlConnection("Server=(localdb)\\MSSQLLocalDB;" +
           "Database=Comp229Assign03;Integrated Security=True");
            
            SqlCommand comm = new SqlCommand("update [Students] set LastName=@LastName,FirstMidName=@FirstName,EnrollmentDate=@EnrollmentDate where StudentID=@StudentID", conn);
            comm.Parameters.AddWithValue("@LastName", Lname.Text);
            comm.Parameters.AddWithValue("@FirstMidName", Fname.Text);
            comm.Parameters.AddWithValue("@EnrollmentDate", EnrDate.Text);
            comm.Parameters.AddWithValue("@StudentID", StudentID);
            try
            {
                conn.Open();
               
                
            }
            finally
            {
                conn.Close();
                Response.Redirect("Home.aspx");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlConnection conn;
            SqlCommand comm;
            conn = new SqlConnection("Server=(localdb)\\MSSQLLocalDB;" +
            "Database=Comp229Assign03;Integrated Security=True");
            comm = new SqlCommand(
            "SELECT StudentID, FirstMidName, LastName, EnrollmentDate " +
            "FROM Students", conn);
            try
            {
                conn.Open();
                comm = conn.CreateCommand();
                comm.CommandType = CommandType.Text;
                comm.ExecuteNonQuery();
                conn.Close();

            }
            catch (Exception)
            {
            }
            finally
            {
                Response.Redirect("Home.aspx");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}