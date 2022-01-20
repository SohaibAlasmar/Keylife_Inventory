<%@ Page Language="C#" AutoEventWireup="true" CodeFile="delete_mat.aspx.cs" Inherits="delete_mat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>حدف مادة</title>
    <style>
          body{
            margin-top:0px;
            width:100%
        }
           html{
             background:url(images/back.jpg) no-repeat center center fixed;
          background-size:cover;
        }
              #header{
      margin-top:0px;
      padding:0px;
      height:140px;
      width:100%;
      background-color:rgba(48, 122, 121,0.15);
      border-bottom:3px solid white;
      
  }
        .auto-style1 {
            text-align: center;
                
        }
           #grid_quan{
           margin-top:50px;
            background-color:rgba(48, 122, 121,0.5);

        }
        .auto-style2 {
            width: 100px;
        }
           .btn{
            color:white;
            width:50px;
            height:30px;
            margin:10px;
            background-color:#307a79;
            border:2px solid white;
            transition:0.5s;
            font-weight:bold;
            font-size:15px;
            border-radius:10%;
            }
        .btn:hover{
            
            color:#307a79;
            background-color:white;
            border:2px solid #307a79;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
          <div id="header" class="auto-style1">
              <br />
              <asp:ImageButton CssClass="img-responsive center-block" ID="ImageButton1" style="outline:none" runat="server" Height="96px" ImageUrl="~/images/logo2.png" Width="493px" OnClick="ImageButton1_Click" />
              </div>
    <br />
        <div style="text-align:center" class="auto-style1">
        <asp:TextBox ID="TextBox1" style="text-align:center"  runat="server" Width="150px" placeholder="بحث" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            </div>
          <div class="auto-style1">
              <table align="center" class="auto-style2" dir="rtl">
                  <tr>
                      <td>
                    <asp:GridView ID="grid_quan" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="grid_quan_SelectedIndexChanged" Width="642px" AllowPaging="True" OnPageIndexChanging="grid_quan_PageIndexChanging" PageSize="15" OnRowDeleting="grid_quan_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="mat_id" HeaderText="رقم المادة" />
                            <asp:BoundField DataField="material" HeaderText="اسم المادة" />
                            <asp:BoundField DataField="name" HeaderText="صاحب الاضافة" />
                            <asp:BoundField DataField="place" HeaderText="المكان" />
                            <asp:BoundField DataField="sub_place" HeaderText="المكان تحديدا" />
                            <asp:BoundField DataField="Quantity" HeaderText="الكمية" />
                            <asp:ButtonField ButtonType="Button" CommandName="delete" Text="حذف" />
                        </Columns>
                    </asp:GridView>
                      </td>
                  </tr>
              </table>
          </div>
          <p class="auto-style1">
                    <strong>
                    <asp:Button ID="Button1" runat="server" CssClass="btn" Height="31px" Text="عودة" Width="62px" OnClick="Button1_Click" />
                    </strong>
          </p>
    </form>
</body>
</html>
