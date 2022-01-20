using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class add_materials : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("server=DESKTOP-DDJK47I;database=inventorydb;integrated security=sspi");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("choose.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string sql = "insert into materials(user_id,material,place,sub_place,Quantity,date_time) values (@userID,@mat,@place,@SUBplace,@Quan,@date)";
        SqlCommand cmd = new SqlCommand(sql, con);

       
        if (txt_name.Text != "")
        {
            if (txt_place.Text != "")
            {
                if (txt_subplace.Text != "")
                {
                    if (txt_quan.Text !="")
                    {

                        cmd.Parameters.AddWithValue("@userID", Session["User"].ToString());
                        cmd.Parameters.AddWithValue("@mat", txt_name.Text);
                        cmd.Parameters.AddWithValue("@place", txt_place.Text);
                        cmd.Parameters.AddWithValue("@SUBplace", txt_subplace.Text);
                        cmd.Parameters.AddWithValue("@Quan", txt_quan.Text);
                        cmd.Parameters.AddWithValue("@date", DateTime.Now.ToString());
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        lbl_message.Text = "تمت اضافة المادة بنجاح";
                    }
                    else
                    {
                        lbl_message.Text = "ادخل الكمية موجبة";
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
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("login.aspx");
    }
}