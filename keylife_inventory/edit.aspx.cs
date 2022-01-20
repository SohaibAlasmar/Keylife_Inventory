using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class edit : System.Web.UI.Page
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
            string sql = "select * from materials where mat_id=" + Session["id"].ToString();
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                lbl_manu.Text = Session["id"].ToString();
                lbl_manu0.Text = dr["user_id"].ToString();
                txt_place.Text = dr["place"].ToString();
                txt_subplace.Text = dr["sub_place"].ToString();
                txt_quan.Text = dr["Quantity"].ToString();
                txt_describe_ar.InnerText = dr["title_ar"].ToString();
                txt_describ_en.InnerText= dr["title_en"].ToString();
                txt_brand.Text = dr["brand"].ToString();
                txt_catagory.Text = dr["category"].ToString();
                txt_unit.Text = dr["unit"].ToString();
                txt_serial_num.Text = dr["sireal_num"].ToString();
                TextArea1.InnerText = dr["datasheet"].ToString();
                txt_value.Text = dr["value"].ToString();
                txt_least_vlu.Text = dr["least_vlu"].ToString();
                
            }
            con.Close();
        }
    }

    

    protected void Button2_Click(object sender, EventArgs e)
    {
        string sql = "update materials set  Quantity="+ txt_quan.Text+ ",place =N'"+txt_place.Text
            + "',sub_place=  N'"+txt_subplace.Text+  "',title_ar=N'"+ txt_describe_ar.InnerText.ToString() +
            "',title_en=N'"+ txt_describ_en.InnerText.ToString() + "',brand=N'"+ txt_brand.Text + "',category=N'"+ txt_catagory.Text + "',unit=N'"+ txt_unit.Text +
            "',sireal_num=N'"+ txt_serial_num .Text+ "',datasheet=N'"+ TextArea1.InnerText.ToString() + "',value=N'"+ txt_value.Text + "',least_vlu=N'"+ txt_least_vlu.Text +
            "' where mat_id=" + Session["id"].ToString();
        SqlCommand cmd = new SqlCommand(sql, con);
        string sql_edit = "insert into edited_mat (userID,edit_time,last_quan,new_quan) values (@id,@time,@lquan,@nquan)";
        SqlCommand cmd_edit = new SqlCommand(sql_edit, con);
        SqlCommand quan = new SqlCommand("select Quantity from materials where mat_id=" + Int32.Parse(lbl_manu.Text), con);
        SqlDataReader dr;

        




            //edited_mat emat = new edited_mat
            //{
            //    userID = Int32.Parse(Session["user"].ToString()),
            //    edit_time = DateTime.Now.ToString(),
            //    new_quan = Int32.Parse(txt_quan.Text),
            //    new_place = item.place,
            //    last_quan=item.Quantity



            //    };
            //db.edited_mat.Add(emat);

            
                        con.Open();
                        dr = quan.ExecuteReader();
                        dr.Read();
                        cmd_edit.Parameters.AddWithValue("@id", Session["user"].ToString());
                        cmd_edit.Parameters.AddWithValue("@time", DateTime.Now.ToString());
                        cmd_edit.Parameters.AddWithValue("@lquan", dr["Quantity"].ToString());
                        cmd_edit.Parameters.AddWithValue("@nquan", txt_quan.Text);
                        con.Close();
                        con.Open();
                        cmd_edit.ExecuteNonQuery();
                         cmd.ExecuteNonQuery();
                         lbl_message.Text = "تمت التعديل بنجاح";
            
                        con.Close();
        Response.Redirect("edit_quan.aspx");
                    
                    


      

    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("choose.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("edit_quan.aspx");
    }
}