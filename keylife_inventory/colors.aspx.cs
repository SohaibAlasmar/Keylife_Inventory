using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class colors : System.Web.UI.Page
{
 
    SqlConnection con = new SqlConnection("");
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
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "change()", true);
        
    }
    void fill()
    {
        string sql = "select * from colors";
        SqlCommand cms = new SqlCommand(sql, con);
        SqlDataAdapter da = new SqlDataAdapter(sql, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        grid_quan.DataSource = dt;
        grid_quan.DataBind();

    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("choose.aspx");

    }

    protected void grid_quan_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }

    protected void grid_quan_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            int j = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = grid_quan.Rows[j];
            String row_num = row.Cells[0].Text;
            String clr = row.Cells[1].Text;

            Response.Write("<script>window.location = '#lbl_category';</script>");
            lbl_category.Text = row_num;

            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "changeClr("+clr+")", true);

        }
    }

    protected void grid_quan_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void grid_quan_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grid_quan.EditIndex = e.NewEditIndex;
        fill();
    }

    protected void grid_quan_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

       
    }

    protected void grid_quan_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grid_quan.EditIndex = -1;
        fill();
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
    protected void grid_quan_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView dr = (DataRowView)e.Row.DataItem;
            string color = dr[1].ToString();

            e.Row.Cells[2].BackColor = Color.FromName(HexToColor(color).ToString());
        }






    }

    protected void grid_quan_SelectedIndexChanged(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {



        con.Open();
        SqlCommand cmd = new SqlCommand("update colors set color='" + theColor.Value.ToString() + "' where category='" + lbl_category.Text.ToString() + "'", con);

        cmd.ExecuteNonQuery();

        con.Close();

        fill();
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        Response.Redirect("edit_quan.aspx");
    }
}