using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class choose : System.Web.UI.Page
{
    
    SqlConnection con = new SqlConnection("");

    protected void Page_Load(object sender, EventArgs e)
    {
        check();
        if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }
        if (!Page.IsPostBack)
        {
            fill();
            fill_print();
        }
    }
    void fill_print()
    {
        string sql = "select * from users,materials where user_id=users.id";
        SqlCommand cms = new SqlCommand(sql, con);
        SqlDataAdapter da = new SqlDataAdapter(sql, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        grid_print.DataSource = dt;
        grid_print.DataBind();
    }
    void check()
    {
        string sql = "select * from users,materials where user_id=users.id and quantity<least_vlu";
        SqlCommand cmd = new SqlCommand(sql, con);
        SqlDataReader r;
        con.Open();
        r = cmd.ExecuteReader();
        if (r.HasRows)
        {
            while (r.Read())
            {
                Button3.BackColor = System.Drawing.Color.Red;

            }
            con.Close();
        }
        else
        {
            con.Close();
            Button3.BackColor = System.Drawing.Color.Blue;
            Button3.ForeColor = System.Drawing.Color.White;

        }
    }
    public static string HexToColor(string hexString)
    {
        if (hexString != "")
        {
            //replace # occurences
            if (hexString.IndexOf('#') != -1)
                hexString = hexString.Replace("#", "");

            int r, g, b = 0;

            r = int.Parse(hexString.Substring(0, 2), System.Globalization.NumberStyles.AllowHexSpecifier);
            g = int.Parse(hexString.Substring(2, 2), System.Globalization.NumberStyles.AllowHexSpecifier);
            b = int.Parse(hexString.Substring(4, 2), System.Globalization.NumberStyles.AllowHexSpecifier);
            string rgb = "rgba(" + r + "," + g + "," + b + ",0.15)";
            return rgb;
        }
        string nice = "";
        return nice;
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
        if (TextBox1.Text != "" || TextBox1.Text != null)
        {
            string sql = "select * from users,materials where user_id=users.id and( sub_place like N'%" + TextBox1.Text.ToString() + "%' or place like N'%" + TextBox1.Text.ToString() +
               "%' or sireal_num like N'%" + TextBox1.Text.ToString() + "%' or brand like N'%" + TextBox1.Text.ToString() + "%' or category like N'%" + TextBox1.Text.ToString() +
               "%'   or title_ar like N'%" + TextBox1.Text.ToString() + "%' or title_en like N'%" + TextBox1.Text.ToString()
               + "%'  or value like N'%" + TextBox1.Text.ToString() + "%' or unit like N'%" + TextBox1.Text.ToString() +
               "%' or concat(value,' ',unit)='" + TextBox1.Text.ToString() + "' or concat(value,unit)='" + TextBox1.Text.ToString() + "' or concat(category,' ',sireal_num)='" +
               TextBox1.Text.ToString() + "'or concat(category,sireal_num)='" + TextBox1.Text.ToString() + "'or concat(category,' ',value)='" + TextBox1.Text.ToString() +
               "'or concat(category,value)='" + TextBox1.Text.ToString() + "'or concat(category,' ',value,' ',unit)='" + TextBox1.Text.ToString() + "'or concat(category,' ',value,unit)='" +
               TextBox1.Text.ToString() + "'or concat(category,value,' ',unit)='" + TextBox1.Text.ToString() + "'or concat(category,value,unit)='" + TextBox1.Text.ToString() + "');";
            SqlCommand cms = new SqlCommand(sql, con);
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            grid_print.DataSource = dt;
            grid_print.DataBind();
            grid_quan.DataSource = dt;
            grid_quan.DataBind();
        }
    }
    void fill_under_limit()
    {
        string sql = "select * from users,materials where user_id=users.id and quantity<least_vlu";
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
        lbl_error.Text = "";

        if (TextBox1.Text != "")
            fill_search();
        else
            fill();
    }


    protected void grid_quan_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grid_quan.EditIndex = e.NewEditIndex;
        if (clicked)
            fill_under_limit();
        else if (TextBox1.Text != "")
        {
            fill_search();
        }
        else
            fill();
    }

    protected void grid_quan_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int j = Convert.ToInt32(e.RowIndex);
        GridViewRow row = grid_quan.Rows[j];
        String row_num = row.Cells[0].Text;
        int id = Convert.ToInt32(grid_quan.DataKeys[e.RowIndex].Value.ToString());
        string name = ((TextBox)grid_quan.Rows[e.RowIndex].Cells[9].Controls[0]).Text;

        using (con)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("update materials set Quantity=" + name + " where mat_id=" + row_num, con);

            int t = cmd.ExecuteNonQuery();
            if (t > 0)
            {

                grid_quan.EditIndex = -1;
                fill();
            }
con.Close();
        }
        
    }


    protected void grid_quan_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grid_quan.EditIndex = -1;
        if (clicked)
            fill_under_limit();
        else if (TextBox1.Text != "")
            fill_search();
        else
            fill();
    }

    protected void grid_quan_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "gtds")
        {
            int j = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = grid_quan.Rows[j];
            String row_num = row.Cells[0].Text;
            SqlCommand cmd = new SqlCommand("select datasheet from materials where mat_id=" + row_num, con);
            con.Open();
            String x = cmd.ExecuteScalar().ToString();
            con.Close();
            if (x.Length > 3)
            {
                lbl_error.Text = "";
                //   Response.Redirect (x);
                Response.Write("<script>window.open('" + x + "','_blank');</script>");
            }
            else
                lbl_error.Text = "Data sheet is empty.";
        }
    }
    private bool clicked = false;
    protected void Button3_Click1(object sender, EventArgs e)
    {
        lbl_error.Text = "";
        fill_under_limit();
        clicked = true;
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        lbl_error.Text = "";
        if (TextBox1.Text != "")
        {
            string sql = "select * from users,materials where user_id=users.id and( sub_place like N'%" + TextBox1.Text.ToString() + "%' or place like N'%" + TextBox1.Text.ToString() +
                "%' or sireal_num like N'%" + TextBox1.Text.ToString() + "%' or brand like N'%" + TextBox1.Text.ToString() + "%' or category like N'%" + TextBox1.Text.ToString() +
                "%'   or title_ar like N'%" + TextBox1.Text.ToString() + "%' or title_en like N'%" + TextBox1.Text.ToString()
                + "%'  or value like N'%" + TextBox1.Text.ToString() + "%' or unit like N'%" + TextBox1.Text.ToString() +
                "%' or concat(value,' ',unit)='" + TextBox1.Text.ToString() + "' or concat(value,unit)='" + TextBox1.Text.ToString() + "' or concat(category,' ',sireal_num)='" +
                TextBox1.Text.ToString() + "'or concat(category,sireal_num)='" + TextBox1.Text.ToString() + "'or concat(category,' ',value)='" + TextBox1.Text.ToString() +
                "'or concat(category,value)='" + TextBox1.Text.ToString() + "'or concat(category,' ',value,' ',unit)='" + TextBox1.Text.ToString() + "'or concat(category,' ',value,unit)='"
                + TextBox1.Text.ToString() + "'or concat(category,value,' ',unit)='" + TextBox1.Text.ToString() + "'or concat(category,value,unit)='" + TextBox1.Text.ToString() + "');";
            SqlCommand cms = new SqlCommand(sql, con);
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            grid_quan.DataSource = dt;
            grid_quan.DataBind();
        }
        else
        {
            string sql = "select * from users,materials where user_id=users.id order by " + drop1.SelectedValue.ToString() + " desc;";
            SqlCommand cms = new SqlCommand(sql, con);
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            grid_quan.DataSource = dt;
            grid_quan.DataBind();
        }
    }

    protected void grid_quan_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select color from colors where category='" + DataBinder.Eval(e.Row.DataItem, "category") + "'", con);
        SqlDataReader r;

        r = cmd.ExecuteReader();
        if (r.HasRows)
        {
            while (r.Read())
            {
                e.Row.Attributes.CssStyle.Value = "background-color:" + HexToColor(r["color"].ToString());

            }
            con.Close();
        }
       

            con.Close();




    }

    protected void Button5_Click(object sender, EventArgs e)
    {

        SqlCommand cmd = new SqlCommand("select count(*) from materials", con);
        con.Open();
        int num = Int32.Parse(cmd.ExecuteScalar().ToString());
        con.Close();
        grid_print.PageSize = num;
        if (TextBox1.Text == "")
            fill_print();
        else
            fill_search();
        grid_print.Visible = true;
        Response.ClearContent();
        Response.AppendHeader("content-disposition", string.Format("attachment;filename=datacopy.xls"));
        Response.ContentType = "application/excel";

        StringWriter stringwriter = new StringWriter();
        HtmlTextWriter htmlwriter = new HtmlTextWriter(stringwriter);
        grid_print.RenderControl(htmlwriter);
        Response.Write(stringwriter.ToString());
        Response.End();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
    }
}