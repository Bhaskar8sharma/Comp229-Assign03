using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp229_Assign03
{
    public partial class Home : System.Web.UI.Page
    {

        private SqlConnection conn = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Comp229Assign03;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
        public void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn;
            SqlCommand comm;
            SqlDataReader reader;
            conn = new SqlConnection("Server=(localdb)\\MSSQLLocalDB;" +
            "Database=Comp229Assign03;Integrated Security=True");
            comm = new SqlCommand(
            "SELECT StudentID, FirstMidName, LastName, EnrollmentDate " +
            "FROM Students", conn);
            try
            {
                conn.Open();
                reader = comm.ExecuteReader();
                myRepeater.DataSource = reader;
                myRepeater.DataBind();
                reader.Close();
            }
            catch
            {
                Response.Write("Error retrieving user data.");
            }
            finally
            {
                conn.Close();
            }
        }
    }
}