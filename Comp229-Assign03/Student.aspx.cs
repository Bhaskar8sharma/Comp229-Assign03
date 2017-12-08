using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Comp229_Assign03
{
    public partial class Student : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)

        {
            //if (!IsPostBack)
            //{
            //        SqlConnection conn;
            //        SqlCommand categoryComm;
            //        SqlCommand subjectComm;
            //        SqlDataReader reader;
            //        string connectionString = ConfigurationManager.ConnectionStrings[
            //        "Comp229Assign03"].ConnectionString;
            //        conn = new SqlConnection(connectionString);
            //        categoryComm = new SqlCommand(
            //"SELECT FirstMidName, Category FROM StudentCatagories",
            //        conn);
            //        subjectComm = new SqlCommand(
            //"SELECT , LastName FROM HelpDeskSubjects", conn);
            //try
            //{
            //conn.Open();
            //reader = categoryComm.ExecuteReader();
            //categoryList.DataSource = reader;
            //categoryList.DataValueField = "CategoryID";
            //categoryList.DataTextField = "Category";
            //categoryList.DataBind();
            //reader.Close();
            //reader = subjectComm.ExecuteReader();
            //subjectList.DataSource = reader;
            //subjectList.DataValueField = "SubjectID";
            //subjectList.DataTextField = "Subject";
            //subjectList.DataBind();
            //reader.Close();
            //}
            //finally
            //{
            //        conn.Close();
            //    }
            }
        }
    }