using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class edit_quan : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("server=DESKTOP-DDJK47I;database=inventorydb;integrated security=sspi");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }
        if (!Page.IsPostBack)
        {
            fill();
        }
    }
    void fill()
    {
        string sql = "select * from users,materials where user_id=users.id";
        SqlCommand cms = new SqlCommand(sql, con);
        SqlDataAdapter da = new SqlDataAdapter(sql, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        grid_quan.DataSource = dt;
        grid_quan.DataBind();
    }
    void fill_search()
    {
        string sql = "select * from users,materials where user_id=users.id and material=N'" + TextBox1.Text.ToString() + "';";
        SqlCommand cms = new SqlCommand(sql, con);
        SqlDataAdapter da = new SqlDataAdapter(sql, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        grid_quan.DataSource = dt;
        grid_quan.DataBind();
    }
    protected void grid_quan_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void grid_quan_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_quan.PageIndex = e.NewPageIndex;
        fill();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("choose.aspx");
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        Response.Redirect("choose.aspx");
    }



    protected void grid_quan_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int j = Convert.ToInt32(e.RowIndex);
        GridViewRow row = grid_quan.Rows[j];
        String row_num = row.Cells[6].Text;
        Session["id"] = row_num.ToString();
        Response.Redirect("edit.aspx");

    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("login.aspx");
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        if (TextBox1.Text != "")
            fill_search();
        else
            fill();
    }
}