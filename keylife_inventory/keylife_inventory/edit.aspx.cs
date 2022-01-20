using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class edit : System.Web.UI.Page
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
            string sql = "select * from materials where mat_id=" + Session["id"].ToString();
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                lbl_manu.Text = Session["id"].ToString();
                txt_name.Text = dr["material"].ToString();
                txt_place.Text = dr["place"].ToString();
                txt_subplace.Text = dr["sub_place"].ToString();
                txt_quan.Text = dr["Quantity"].ToString();
            }
            con.Close();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("edit_quan.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string sql = "update materials set  Quantity="+ txt_quan.Text+ ",material=N'"+txt_name.Text+ "',place=N'"+txt_place.Text
            + "',sub_place=N'"+txt_subplace.Text+"'"+" where mat_id=" +Session["id"].ToString();
        SqlCommand cmd = new SqlCommand(sql, con);

        string sql_edit = "insert into edited_mat (mat_name,userID,edit_time,last_quan,new_quan) values (@name,@id,@time,@lquan,@nquan)";
        SqlCommand cmd_edit = new SqlCommand(sql_edit, con);
        SqlCommand quan = new SqlCommand("select Quantity from materials where mat_id="+Int32.Parse(lbl_manu.Text) , con);
        SqlDataReader dr;

        if (txt_name.Text != "")
        {
            if (txt_place.Text != "")
            {
                if (txt_subplace.Text != "")
                {
                    if (txt_quan.Text != "")
                    {
                        con.Open();
                        dr = quan.ExecuteReader();
                        dr.Read();
                        cmd_edit.Parameters.AddWithValue("@name", txt_name.Text);
                        cmd_edit.Parameters.AddWithValue("@id", Session["id"].ToString());
                        cmd_edit.Parameters.AddWithValue("@time", DateTime.Now.ToString());
                        cmd_edit.Parameters.AddWithValue("@lquan", dr["Quantity"].ToString());
                        cmd_edit.Parameters.AddWithValue("@nquan", txt_quan.Text);
                        con.Close();
                        con.Open();
                       cmd_edit.ExecuteNonQuery();
                        cmd.ExecuteNonQuery();
                        
                        con.Close();
                        lbl_message.Text = "تمت التعديل بنجاح";
                    }
                    else
                    {
                        lbl_message.Text = "ادخل الكمية موجبة او سالبة";
                    }
                }
                else
                {
                    lbl_message.Text = "ادخل الرف";
                }
            }
            else
            {
                lbl_message.Text = "ادخل المكان";
            }
        }
        else
        {
            lbl_message.Text = "ادخل الاسم";
        }
        ///////////////////////////////////////////
        

    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("login.aspx");
    }
}