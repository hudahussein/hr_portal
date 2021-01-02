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

public partial class _Manger : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

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
							   Delegation_EmpCode   = idr["Delegation_EmpCode"] != DBNull.Value ? Convert.ToInt32(idr["Delegation_EmpCode"]) : 0,
							   Delegation_EmpName   = idr["Delegation_EmpName"] != DBNull.Value ? Convert.ToString(idr["Delegation_EmpName"]) : String.Empty,
							   Vacation_Type_Others = idr["Vacation_Type_Others"] != DBNull.Value ? Convert.ToString(idr["Vacation_Type_Others"]) : String.Empty,
							   Total_Days           = idr["Total_Days"] != DBNull.Value ? Convert.ToInt32(idr["Total_Days"]) : 0,
							   Emergency_Contact    = idr["Emergency_Contact"] != DBNull.Value ? Convert.ToString(idr["Emergency_Contact"]) : String.Empty,
							   Requester_Comment    = idr["Requester_Comment"] != DBNull.Value ? Convert.ToString(idr["Requester_Comment"]) : String.Empty,
							   Manager_Comment      = idr["Manager_Comment"] != DBNull.Value ? Convert.ToString(idr["Manager_Comment"]) : String.Empty,
							   HR_Comment           = idr["HR_Comment"] != DBNull.Value ? Convert.ToString(idr["HR_Comment"]) : String.Empty,
							   Attach_File          = idr["Attach_File"] != DBNull.Value ? Convert.ToString(idr["Attach_File"]) : String.Empty,
							   Status               = idr["Status"] != DBNull.Value ? Convert.ToInt32(idr["Status"]) : 0,
							   Hide                 = idr["Hide"] != DBNull.Value ? Convert.ToBoolean(idr["Hide"]) : false,
							   Hide_Manager         = idr["Hide_Manager"] != DBNull.Value ? Convert.ToBoolean(idr["Hide_Manager"]) : false,
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
		public int Delegation_EmpCode { get; set; }
		public string Delegation_EmpName { get; set; }
		public int Vacation_Type_id { get; set; }
		public string Vacation_Type_Others { get; set; }	
		public int Total_Days { get; set; }
		public string Emergency_Contact { get; set; }
		public string Requester_Comment { get; set; }
		public string Manager_Comment { get; set; }
		public string HR_Comment { get; set; }
		public string Attach_File { get; set; }
		public int Status { get; set; }
		public Boolean? Hide { get; set; }
		public Boolean? Hide_Manager { get; set; }
		public int OFF_Day { get; set; }
		public DateTime Entry_date { get; set; }
	}


	// get adminusers
	[WebMethod]
	public static string getadminusersData()

	{
		string config = Convert.ToString(ConfigurationManager.ConnectionStrings["dbcon"]);

		List<adminusers> adminusers = new List<adminusers>();

		SqlConnection con = new SqlConnection(config);

		con.Open();

		using (SqlCommand cmd = new SqlCommand("select * from adminusers", con))

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
								Area_id           = idr["Area_id"] != DBNull.Value ? Convert.ToInt32(idr["Area_id"]) : 0,
								Area_name         = idr["Area_name"] != DBNull.Value ? Convert.ToString(idr["Area_name"]) : String.Empty,
								Branch_ID         = idr["Branch_ID"] != DBNull.Value ? Convert.ToInt32(idr["Branch_ID"]) : 0,
								Branch_name       = idr["Branch_name"] != DBNull.Value ? Convert.ToString(idr["Branch_name"]) : String.Empty,
								Dept_id           = idr["Dept_id"] != DBNull.Value ? Convert.ToInt32(idr["Dept_id"]) : 0,
								Dept_name         = idr["Dept_name"] != DBNull.Value ? Convert.ToString(idr["Dept_name"]) : String.Empty,
								Role_id           = idr["Role_id"] != DBNull.Value ? Convert.ToInt32(idr["Role_id"]) : 0,
								Email             = idr["Email"] != DBNull.Value ? Convert.ToString(idr["Email"]) : String.Empty,
								Title             = idr["Title"] != DBNull.Value ? Convert.ToString(idr["Title"]) : String.Empty,
								active            = idr["active"] != DBNull.Value ? Convert.ToBoolean(idr["active"]) : false


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
							  Canceled          = idr["Canceled"] != DBNull.Value ? Convert.ToBoolean(idr["Canceled"]) : false,
							  Manager_Hide      = idr["Manager_Hide"] != DBNull.Value ? Convert.ToBoolean(idr["Manager_Hide"]) : false,
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
		public DateTime Entry_date { get; set; }
		public Boolean? Canceled { get; set; }
		public Boolean? Manager_Hide { get; set; }
	}

	
	// get HR_Employees_Vacation_Balance


	[WebMethod]
	public static string getHR_Employees_Vacation_BalanceData()

	{
		string config = Convert.ToString(ConfigurationManager.ConnectionStrings["dbcon"]);

		List<HR_Employees_Vacation_Balance> HR_Employees_Vacation_Balance = new List<HR_Employees_Vacation_Balance>();

		SqlConnection con = new SqlConnection(config);

		con.Open();

		using (SqlCommand cmd = new SqlCommand("Select * from HR_Employees_Vacation_Balance", con))

		{

			SqlDataReader idr = cmd.ExecuteReader();

			if (idr.HasRows)

			{

				HR_Employees_Vacation_Balance = populateHR_Employees_Vacation_BalanceLisst(idr, con);

			}

		}

		con.Close();

		return JsonConvert.SerializeObject(HR_Employees_Vacation_Balance);

	}

	public static List<HR_Employees_Vacation_Balance> populateHR_Employees_Vacation_BalanceLisst(SqlDataReader idr, SqlConnection con)

	{

		List<HR_Employees_Vacation_Balance> HR_Employees_Vacation_BalanceI = new List<HR_Employees_Vacation_Balance>();

		while (idr.Read())

		{

			HR_Employees_Vacation_BalanceI.Add(new HR_Employees_Vacation_Balance

						  {
							 id                         = idr["id"] != DBNull.Value ? Convert.ToInt32(idr["id"]) : 0,
							  Emp_id                     = idr["Emp_id"] != DBNull.Value ? Convert.ToInt32(idr["Emp_id"]) : 0,
							  Annual_Balance             = idr["Annual_Balance"] != DBNull.Value ? Convert.ToInt32(idr["Annual_Balance"]) : 0,
							  Casual_Balance             = idr["Casual_Balance"] != DBNull.Value ? Convert.ToInt32(idr["Casual_Balance"]) : 0,
							  Q1                         = idr["Q1"] != DBNull.Value ? Convert.ToInt32(idr["Q1"]) : 0,
							  Q2                         = idr["Q2"] != DBNull.Value ? Convert.ToInt32(idr["Q2"]) : 0,
							  Q3                         = idr["Q3"] != DBNull.Value ? Convert.ToInt32(idr["Q3"]) : 0,
							  Q4                         = idr["Q4"] != DBNull.Value ? Convert.ToInt32(idr["Q4"]) : 0
						  });

		}

		return HR_Employees_Vacation_BalanceI;

	}

	public class HR_Employees_Vacation_Balance

	{
		public int? id { get; set; }
		public int? Emp_id { get; set; }
		public int? Annual_Balance { get; set; }
		public int? Casual_Balance { get; set; }
		public int? Q1 { get; set; }
		public int? Q2 { get; set; }
		public int? Q3 { get; set; }
		public int? Q4 { get; set; }
	}




	// update work status
	[WebMethod]

	public static string updateStatus(StatusDetails detail)

	{
		string config = Convert.ToString(ConfigurationManager.ConnectionStrings["dbcon"]);

		List<StatusDetails> StatusDetails = new List<StatusDetails>();

		SqlConnection con = new SqlConnection(config);

		con.Open();

		using (SqlCommand cmd = new SqlCommand("update HR_DaysOFF_Requests set Status= @Status where id = @id;", con))

		{

			cmd.Parameters.AddWithValue("@id", detail.id);
			cmd.Parameters.AddWithValue("@Status", detail.Status);
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
				  });
		}
		return StatusDetailsI;
	}

	public class StatusDetails

	{
		public int?  Status { get; set; }
		public int?  id { get; set; }

	}


	// insert reason of work rejection 

	[WebMethod]

	public static string Rejection(HR_DaysOFF_Requests request)

	{

		string config = Convert.ToString(ConfigurationManager.ConnectionStrings["dbcon"]);

		List<HR_DaysOFF_Requests> HR_DaysOFF_Requests = new List<HR_DaysOFF_Requests>();

		SqlConnection con = new SqlConnection(config);

		con.Open();

		SqlCommand cmd = new SqlCommand("update HR_DaysOFF_Requests set Manager_Comment= @Manager_Comment, Status= @Status where id = @id;", con);
		{
			cmd.Parameters.AddWithValue("@Manager_Comment", request.Manager_Comment);
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
		public string Manager_Comment { get; set; }
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

		SqlCommand cmd = new SqlCommand("update HR_Vacations_Requests set Manager_Comment= @Manager_Comment, Status= @Status  where id = @id;", con);
		{
			cmd.Parameters.AddWithValue("@Manager_Comment", request.Manager_Comment);
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
		public string Manager_Comment { get; set; }
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
							  Emp_code          = idr["Emp_code"] != DBNull.Value ? Convert.ToInt32(idr["Emp_code"]) : 0,
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
		public int? Emp_code { get; set; }
		public int? Type_id { get; set; }
		public string Date_from { get; set; }
		public string Date_to { get; set; }
	}
	
// delete vacation Request from manger page
	
	[WebMethod]

	public static string updateHide(HideDetails detail)

	{
		string config = Convert.ToString(ConfigurationManager.ConnectionStrings["dbcon"]);

		List<HideDetails> HideDetails = new List<HideDetails>();

		SqlConnection con = new SqlConnection(config);

		con.Open();

		        using (SqlCommand cmd = new SqlCommand("update HR_Vacations_Requests set Hide_Manager= @Hide_Manager where id = @id;", con))

        {

			cmd.Parameters.AddWithValue("@id", detail.id);
			cmd.Parameters.AddWithValue("@Hide_Manager", detail.Hide_Manager);
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
				 id              = Convert.ToInt32(idr["id"]),
			    Hide_Manager     = Convert.ToBoolean(idr["Hide_Manager"])
			   
			});
		}
		return HideDetailsI;
	}
	
	public class HideDetails

	{
		public Boolean?  Hide_Manager { get; set; }
		public int?  id { get; set; }

	}
	
	
	// delete work Request from manger page
	
	[WebMethod]

	public static string updateWorkHide(HideWorkDetails detail)

	{
		string config = Convert.ToString(ConfigurationManager.ConnectionStrings["dbcon"]);

		List<HideWorkDetails> HideWorkDetails = new List<HideWorkDetails>();

		SqlConnection con = new SqlConnection(config);

		con.Open();

		        using (SqlCommand cmd = new SqlCommand("update HR_DaysOFF_Requests set Manager_Hide= @Manager_Hide where id = @id;", con))

        {

			cmd.Parameters.AddWithValue("@id", detail.id);
			cmd.Parameters.AddWithValue("@Manager_Hide", detail.Manager_Hide);
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
				 id              = Convert.ToInt32(idr["id"]),
			    Manager_Hide     = Convert.ToBoolean(idr["Manager_Hide"])
			   
			});
		}
		return HideWorkDetailsI;
	}
	
	public class HideWorkDetails

	{
		public Boolean?  Manager_Hide { get; set; }
		public int?  id { get; set; }

	}
}
