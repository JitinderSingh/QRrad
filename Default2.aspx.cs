﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Default2 : System.Web.UI.Page
{
    private void CreateAlphaPagings()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("PageIndex");
        dt.Columns.Add("PageText");
        if (this.ViewState["Paging"] == null)
        {
            for (int i = 65; i <= 90; i++)
            {
                DataRow dr = dt.NewRow();
                dr[0] = Char.ConvertFromUtf32(i);
                dr[1] = Char.ConvertFromUtf32(i);
                dt.Rows.Add(dr);
            }
            DataRow drNew = dt.NewRow();
            drNew["PageIndex"] = "All";
            drNew["PageText"] = "All";
            dt.Rows.Add(drNew);
            this.ViewState["Paging"] = dt;
        }
        else
            dt = (DataTable)this.ViewState["Paging"];
        DataList1.DataSource = dt;
        DataList1.DataBind();
    }


    private void BindGrid(string StartAlpha)
    {

        string sql = "";
        if (StartAlpha == "All")
            sql = "Select LN, FN from Users Order By LN Desc";
        else
            sql = "Select LN, FN from Users Where LN Like '" + StartAlpha
                + "%' Order By LN Desc ";

        string connString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        SqlConnection con = new SqlConnection(connString);

        //con.ConnectionString = strConnection;

        con.Open();
        SqlDataAdapter adp = new SqlDataAdapter(sql, con);
        DataSet ds = new DataSet();
        adp.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.ViewState["SelectedText"] = "All";
            CreateAlphaPagings();
            BindGrid(this.ViewState["SelectedText"].ToString());
        }

    }

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        LinkButton lbkbtnPaging = (LinkButton)e.CommandSource;
        BindGrid(e.CommandArgument.ToString());
        this.ViewState["SelectedText"] = e.CommandArgument.ToString();
        CreateAlphaPagings();
    }


    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.AlternatingItem
          || e.Item.ItemType == ListItemType.Item)
        {
            if (this.ViewState["SelectedText"] != null)
            {
                LinkButton lbkbtnPaging = (LinkButton)e.Item.FindControl("lnkbtnPaging");
                if (this.ViewState["SelectedText"].ToString() == lbkbtnPaging.Text)
                    lbkbtnPaging.Enabled = false;
            }
        }
    }
}