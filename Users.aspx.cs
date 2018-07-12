using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;

public partial class Users : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void bGetUser_Click(object sender, EventArgs e)
    {

        string connString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        using (SqlConnection con = new SqlConnection(connString))
        {
            con.Open();
            string qry = "SELECT FormalN, CellNum, Email, PhoneNum, PhotoUrl FROM Users, Aliases WHERE [Alias] = @lbText AND Aliases.UserID = Users.UserID";
            SqlCommand cmd = new SqlCommand(qry, con);
            cmd.Parameters.AddWithValue("@lbText", tbGetUser.Text);
            using (SqlDataReader rdr = cmd.ExecuteReader())
            {
                gvReturnedUser.DataSource = rdr;
                gvReturnedUser.DataBind();
            }
        } 
    } 
    protected void bInsertImage_Click(object sender, EventArgs e)
    {

        string connString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        using (SqlConnection con = new SqlConnection(connString))
        {
            con.Open();

            string UserID = DetailsView1.Rows[0].Cells[1].Text.ToString();

            using (SqlCommand com = new SqlCommand("UPDATE Users SET PhotoUrl = (@IM) WHERE UserID = @UserID", con))
            {
                //byte[] imageData = File.ReadAllBytes(Image1.ImageUrl.ToString());
                string url = "~/" + Image1.ImageUrl.ToString();
                com.Parameters.AddWithValue("@IM", url);
                com.Parameters.AddWithValue("@UserID", UserID);
                com.ExecuteNonQuery();
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //string UserID = ((TextBox)DetailsView1.Rows[1].Cells[2].Controls[0]).Text;
        //string UserID = DetailsView1.Rows[0].Cells[1].Text.ToString();
        //Image1.ImageUrl = "~/Handler.ashx?UserID=" +UserID;
        
        if (FileUpload1.HasFile)
        {
            string FileNm = "Images/" + FileUpload1.FileName; 
            //FileNm=pic.jpg
            //FileUpload1.SaveAs(@"C:\Users\potok\Pictures\" + FileNm);
            Image1.ImageUrl = FileNm;        
        } 
    }
}

//private static void CreateCommand(string queryString,
//    string connectionString)
//{
//    using (SqlConnection connection = new SqlConnection(
//               connectionString))
//    {
//        SqlCommand command = new SqlCommand(queryString, connection);
//        command.Connection.Open();
//        command.ExecuteNonQuery();
//    }
//}
