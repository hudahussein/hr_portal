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

public partial class _Employee : basePageSessionExpire
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*
		string config = Convert.ToString(ConfigurationManager.ConnectionStrings["dbcon"]);

        SqlConnection con = new SqlConnection(config);

        con.Open();
		// delete all rows
		using (SqlCommand cmd1 = new SqlCommand("DELETE FROM HR_Vacations_Period", con))
        cmd1.ExecuteNonQuery();

		/*
        // add column
        using (SqlCommand cmd1 = new SqlCommand("ALTER TABLE HR_Vacations_Requests ADD Dept_id int;", con))
        cmd1.ExecuteNonQuery();
		/*
        // change type
        using (SqlCommand cmd1 = new SqlCommand("ALTER TABLE HR_Vacations_Requests ALTER COLUMN Vacation_Type_name varchar(255)", con))
        cmd1.ExecuteNonQuery();
		*/
    }
	 
	
	// get Vacations_Requests    
	
	[WebMethod]
    public static string getVacations_Requests()

    {
        string config = Convert.ToString(ConfigurationManager.ConnectionStrings["dbcon"]);

        List<vacations> vacations = new List<vacations>();

        SqlConnection con = new SqlConnection(config);

        con.Open();

        using (SqlCommand cmd = new SqlCommand("select * from HR_Vacations_Requests where Requester_id = @Requester_id", con))

        {
			cmd.Parameters.Add("@Requester_id", SqlDbType.Int).Value = HttpContext.Current.Session["Emp_ID"];

            SqlDataReader idr = cmd.ExecuteReader();

            if (idr.HasRows)

            {

                vacations = populatevacationsLisst(idr, con);

            }

        }
	
        con.Close();

        return JsonConvert.SerializeObject(vacations);

    }
    public static List<vacations> populatevacationsLisst(SqlDataReader idr, SqlConnection con)

    {

        List<vacations> vacationsI = new List<vacations>();

        while (idr.Read())

        {

            vacationsI.Add(new vacations
							
            {
				id                 = idr["id"] != DBNull.Value ? Convert.ToInt32(idr["id"]) : 0,
                Delegation_EmpName = idr["Delegation_EmpName"] != DBNull.Value ? Convert.ToString(idr["Delegation_EmpName"]) : String.Empty,
				Delegation_EmpCode = idr["Delegation_EmpCode"] != DBNull.Value ? Convert.ToInt32(idr["Delegation_EmpCode"]) : 0,
                Deduction_name     = idr["Deduction_name"] != DBNull.Value ? Convert.ToString(idr["Deduction_name"]) : String.Empty,
				Deduction_id       = idr["Deduction_id"] != DBNull.Value ? Convert.ToInt32(idr["Deduction_id"]) : 0,
                Vacation_Type_id   = idr["Vacation_Type_id"] != DBNull.Value ? Convert.ToInt32(idr["Vacation_Type_id"]) : 0,
				Vacation_Type_name = idr["Vacation_Type_name"] != DBNull.Value ? Convert.ToString(idr["Vacation_Type_name"]) : String.Empty,
				Vacation_Type_Others = idr["Vacation_Type_Others"] != DBNull.Value ? Convert.ToString(idr["Vacation_Type_Others"]) : String.Empty,
                Total_Days         = idr["Total_Days"] != DBNull.Value ? Convert.ToInt32(idr["Total_Days"]) : 0,
                Emergency_Contact  = idr["Emergency_Contact"] != DBNull.Value ? Convert.ToString(idr["Emergency_Contact"]) : String.Empty,
                Requester_Comment  = idr["Requester_Comment"] != DBNull.Value ? Convert.ToString(idr["Requester_Comment"]) : String.Empty,
				Status             = idr["Status"] != DBNull.Value ? Convert.ToInt32(idr["Status"]) : 0,
                Attach_File        = idr["Attach_File"] != DBNull.Value ? Convert.ToString(idr["Attach_File"]) : String.Empty,
				Entry_date         = Convert.ToDateTime(idr["Entry_date"])
            });

        }

        return vacationsI;

    }
	 public class vacations

    {
      	public int id { get; set; }
        public string Delegation_EmpName { get; set; }
      	public int Delegation_EmpCode { get; set; }
        public string Deduction_name { get; set; }
      	public int Deduction_id { get; set; }
        public string Vacation_Type_name { get; set; }
		public int Vacation_Type_id { get; set; }
        public string Vacation_Type_Others { get; set; }
		public int Total_Days { get; set; }
        public string Emergency_Contact { get; set; }
		public string Requester_Comment { get; set; }
		public int Status { get; set; }
		public string Attach_File { get; set; }
		public DateTime Entry_date { get; set; }
    }
	

	// get HR_Vacations_Period

	[WebMethod]
	public static string getHR_Vacations_PeriodData()

	{
		string config = Convert.ToString(ConfigurationManager.ConnectionStrings["dbcon"]);

		List<HR_Vacations_Period> HR_Vacations_Period = new List<HR_Vacations_Period>();

		SqlConnection con = new SqlConnection(config);

		con.Open();

		using (SqlCommand cmd = new SqlCommand("Select * from HR_Vacations_Period where Emp_code = @Emp_code", con))

		{

			cmd.Parameters.Add("@Emp_code", SqlDbType.Int).Value = HttpContext.Current.Session["Emp_ID"];
			SqlDataReader idr = cmd.ExecuteReader();

			if (idr.HasRows)

			{

				HR_Vacations_Period = populateHR_Vacations_PeriodLisst(idr, con);

			}

		}

		con.Close();

		return JsonConvert.SerializeObject(HR_Vacations_Period);

	}

	public static List<HR_Vacations_Period> populateHR_Vacations_PeriodLisst(SqlDataReader idr, SqlConnection con)

	{

		List<HR_Vacations_Period> HR_Vacations_PeriodI = new List<HR_Vacations_Period>();

		while (idr.Read())

		{

			HR_Vacations_PeriodI.Add(new HR_Vacations_Period

						  {
							  Request_id        = idr["Request_id"] != DBNull.Value ? Convert.ToInt32(idr["Request_id"]) : 0,
							  Emp_id            = idr["Emp_code"] != DBNull.Value ? Convert.ToInt32(idr["Emp_code"]) : 0,
							  Type_id           = idr["Type_id"] != DBNull.Value ? Convert.ToInt32(idr["Type_id"]) : 0,
							  Date_from         = idr["Date_from"] != DBNull.Value ? Convert.ToString(idr["Date_from"]) : String.Empty,
							  Date_to           = idr["Date_to"] != DBNull.Value ? Convert.ToString(idr["Date_to"]) : String.Empty,
						  });

		}

		return HR_Vacations_PeriodI;

	}

	public class HR_Vacations_Period

	{
		public int? Request_id { get; set; }
		public int? Emp_id { get; set; }
		public int? Type_id { get; set; }
		public string Date_from { get; set; }
		public string Date_to { get; set; }
	}
	
	
	// get HR_Vacation_Type
	
	[WebMethod]
    public static string gettypesData()

    {
        string config = Convert.ToString(ConfigurationManager.ConnectionStrings["dbcon"]);

        List<types> types = new List<types>();

        SqlConnection con = new SqlConnection(config);

        con.Open();

        using (SqlCommand cmd = new SqlCommand("Select * from HR_Vacation_Type", con))

        {

            SqlDataReader idr = cmd.ExecuteReader();

            if (idr.HasRows)

            {

                types = populatetypesLisst(idr, con);

            }

        }

        con.Close();

        return JsonConvert.SerializeObject(types);

    }

    public static List<types> populatetypesLisst(SqlDataReader idr, SqlConnection con)

    {

        List<types> typesI = new List<types>();

        while (idr.Read())

        {

            typesI.Add(new types

            {

			    id         = idr["id"] != DBNull.Value ? Convert.ToInt32(idr["id"]) : 0,
				Type_Name  = idr["Type_Name"] != DBNull.Value ? Convert.ToString(idr["Type_Name"]) : String.Empty,
				Hide       = idr["Hide"] != DBNull.Value ? Convert.ToBoolean(idr["Hide"]) : false,
            });

        }

        return typesI;

    }

	public class types
		
    {
      	public int? id { get; set; }
        public string Type_Name { get; set; }
		public Boolean? Hide { get; set; }
    }

	// get HR_DaysOFF_Requests
	[WebMethod]
    public static string getrequestsData()

    {
        string config = Convert.ToString(ConfigurationManager.ConnectionStrings["dbcon"]);

        List<requests> requests = new List<requests>();

        SqlConnection con = new SqlConnection(config);

        con.Open();

        using (SqlCommand cmd = new SqlCommand("Select * from HR_DaysOFF_Requests where Emp_id = @Requester_id", con))

        {
			cmd.Parameters.Add("@Requester_id", SqlDbType.Int).Value = HttpContext.Current.Session["Emp_ID"];

            SqlDataReader idr = cmd.ExecuteReader();

            if (idr.HasRows)

            {

                requests = populaterequestsLisst(idr, con);

            }

        }

        con.Close();

        return JsonConvert.SerializeObject(requests);

    }

    public static List<requests> populaterequestsLisst(SqlDataReader idr, SqlConnection con)

    {

        List<requests> requestsI = new List<requests>();

        while (idr.Read())

        {

            requestsI.Add(new requests

            {
				id                = idr["id"] != DBNull.Value ? Convert.ToInt32(idr["id"]) : 0,
			    Status            = idr["Status"] != DBNull.Value ? Convert.ToInt32(idr["Status"]) : 0,
				Date_From         = idr["Date_From"] != DBNull.Value ? Convert.ToString(idr["Date_From"]) : String.Empty,
				Date_To           = idr["Date_To"] != DBNull.Value ? Convert.ToString(idr["Date_To"]) : String.Empty,
				Requester_Comment = idr["Requester_Comment"] != DBNull.Value ? Convert.ToString(idr["Requester_Comment"]) : String.Empty,
				Manager_Comment   = idr["Manager_Comment"] != DBNull.Value ? Convert.ToString(idr["Manager_Comment"]) : String.Empty,
				HR_Comment        = idr["HR_Comment"] != DBNull.Value ? Convert.ToString(idr["HR_Comment"]) : String.Empty,
				ExpirationDate    = idr["ExpirationDate"] != DBNull.Value ? Convert.ToString(idr["ExpirationDate"]) : String.Empty,
				Canceled          = idr["Canceled"] != DBNull.Value ? Convert.ToBoolean(idr["Canceled"]) : false,
				Entry_date        = Convert.ToDateTime(idr["Entry_date"])
            });

        }

        return requestsI;

    }

	public class requests
		
    {
		public int? id { get; set; }
		public int? Status { get; set; }
        public string Date_From { get; set; }
		public string Date_To { get; set; }
		public string Requester_Comment { get; set; }
		public string Manager_Comment { get; set; }
		public string HR_Comment { get; set; }
		public string ExpirationDate { get; set; }
		public Boolean? Canceled { get; set; }
		public DateTime Entry_date { get; set; }
    }
	
	
	/**********************************/
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
	
		// get categories
	
	[WebMethod]
    public static string getcatsData()

    {
        string config = Convert.ToString(ConfigurationManager.ConnectionStrings["dbcon"]);

        List<cats> cats = new List<cats>();

        SqlConnection con = new SqlConnection(config);

        con.Open();

        using (SqlCommand cmd = new SqlCommand("Select * from Categories", con))

        {

            SqlDataReader idr = cmd.ExecuteReader();

            if (idr.HasRows)

            {

                cats = populatecatsLisst(idr, con);

            }

        }

        con.Close();

        return JsonConvert.SerializeObject(cats);

    }

    public static List<cats> populatecatsLisst(SqlDataReader idr, SqlConnection con)

    {

        List<cats> catsI = new List<cats>();

        while (idr.Read())

        {

            catsI.Add(new cats

            {

			    id     = idr["id"] != DBNull.Value ? Convert.ToInt32(idr["id"]) : 0,
                Name   = idr["Name"] != DBNull.Value ? Convert.ToString(idr["Name"]) : String.Empty,
				Icon   = idr["Icon"] != DBNull.Value ? Convert.ToString(idr["Icon"]) : String.Empty,

            });

        }

        return catsI;

    }

	public class cats
    {
        public int id { get; set; }
        public string Name { get; set; }
        public string Icon { get; set; }
    }
	
}
	