using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.Script.Serialization;

public partial class QueryDatabase : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string v = Request.QueryString["param"];
        if (v != null)
        {
            string connString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connString))
            {
                con.Open();
                //string qry = "SELECT FormalN, CellNum FROM Users, Aliases WHERE [Alias] = @lbText AND Aliases.UserID = Users.UserID";
                string qry = "SELECT FormalN, CellNum, PhoneNum, Email, PhotoUrl, Users.UserID FROM Users, Aliases WHERE [Alias] = @lbText AND Aliases.UserID = Users.UserID";
                
                SqlCommand cmd = new SqlCommand(qry, con);
                cmd.Parameters.AddWithValue("@lbText", v);
                
                Dictionary<string, string> dictionary = new Dictionary<string, string>();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                	while(rdr.Read())
                	{
	                	for(int i = 0; i < rdr.FieldCount; i++) 
						{ 
                            
                            if (rdr.GetDataTypeName(i) == "int")
                            {
                                int x = rdr.GetInt32(i);

                                dictionary.Add(rdr.GetName(i), x.ToString());
                            }
                            else
                            {                          
                                dictionary.Add(rdr.GetName(i), rdr.GetString(i));
                            }     
						}
						break;
					}
                    //GridView1.DataSource = rdr;
                    //GridView1.DataBind();

                    //Response.Write("param is ");
                    //Response.Write(v);
                    JavaScriptSerializer serializer = new JavaScriptSerializer();
					string jsonString = serializer.Serialize(dictionary);
                    
                    Response.ContentType = "application/json";
                    Response.Write(jsonString);
                }
            } 
        }
    }
}