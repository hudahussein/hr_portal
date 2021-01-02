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

public partial class _Hr : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
				Emp_id            = idr["Emp_id"] != DBNull.Value ? Convert.ToInt32(idr["Emp_id"]) : 0,
                FullName          = idr["FullName"] != DBNull.Value ? Convert.ToString(idr["FullName"]) : String.Empty,
				Job_Description   = idr["Job_Description"] != DBNull.Value ? Convert.ToString(idr["Job_Description"]) : String.Empty,
				Branch_name       = idr["Branch_name"] != DBNull.Value ? Convert.ToString(idr["Branch_name"]) : String.Empty,
				Dept_name         = idr["Dept_name"] != DBNull.Value ? Convert.ToString(idr["Dept_name"]) : String.Empty,
            });

        }

        return adminusersI;

    }

    public class adminusers

    {

        public int? admin_id { get; set; } 
		public int? Emp_id { get; set; } 
		public string FullName { get; set; }
		public string Job_Description { get; set; }
		public string Branch_name { get; set; }
		public string Dept_name { get; set; }
    }
	
	
		// get Vacations_Requests    
	
	[WebMethod]
    public static string getVacations_Requests()

    {
        string config = Convert.ToString(ConfigurationManager.ConnectionStrings["dbcon"]);

        List<vacations> vacations = new List<vacations>();

        SqlConnection con = new SqlConnection(config);

        con.Open();

        using (SqlCommand cmd = new SqlCommand("select * from HR_Vacations_Requests", con))

        {

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
                               id                   = idr["id"] != DBNull.Value ? Convert.ToInt32(idr["id"]) : 0,
							   Requester_id         = idr["Requester_id"] != DBNull.Value ? Convert.ToInt32(idr["Requester_id"]) : 0,
							   Dept_id              = idr["Dept_id"] != DBNull.Value ? Convert.ToInt32(idr["Dept_id"]) : 0,
							   Deduction_name       = idr["Deduction_name"] != DBNull.Value ? Convert.ToString(idr["Deduction_name"]) : String.Empty,
							   Deduction_id         = idr["Deduction_id"] != DBNull.Value ? Convert.ToInt32(idr["Deduction_id"]) : 0,
							   Vacation_Type_id     = idr["Vacation_Type_id"] != DBNull.Value ? Convert.ToInt32(idr["Vacation_Type_id"]) : 0,
							   Vacation_Type_name   = idr["Vacation_Type_name"] != DBNull.Value ? Convert.ToString(idr["Vacation_Type_name"]) : String.Empty,
							   Vacation_Type_Others = idr["Vacation_Type_Others"] != DBNull.Value ? Convert.ToString(idr["Vacation_Type_Others"]) : String.Empty,
							   Total_Days           = idr["Total_Days"] != DBNull.Value ? Convert.ToInt32(idr["Total_Days"]) : 0,
							   Emergency_Contact    = idr["Emergency_Contact"] != DBNull.Value ? Convert.ToString(idr["Emergency_Contact"]) : String.Empty,
							   Requester_Comment    = idr["Requester_Comment"] != DBNull.Value ? Convert.ToString(idr["Requester_Comment"]) : String.Empty,
							   Manager_Comment      = idr["Manager_Comment"] != DBNull.Value ? Convert.ToString(idr["Manager_Comment"]) : String.Empty,
							   HR_Comment           = idr["HR_Comment"] != DBNull.Value ? Convert.ToString(idr["HR_Comment"]) : String.Empty,
							   Attach_File          = idr["Attach_File"] != DBNull.Value ? Convert.ToString(idr["Attach_File"]) : String.Empty,
							   Status               = idr["Status"] != DBNull.Value ? Convert.ToInt32(idr["Status"]) : 0,
							   Hide                 = idr["Hide"] != DBNull.Value ? Convert.ToBoolean(idr["Hide"]) : false,
				               HR_Hide              = idr["HR_Hide"] != DBNull.Value ? Convert.ToBoolean(idr["HR_Hide"]) : false,
							   OFF_Day              = idr["OFF_Day"] != DBNull.Value ? Convert.ToInt32(idr["OFF_Day"]) : 0,
							   Entry_date           = Convert.ToDateTime(idr["Entry_date"])

            });

        }

        return vacationsI;

    }
	 public class vacations

    {
		public int id { get; set; }
		public int Requester_id { get; set; }
		public int Dept_id { get; set; }
		public string Deduction_name { get; set; }
		public int Deduction_id { get; set; }
		public string Vacation_Type_name { get; set; }
		public int Vacation_Type_id { get; set; }
		public string Vacation_Type_Others { get; set; }	
		public int Total_Days { get; set; }
		public string Emergency_Contact { get; set; }
		public string Requester_Comment { get; set; }
		public string Manager_Comment { get; set; }
		public string HR_Comment { get; set; }
		public string Attach_File { get; set; }
		public int Status { get; set; }
		public Boolean? HR_Hide { get; set; }
		public Boolean? Hide { get; set; }
		public int OFF_Day { get; set; }
		public DateTime Entry_date { get; set; }
    }
	
	
	// get HR_DaysOFF_Requests

	[WebMethod]
	public static string getrequestsData()

	{
		string config = Convert.ToString(ConfigurationManager.ConnectionStrings["dbcon"]);

		List<requests> requests = new List<requests>();

		SqlConnection con = new SqlConnection(config);

		con.Open();

		using (SqlCommand cmd = new SqlCommand("Select * from HR_DaysOFF_Requests where Canceled <> 'True'", con))

		{

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
							  Emp_id            = idr["Emp_id"] != DBNull.Value ? Convert.ToInt32(idr["Emp_id"]) : 0,
							  Dept_id           = idr["Dept_id"] != DBNull.Value ? Convert.ToInt32(idr["Dept_id"]) : 0,
							  Status            = idr["Status"] != DBNull.Value ? Convert.ToInt32(idr["Status"]) : 0,
							  Date_From         = idr["Date_From"] != DBNull.Value ? Convert.ToString(idr["Date_From"]) : String.Empty,
							  Date_To           = idr["Date_To"] != DBNull.Value ? Convert.ToString(idr["Date_To"]) : String.Empty,
							  Requester_Comment = idr["Requester_Comment"] != DBNull.Value ? Convert.ToString(idr["Requester_Comment"]) : String.Empty,
							  Manager_Comment   = idr["Manager_Comment"] != DBNull.Value ? Convert.ToString(idr["Manager_Comment"]) : String.Empty,
							  HR_Comment        = idr["HR_Comment"] != DBNull.Value ? Convert.ToString(idr["HR_Comment"]) : String.Empty,
							  ExpirationDate    = (idr["ExpirationDate"] == DBNull.Value) ? (DateTime?)null : Convert.ToDateTime(idr["ExpirationDate"]),
							  Entry_date        = Convert.ToDateTime(idr["Entry_date"])
						  });

		}

		return requestsI;

	}

	public class requests

	{
		public int? id { get; set; }
		public int? Emp_id { get; set; }
		public int? Dept_id { get; set; }
		public int? Status { get; set; }
		public string Date_From { get; set; }
		public string Date_To { get; set; }
		public string Requester_Comment { get; set; }
		public string Manager_Comment { get; set; }
		public string HR_Comment { get; set; }
		public DateTime? ExpirationDate { get; set; }
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

		using (SqlCommand cmd = new SqlCommand("Select * from HR_Vacations_Period", con))

		{

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
	

	// update work status
	[WebMethod]

	public static string updateStatus(StatusDetails detail)

	{
		string config = Convert.ToString(ConfigurationManager.ConnectionStrings["dbcon"]);

		List<StatusDetails> StatusDetails = new List<StatusDetails>();

		SqlConnection con = new SqlConnection(config);

		con.Open();

		using (SqlCommand cmd = new SqlCommand("update HR_DaysOFF_Requests set Status= @Status, ExpirationDate= @ExpirationDate where id = @id;", con))

		{

			cmd.Parameters.AddWithValue("@id", detail.id);
			cmd.Parameters.AddWithValue("@Status", detail.Status);
			cmd.Parameters.AddWithValue("@ExpirationDate", detail.ExpirationDate);
			cmd.ExecuteNonQuery();
		}

		con.Close();

		return JsonConvert.SerializeObject(StatusDetails);
	}

	public static List<StatusDetails> populateStatusDetailsLisst(SqlDataReader idr, SqlConnection con)

	{

		List<StatusDetails> StatusDetailsI = new List<StatusDetails>();

		while (idr.Read())

		{

			StatusDetailsI.Add(new StatusDetails
				  {
					  id      = Convert.ToInt32(idr["id"]),
					 Status   = Convert.ToInt32(idr["Status"]),
					 ExpirationDate   = Convert.ToString(idr["ExpirationDate"]),
				  });
		}
		return StatusDetailsI;
	}

	public class StatusDetails

	{
		public int?  Status { get; set; }
		public int?  id { get; set; }
		public string  ExpirationDate { get; set; }

	}


	// insert reason of work rejection 

	[WebMethod]

	public static string Rejection(HR_DaysOFF_Requests request)

	{

		string config = Convert.ToString(ConfigurationManager.ConnectionStrings["dbcon"]);

		List<HR_DaysOFF_Requests> HR_DaysOFF_Requests = new List<HR_DaysOFF_Requests>();

		SqlConnection con = new SqlConnection(config);

		con.Open();

		SqlCommand cmd = new SqlCommand("update HR_DaysOFF_Requests set HR_Comment= @HR_Comment, Status= @Status where id = @id;", con);
		{
			cmd.Parameters.AddWithValue("@HR_Comment", request.HR_Comment);
			cmd.Parameters.AddWithValue("@Status", request.Status);
			cmd.Parameters.AddWithValue("@id", request.id);
			cmd.ExecuteNonQuery();
		}

		con.Close();

		return JsonConvert.SerializeObject(HR_DaysOFF_Requests);

	}
	public class HR_DaysOFF_Requests

	{
		public int id { get; set; }
		public int Status { get; set; }
		public string HR_Comment { get; set; }
	}
	
	
	
	// update vacation status
	[WebMethod]

	public static string updateVacStatus(StatusVacDetails detail)

	{
		string config = Convert.ToString(ConfigurationManager.ConnectionStrings["dbcon"]);

		List<StatusVacDetails> StatusVacDetails = new List<StatusVacDetails>();

		SqlConnection con = new SqlConnection(config);

		con.Open();

		using (SqlCommand cmd = new SqlCommand("update HR_Vacations_Requests set Status= @Status where id = @id;", con))

		{

			cmd.Parameters.AddWithValue("@id", detail.id);
			cmd.Parameters.AddWithValue("@Status", detail.Status);
			cmd.ExecuteNonQuery();
		}

		con.Close();

		return JsonConvert.SerializeObject(StatusVacDetails);
	}

	public static List<StatusVacDetails> populateStatusVacDetailsLisst(SqlDataReader idr, SqlConnection con)

	{

		List<StatusVacDetails> StatusVacDetailsI = new List<StatusVacDetails>();

		while (idr.Read())

		{

			StatusVacDetailsI.Add(new StatusVacDetails
				  {
					  id      = Convert.ToInt32(idr["id"]),
					 Status   = Convert.ToInt32(idr["Status"]),
				  });
		}
		return StatusVacDetailsI;
	}

	public class StatusVacDetails

	{
		public int?  Status { get; set; }
		public int?  id { get; set; }

	}

// insert reason of vacation rejection 

	[WebMethod]

	public static string VacRejection(HR_Vacations_Requests request)

	{

		string config = Convert.ToString(ConfigurationManager.ConnectionStrings["dbcon"]);

		List<HR_Vacations_Requests> HR_Vacations_Requests = new List<HR_Vacations_Requests>();

		SqlConnection con = new SqlConnection(config);

		con.Open();

		SqlCommand cmd = new SqlCommand("update HR_Vacations_Requests set HR_Comment= @HR_Comment, Status= @Status  where id = @id;", con);
		{
			cmd.Parameters.AddWithValue("@HR_Comment", request.HR_Comment);
			cmd.Parameters.AddWithValue("@Status", request.Status);
			cmd.Parameters.AddWithValue("@id", request.id);
			cmd.ExecuteNonQuery();
		}

		con.Close();

		return JsonConvert.SerializeObject(HR_Vacations_Requests);

	}
	public class HR_Vacations_Requests

	{
		public int id { get; set; }
		public int Status { get; set; }
		public string HR_Comment { get; set; }
	}
	
	// delete vacation Request from HR page
	
	[WebMethod]

	public static string updateHide(HideDetails detail)

	{
		string config = Convert.ToString(ConfigurationManager.ConnectionStrings["dbcon"]);

		List<HideDetails> HideDetails = new List<HideDetails>();

		SqlConnection con = new SqlConnection(config);

		con.Open();

		        using (SqlCommand cmd = new SqlCommand("update HR_Vacations_Requests set HR_Hide= @HR_Hide where id = @id;", con))

        {

			cmd.Parameters.AddWithValue("@id", detail.id);
			cmd.Parameters.AddWithValue("@HR_Hide", detail.HR_Hide);
			cmd.ExecuteNonQuery();
        }

		con.Close();

		return JsonConvert.SerializeObject(HideDetails);
	}

	public static List<HideDetails> populateHideDetailsLisst(SqlDataReader idr, SqlConnection con)

	{

		List<HideDetails> HideDetailsI = new List<HideDetails>();

		while (idr.Read())

		{

			HideDetailsI.Add(new HideDetails

			{
				 id       = Convert.ToInt32(idr["id"]),
			     HR_Hide  = Convert.ToBoolean(idr["HR_Hide"])
			   
			});
		}
		return HideDetailsI;
	}
	
	public class HideDetails

	{
		public Boolean?  HR_Hide { get; set; }
		public int?  id { get; set; }

	}
	
	// get HR_Vacations_Period
	[WebMethod]
    public static string getPeriodsData(HR_Vacations_Period detail)

    {
        string config = Convert.ToString(ConfigurationManager.ConnectionStrings["dbcon"]);

        List<HR_Vacations_Period> HR_Vacations_Period = new List<HR_Vacations_Period>();

        SqlConnection con = new SqlConnection(config);

        con.Open();

        using (SqlCommand cmd = new SqlCommand("SELECT * FROM HR_Vacations_Period WHERE Emp_code = @Emp_id and Request_id IN (SELECT id FROM HR_Vacations_Requests WHERE Vacation_Type_name = 'Casual' and Status = 4)", con))

        {
			cmd.Parameters.AddWithValue("@Emp_id", detail.Emp_id);
            SqlDataReader idr = cmd.ExecuteReader();

            if (idr.HasRows)

            {
                HR_Vacations_Period = populateHR_Vacations_PeriodLisst(idr, con);
            }

        }

        con.Close();

        return JsonConvert.SerializeObject(HR_Vacations_Period);

    }
	
	
	// check balance
	[WebMethod]

	public static string checkBalance(HR_Employees_Vacation_Balance detail)

	{
		List<HR_Employees_Vacation_Balance> HR_Employees_Vacation_Balance = new List<HR_Employees_Vacation_Balance>();
		string config = Convert.ToString(ConfigurationManager.ConnectionStrings["dbcon"]);

		SqlConnection con = new SqlConnection(config);

		con.Open();

		using (SqlCommand cmd = new SqlCommand("select * from  HR_Employees_Vacation_Balance where Emp_id = @Emp_id", con))

        {
			 cmd.Parameters.AddWithValue("@Emp_id", detail.Emp_id);
             SqlDataReader idr = cmd.ExecuteReader();

            if (idr.HasRows)

            {
                HR_Employees_Vacation_Balance = populateHR_Employees_Vacation_BalanceLisst(idr, con);

            }

        }

		con.Close();

		return JsonConvert.SerializeObject(HR_Employees_Vacation_Balance);
	}
	
	// update total balance and casual days
	[WebMethod]

	public static string updateBalance(HR_Employees_Vacation_Balance detail)

	{
		string config = Convert.ToString(ConfigurationManager.ConnectionStrings["dbcon"]);

		List<HR_Employees_Vacation_Balance> HR_Employees_Vacation_Balance = new List<HR_Employees_Vacation_Balance>();

		SqlConnection con = new SqlConnection(config);

		con.Open();

		using (SqlCommand cmd = new SqlCommand("update HR_Employees_Vacation_Balance set Annual_Balance= @Annual_Balance, Casual_Balance= @Casual_Balance, Old_Balance= @Old_Balance,Off_Balance= @Off_Balance,Q1= @Q1,Q2= @Q2,Q3= @Q3,Q4= @Q4,Old_Balance_ExpirationDate = @Old_Balance_ExpirationDate where Emp_id = @Emp_id;", con))

		{

			cmd.Parameters.AddWithValue("@Emp_id", detail.Emp_id);
			cmd.Parameters.AddWithValue("@Annual_Balance", detail.Annual_Balance);
			cmd.Parameters.AddWithValue("@Casual_Balance", detail.Casual_Balance);
			cmd.Parameters.AddWithValue("@Old_Balance", detail.Old_Balance);
			cmd.Parameters.AddWithValue("@Off_Balance", detail.Off_Balance);
			cmd.Parameters.AddWithValue("@Q1", detail.Q1);
			cmd.Parameters.AddWithValue("@Q2", detail.Q2);
			cmd.Parameters.AddWithValue("@Q3", detail.Q3);
			cmd.Parameters.AddWithValue("@Q4", detail.Q4);
			cmd.Parameters.AddWithValue("@Old_Balance_ExpirationDate", detail.Old_Balance_ExpirationDate);
			cmd.ExecuteNonQuery();
		}

		con.Close();

		return JsonConvert.SerializeObject(HR_Employees_Vacation_Balance);
	}

	public static List<HR_Employees_Vacation_Balance> populateHR_Employees_Vacation_BalanceLisst(SqlDataReader idr, SqlConnection con)

	{

		List<HR_Employees_Vacation_Balance> EmpBalanceI = new List<HR_Employees_Vacation_Balance>();

		while (idr.Read())

		{

			EmpBalanceI.Add(new HR_Employees_Vacation_Balance
				  {
					 Emp_id         = Convert.ToInt32(idr["Emp_id"]),
					 Annual_Balance = Convert.ToInt32(idr["Annual_Balance"]),
					 Casual_Balance = Convert.ToInt32(idr["Casual_Balance"]),
					 Off_Balance    = idr["Off_Balance"] != DBNull.Value ? Convert.ToInt32(idr["Off_Balance"]) : 0 ,
					 Q1             = Convert.ToInt32(idr["Q1"]),
					 Q2             = Convert.ToInt32(idr["Q2"]),
					 Q3             = Convert.ToInt32(idr["Q3"]),
					 Q4             = Convert.ToInt32(idr["Q4"]),
					 Old_Balance    = Convert.ToInt32(idr["Old_Balance"]),
					 Old_Balance_ExpirationDate = Convert.ToString(idr["Old_Balance_ExpirationDate"])
				  });
		}
		return EmpBalanceI;
	}
	
	public class HR_Employees_Vacation_Balance

	{
		public int? Emp_id { get; set; }
		public int? Annual_Balance { get; set; }
		public int? Casual_Balance { get; set; }
		public int? Off_Balance { get; set; }
		public int? Q1 { get; set; }
		public int? Q2 { get; set; }
		public int? Q3 { get; set; }
		public int? Q4 { get; set; }
		public int? Old_Balance { get; set; }
		public string Old_Balance_ExpirationDate { get; set; }
	}
	
// update Off Days
	[WebMethod]

	public static string updateOffDays(EmpOffDays detail)

	{
		string config = Convert.ToString(ConfigurationManager.ConnectionStrings["dbcon"]);

		List<EmpOffDays> EmpOffDays = new List<EmpOffDays>();

		SqlConnection con = new SqlConnection(config);

		con.Open();

		using (SqlCommand cmd = new SqlCommand("update HR_Employees_Vacation_Balance set Off_Balance= @Off_Balance where Emp_id = @Emp_id;", con))

		{

			cmd.Parameters.AddWithValue("@Emp_id", detail.Emp_id);
			cmd.Parameters.AddWithValue("@Off_Balance", detail.Off_Balance);
			cmd.ExecuteNonQuery();
		}

		con.Close();

		return JsonConvert.SerializeObject(EmpOffDays);
	}

	public static List<EmpOffDays> populateEmpOffDaysLisst(SqlDataReader idr, SqlConnection con)

	{

		List<EmpOffDays> EmpOffDaysI = new List<EmpOffDays>();

		while (idr.Read())

		{

			EmpOffDaysI.Add(new EmpOffDays
				  {
					 Emp_id         = Convert.ToInt32(idr["Emp_id"]),
					 Off_Balance    = Convert.ToInt32(idr["Off_Balance"]),
				  });
		}
		return EmpOffDaysI;
	}

	public class EmpOffDays

	{
		public int?  Emp_id { get; set; }
		public int?  Off_Balance { get; set; }

	}
	

	/*******************/
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
	
// delete work Request from HR page
	
	[WebMethod]

	public static string updateWorkHide(HideWorkDetails detail)

	{
		string config = Convert.ToString(ConfigurationManager.ConnectionStrings["dbcon"]);

		List<HideWorkDetails> HideWorkDetails = new List<HideWorkDetails>();

		SqlConnection con = new SqlConnection(config);

		con.Open();

		        using (SqlCommand cmd = new SqlCommand("update HR_DaysOFF_Requests set HR_Hide= @HR_Hide where id = @id;", con))

        {

			cmd.Parameters.AddWithValue("@id", detail.id);
			cmd.Parameters.AddWithValue("@HR_Hide", detail.HR_Hide);
			cmd.ExecuteNonQuery();
        }

		con.Close();

		return JsonConvert.SerializeObject(HideWorkDetails);
	}

	public static List<HideWorkDetails> populateHideWorkDetailsLisst(SqlDataReader idr, SqlConnection con)

	{

		List<HideWorkDetails> HideWorkDetailsI = new List<HideWorkDetails>();

		while (idr.Read())

		{

			HideWorkDetailsI.Add(new HideWorkDetails

			{
				 id          = Convert.ToInt32(idr["id"]),
			     HR_Hide     = Convert.ToBoolean(idr["HR_Hide"])
			   
			});
		}
		return HideWorkDetailsI;
	}
	
	public class HideWorkDetails

	{
		public Boolean?  HR_Hide { get; set; }
		public int?  id { get; set; }

	}
}