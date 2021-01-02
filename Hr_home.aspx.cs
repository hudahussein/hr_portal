using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

using System.Linq;

using System.Web;

using System.Web.UI;

using System.Web.UI.WebControls;

using System.Web.Services;

using Newtonsoft.Json;
using System.Configuration;

public partial class _Hr_home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (Convert.ToInt32(HttpContext.Current.Session["Role_id"]) == 1) {
			Response.Redirect("~/cpanel/Courses/courses_status.aspx");
		}
    }
	


	// get adminusers
    [WebMethod]
    public static string getadminusersData()

    {
        string config = Convert.ToString(ConfigurationManager.ConnectionStrings["dbcon"]);

        List<adminusers> adminusers = new List<adminusers>();

        SqlConnection con = new SqlConnection(config);

        con.Open();

        using (SqlCommand cmd = new SqlCommand("Select * from adminusers", con))

        {

            SqlDataReader idr = cmd.ExecuteReader();

            if (idr.HasRows)

            {

                adminusers = populateadminusersLisst(idr, con);

            }

        }

        con.Close();

        return JsonConvert.SerializeObject(adminusers);

    }
    public static List<adminusers> populateadminusersLisst(SqlDataReader idr, SqlConnection con)

    {

        List<adminusers> adminusersI = new List<adminusers>();

        while (idr.Read())

        {

            adminusersI.Add(new adminusers
							
            {

                admin_id          = idr["admin_id"] != DBNull.Value ? Convert.ToInt32(idr["admin_id"]) : 0,
                FullName          = idr["FullName"] != DBNull.Value ? Convert.ToString(idr["FullName"]) : String.Empty,
				Job_Description   = idr["Job_Description"] != DBNull.Value ? Convert.ToString(idr["Job_Description"]) : String.Empty,
				Country_id        = idr["Country_id"] != DBNull.Value ? Convert.ToInt32(idr["Country_id"]) : 0,
				Country_name      = idr["Country_name"] != DBNull.Value ? Convert.ToString(idr["Country_name"]) : String.Empty,
				Organization_id   = idr["Organization_id"] != DBNull.Value ? Convert.ToInt32(idr["Organization_id"]) : 0,
				Organization_name = idr["Organization_name"] != DBNull.Value ? Convert.ToString(idr["Organization_name"]) : String.Empty,
				Area_id           = idr["Area_id"] != DBNull.Value ? Convert.ToInt32(idr["Area_id"]) : 0,
				Area_name         = idr["Area_name"] != DBNull.Value ? Convert.ToString(idr["Area_name"]) : String.Empty,
                Branch_ID         = idr["Branch_ID"] != DBNull.Value ? Convert.ToInt32(idr["Branch_ID"]) : 0,
				Branch_name       = idr["Branch_name"] != DBNull.Value ? Convert.ToString(idr["Branch_name"]) : String.Empty,
				Dept_id           = idr["Dept_id"] != DBNull.Value ? Convert.ToInt32(idr["Dept_id"]) : 0,
				Dept_name         = idr["Dept_name"] != DBNull.Value ? Convert.ToString(idr["Dept_name"]) : String.Empty,
                Role_id           = idr["Role_id"] != DBNull.Value ? Convert.ToInt32(idr["Role_id"]) : 0,
                Email             = idr["Email"] != DBNull.Value ? Convert.ToString(idr["Email"]) : String.Empty,
                Title             = idr["Title"] != DBNull.Value ? Convert.ToString(idr["Title"]) : String.Empty,
				active            = idr["active"] != DBNull.Value ? Convert.ToBoolean(idr["active"]) : false,
                flag              = idr["flag"] != DBNull.Value ? Convert.ToInt32(idr["flag"]) : 0,


            });

        }

        return adminusersI;

    }

    public class adminusers

    {

        public int? admin_id { get; set; }        
		public string FullName { get; set; }
		public string Job_Description { get; set; }
		public int? Country_id { get; set; }
		public string Country_name { get; set; }
		public int? Organization_id { get; set; }
		public string Organization_name { get; set; }
		public int? Area_id { get; set; }
		public string Area_name { get; set; }
        public int? Branch_ID { get; set; }
		public string Branch_name { get; set; }
        public int? Dept_id { get; set; }
		public string Dept_name { get; set; }
        public int? Role_id { get; set; }
        public string Email { get; set; }
        public string Title { get; set; }
        public Boolean? active { get; set; }
        public int? flag { get; set; }

    }
	

  
	
	
	// get pages
       [WebMethod(EnableSession = true)]
    public static string getPages()

    {
        string config = Convert.ToString(ConfigurationManager.ConnectionStrings["dbcon"]);

        List<pages> pages = new List<pages>();

        SqlConnection con = new SqlConnection(config);

        con.Open();

        using (SqlCommand cmd = new SqlCommand("SELECT Menu.* FROM User_Authority INNER JOIN Menu ON User_Authority.menu_id = Menu.id and User_Authority.admin_id=@admin_id" , con))

        {
cmd.Parameters.Add("@admin_id", SqlDbType.Int).Value = HttpContext.Current.Session["admin_id"];
             SqlDataReader idr = cmd.ExecuteReader();

            if (idr.HasRows)

            {

                pages = populatepagesLisst(idr, con);

            }

        }



        con.Close();

        return JsonConvert.SerializeObject(pages);

    }
    public static List<pages> populatepagesLisst(SqlDataReader idr, SqlConnection con)

    {

        List<pages> pagesI = new List<pages>();

        while (idr.Read())

        {

            pagesI.Add(new pages

            {

                id = Convert.ToInt32(idr["id"]),
				CategoryId = Convert.ToInt32(idr["CategoryId"]),
                Name = Convert.ToString(idr["Name"]),
                Path = Convert.ToString(idr["Path"])


            });

        }



        return pagesI;

    }

    public class pages

    {

        public int id { get; set; }
		public int CategoryId { get; set; }
        public string Name { get; set; }
        public string Path { get; set; }


    }
	
	
}