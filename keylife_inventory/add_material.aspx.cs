using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class add_materials : System.Web.UI.Page
{
   
    SqlConnection con = new SqlConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            txt_describe_ar.Text = null;
            txt_brand.Text = null;
            txt_describe_en.Text = null;
            txt_catagory.Text = null;
            txt_data_sh.Text = null;
            txt_describe_en.Text = null;
            txt_lst_vlu.Text = "0";
            txt_place.Text = null;
            txt_quan.Text = "0";
            txt_serial.Text = null;
            txt_subplace.Text = null;
            txt_unit.Text = null;
            txt_value.Text = null;
        }
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


        if (txt_value.Text == null && txt_catagory.Text == null && txt_brand.Text == null)
        {
            SqlCommand cmd = new SqlCommand("select * from colors where category='" + txt_catagory.Text + "';", con);
            con.Open();
            SqlDataReader r;
            r = cmd.ExecuteReader();

            if (r.HasRows)
            {

                while (r.Read())
                {
                    con.Close();


                }
            }
            else
            {
                con.Close();
                SqlCommand cmd_add = new SqlCommand("insert into colors values ('" + txt_catagory.Text + "')", con);
                con.Open();

                cmd_add.ExecuteNonQuery();
                con.Close();
            }
            int user_id = Int32.Parse(Session["User"].ToString());
            string place = txt_place.Text;
            string sub_place = txt_subplace.Text;
            int Quantity = Int32.Parse(txt_quan.Text);
            string date_time = DateTime.Now.ToString();
            string sireal_num = txt_serial.Text;
            string brand = txt_brand.Text;
            string title_ar = txt_describe_ar.Text;
            string title_en = txt_describe_en.Text;
            string value = txt_value.Text;
            int least_vlu = Int32.Parse(txt_lst_vlu.Text);
            string unit = txt_unit.Text;
            string datasheet = txt_data_sh.Text;
            string category = txt_catagory.Text;
            string sql = "insert into materials values('" + user_id + "',N'" + place + "',N'" + sub_place + "',N'" + Quantity + "',N'" + date_time + "',N'" + sireal_num + "',N'" + brand + "',N'" + title_en + "',N'" + category + "',N'" + title_ar + "',N'" + unit + "',N'" + datasheet + "',N'" + value + "',N'" + least_vlu + "')";
            SqlCommand cmd_ = new SqlCommand(sql, con);
            con.Open();

            cmd_.ExecuteNonQuery();
            con.Close();
            lbl_message.Text = "تم الاضافة بنجاح";




        }

        else
        {

            SqlCommand cmd = new SqlCommand("select * from colors where category='" + txt_catagory.Text + "';", con);
            con.Open();
            SqlDataReader r;
            r = cmd.ExecuteReader();

            if (r.HasRows)
            {

                while (r.Read())
                {
                    break;

                }
                con.Close();

            }
            else
            {
                con.Close();
                SqlCommand cmd_add = new SqlCommand("insert into colors(category) values ('" + txt_catagory.Text + "')", con);
                con.Open();

                cmd_add.ExecuteNonQuery();
                con.Close();
            }
            string sql = "select * from materials where (category='" + txt_catagory.Text + "' and brand='" + txt_brand.Text + "' and value='" + txt_value.Text + "' and sireal_num='" + txt_serial.Text + "' and unit='" + txt_unit.Text + "')";
            SqlCommand cmd_ = new SqlCommand(sql, con);
            con.Open();
            SqlDataReader rr;
            rr = cmd_.ExecuteReader();

            if (rr.HasRows)
            {

                while (rr.Read())
                {
                    break;

                }
                con.Close();

            }
            else
            {
                con.Close();

                int user_id = Int32.Parse(Session["User"].ToString());
                string place = txt_place.Text;
                string sub_place = txt_subplace.Text;
                int Quantity = Int32.Parse(txt_quan.Text);
                string date_time = DateTime.Now.ToString();
                string sireal_num = txt_serial.Text;
                string brand = txt_brand.Text;
                string title_ar = txt_describe_ar.Text;
                string title_en = txt_describe_en.Text;
                string value = txt_value.Text;
                int least_vlu = Int32.Parse(txt_lst_vlu.Text);
                string unit = txt_unit.Text;
                string datasheet = txt_data_sh.Text;
                string category = txt_catagory.Text;
                string sql1 = "insert into materials values('" + user_id + "',N'" + place + "',N'" + sub_place + "',N'" + Quantity + "',N'" + date_time + "',N'" + sireal_num + "',N'" + brand + "',N'" + title_en + "',N'" + category + "',N'" + title_ar + "',N'" + unit + "',N'" + datasheet + "',N'" + value + "',N'" + least_vlu + "')";
                SqlCommand cmd1_ = new SqlCommand(sql1, con);
                con.Open();

                cmd1_.ExecuteNonQuery();
                con.Close();

                lbl_message.Text = "تم الاضافة بنجاح";






            }


        }



    }   
        

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("choose.aspx");
    }
}
