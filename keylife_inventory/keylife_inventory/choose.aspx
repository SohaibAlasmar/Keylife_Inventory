<%@ Page Language="C#" AutoEventWireup="true" CodeFile="choose.aspx.cs" Inherits="choose" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>الرئيسية</title>
    <style>
        *{
            width:100%;
            margin-top:0px
        }
         html{
             background:url(images/back.jpg) no-repeat center center fixed;
          background-size:cover;
              
        }
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            width: 100px;
            margin-top:20px
        }
        .btn{
            width:200px;
            height:50px;
            margin:10px;
            background-color:#002448;
            border:2px solid white;
            transition:0.5s;
            font-weight:bold;
            font-size:20px;
            color:white
            }
        .btn:hover{
            border-radius:5%;
            color:#002448;
            background-color:white;
            border:2px solid #002448;
        }
          #header{
      margin-top:0px;
      padding:0px;
      height:140px;
      width:100%;
      background-color:rgba(0,0,0,0.2);
      border-bottom:3px solid #002448;
  }
        .auto-style3 {
            width: 100px;
        }
          #grid_quan{
           margin-top:30px;
            background-color:rgba(0, 36, 72,0.5);

        }
         
    </style>
</head>
<body>
    <form id="form1" runat="server">
      <div id="header" class="auto-style1">
              <br />
              <asp:ImageButton CssClass="img-responsive center-block" ID="ImageButton1" style="outline:none" runat="server" Height="96px" ImageUrl="~/images/logo1.png" Width="493px" OnClick="ImageButton1_Click" />
              </div>
        <div class="auto-style1">
            <table align="center" class="auto-style2" dir="ltr">
                <tr>
                    <td>
                        <asp:Button ID="Button3" class="btn" runat="server" Text="حذف مادة" OnClick="Button3_Click" />
                    </td>
                    <td>
                        <asp:Button ID="Button4" class="btn" runat="server" Text="تعديل مادة" OnClick="Button4_Click" />
                    </td>
                    <td>
                        <asp:Button ID="Button2" class="btn" runat="server" Text="اضافة مادة" OnClick="Button2_Click" />
                    </td>
                    <td>
                        <asp:Button ID="Button1" class="btn" runat="server" Text="اضافة مستخدم" OnClick="Button1_Click" />
                    </td>
                </tr>
                </table>
        </div>
    
        <p class="auto-style1">
            
            &nbsp;<asp:TextBox ID="TextBox1" style="text-align:center" runat="server" Width="150px" placeholder="بحث" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
&nbsp;&nbsp;&nbsp; </p>
        <table align="center" class="auto-style3" dir="rtl">
            <tr>
                <td class="auto-style1">
                    <asp:GridView ID="grid_quan" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="grid_quan_SelectedIndexChanged" Width="500px" AllowPaging="True" OnPageIndexChanging="grid_quan_PageIndexChanging" PageSize="15" OnRowDeleting="grid_quan_RowDeleting" DataKeyNames="mat_id" OnRowEditing="grid_quan_RowEditing" OnRowCancelingEdit="grid_quan_RowCancelingEdit" OnRowUpdating="grid_quan_RowUpdating">
                        <Columns>
                            <asp:BoundField DataField="mat_id" HeaderText="رقم المادة" ReadOnly="True" />
                            <asp:BoundField DataField="material" HeaderText="اسم المادة" ReadOnly="True" />
                            <asp:BoundField DataField="name" HeaderText="صاحب الاضافة" ReadOnly="True" />
                            <asp:BoundField DataField="place" HeaderText="المكان" ReadOnly="True" />
                            <asp:BoundField DataField="sub_place" HeaderText="المكان تحديدا" ReadOnly="True" />
                            <asp:BoundField DataField="Quantity" HeaderText="الكمية" />
                            <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                        </Columns>
                    </asp:GridView>
                      </td>
            </tr>
        </table>
    
    </form>
</body>
</html>
