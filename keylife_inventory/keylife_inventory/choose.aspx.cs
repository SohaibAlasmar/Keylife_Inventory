using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class choose : System.Web.UI.Page
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
        string sql = "select * from users,materials where user_id=users.id and (material=N'" + TextBox1.Text.ToString() + "' or sub_place=N'" + TextBox1.Text.ToString() + "');";
        SqlCommand cms = new SqlCommand(sql, con);
        SqlDataAdapter da = new SqlDataAdapter(sql, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        grid_quan.DataSource = dt;
        grid_quan.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("add_user.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("add_material.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("edit_quan.aspx");
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("login.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("delete_mat.aspx");
    }

    protected void grid_quan_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_quan.PageIndex = e.NewPageIndex;
                fill();
    }

    protected void grid_quan_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }

    protected void grid_quan_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

        if (TextBox1.Text != "")
            fill_search();
        else
            fill();
    }
    

    protected void grid_quan_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grid_quan.EditIndex = e.NewEditIndex;
        if (TextBox1.Text != "")
            fill_search();
        else
            fill();
    }

    protected void grid_quan_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int id = Convert.ToInt32(grid_quan.DataKeys[e.RowIndex].Value.ToString());
        string name = ((TextBox)grid_quan.Rows[e.RowIndex].Cells[5].Controls[0]).Text;

        using (con)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("update materials set Quantity=" + name,con );

            int t = cmd.ExecuteNonQuery();
            if (t > 0)
            {

                grid_quan.EditIndex = -1;
                fill();
            }
        }
    }


    protected void grid_quan_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grid_quan.EditIndex = -1;
       if (TextBox1.Text != "")
            fill_search();
        else
            fill();
    }
}