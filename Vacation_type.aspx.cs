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

public partial class _Vacation_type : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
	
	 
	
   // insert to HR_Vacation_Type
	
   [WebMethod]

    public static string NewHR_Vacation_Type(HR_Vacation_Type Vacation_Type)

    {

        string config = Convert.ToString(ConfigurationManager.ConnectionStrings["dbcon"]);

        List<HR_Vacation_Type> HR_Vacation_Type = new List<HR_Vacation_Type>();

        SqlConnection con = new SqlConnection(config);

        con.Open();

        using (SqlCommand cmd = new SqlCommand("insert into HR_Vacation_Type (Type_Name) values (@Type_Name)", con))
                    {
                        cmd.Parameters.Add("@Type_Name", SqlDbType.VarChar).Value = Vacation_Type.Type_Name;  
			
                    	cmd.ExecuteNonQuery();
                  }

            con.Close();
		
    return JsonConvert.SerializeObject(HR_Vacation_Type);
    }
        public class HR_Vacation_Type

    {
        public string Type_Name { get; set; }
      
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
	

	
		// delete vacation
	
	[WebMethod]

	public static string updateHide(HideDetails detail)

	{
		string config = Convert.ToString(ConfigurationManager.ConnectionStrings["dbcon"]);

		List<HideDetails> HideDetails = new List<HideDetails>();

		SqlConnection con = new SqlConnection(config);

		con.Open();

		        using (SqlCommand cmd = new SqlCommand("update HR_Vacation_Type set Hide= @Hide where id = @id;", con))

        {

			cmd.Parameters.AddWithValue("@id", detail.id);
			cmd.Parameters.AddWithValue("@Hide", detail.Hide);
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
			   Hide       = Convert.ToBoolean(idr["Hide"]),
			    id          = Convert.ToInt32(idr["id"])
			});
		}
		return HideDetailsI;
	}
	
	public class HideDetails

	{
		public Boolean?  Hide { get; set; }
		public int?  id { get; set; }

	}
	
	
}
	