<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add_user.aspx.cs" Inherits="add_user" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>اضافة مستخدم</title>
    <style>
        body{
            margin-top:0px;
            width:100%
        }
    html{
             background:url(images/back.jpg) no-repeat center center fixed;
          background-size:cover;
              
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
        .table {
            border-radius:5%;
            width: 294px;
            margin-top:90px;
            background-color:rgba(48, 122, 121,0.5);
            border:solid 2px white;
        }
        .auto-style2 {
            width: 96px;
            text-align: right;
        }
        table td{
            height:30px;
        }
       
        hr{
            border:1px solid white;
            
        }
        .auto-style4 {
            text-align: center;
        }
          #header{
      margin-top:0px;
      padding:0px;
      height:140px;
      width:100%;
      background-color:rgba(48, 122, 121,0.15);
      border-bottom:3px solid white;
      
  }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="header" class="auto-style4">
              <br />
              <asp:ImageButton CssClass="img-responsive center-block" ID="ImageButton1" style="outline:none" runat="server" Height="96px" ImageUrl="~/images/logo2.png" Width="493px" OnClick="ImageButton1_Click" />
              </div>
        <table align="center" class="table" dir="rtl">
            <tr>
                <td class="auto-style2"><strong>الاسم</strong></td>
                <td>
                    <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>اسم المستخدم</strong></td>
                <td>
                    <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>رقم المرور</strong></td>
                <td>
                    <asp:TextBox ID="txt_pass" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>تأكيد رقم المرور</strong></td>
                <td>
                    <asp:TextBox ID="txt_passconfirm" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"><strong></strong></td>
                <td>
                    <asp:Label ID="lbl_message" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4" colspan="2">
                    <hr />
                    <strong>
                    <asp:Button ID="Button2" runat="server" CssClass="btn"  Text="عودة" OnClick="Button2_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button1" runat="server" CssClass="btn"  OnClick="Button1_Click" Text="اضافة"  />
                    </strong></td>
            </tr>
        </table>
    
    </form>
</body>
</html>
