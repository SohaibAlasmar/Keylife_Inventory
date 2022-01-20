<%@ Page Language="C#" AutoEventWireup="true" CodeFile="edit.aspx.cs" Inherits="edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>تعديل معلومات مواد</title>
    <style>
         body{
            margin-top:0px;
            width:100%
        }
         html{
             background:url(images/back.jpg) no-repeat center center fixed;
          background-size:cover;
              
        }
        .auto-style1 {
            text-align: center;
        }
        .table {
            margin-top:90px;
            width: 300px;
            background-color:rgba(48, 122, 121,0.15);
            border-radius:5%;
            border:solid 2px white;
        }
        hr{
            border:1px solid white;
            
        }
        table td{
            height:30px;
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
        .auto-style3 {
            text-align: right;
        }
        .auto-style4 {
            text-align: left;
        }
            #header{
      margin-top:0px;
      padding:0px;
      height:140px;
      width:100%;
      background-color:rgba(48, 122, 121,0.15);
      border-bottom:3px solid white;
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <div id="header" class="auto-style1">
              <br />
              <asp:ImageButton CssClass="img-responsive center-block" ID="ImageButton1" style="outline:none" runat="server" Height="96px" ImageUrl="~/images/logo2.png" Width="493px" OnClick="ImageButton1_Click" />
              </div>
    <div class="auto-style1">
    
        <table align="center" class="table" dir="rtl">
            <tr>
                <td class="auto-style4">رقم المادة</td>
                <td class="auto-style1">
                    <asp:Label style="background-color:white;text-align:right" Width="150px" ID="lbl_manu" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">اسم المادة</td>
                <td>
                    <asp:TextBox ID="txt_name" runat="server" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">المكان</td>
                <td>
                    <asp:TextBox ID="txt_place" runat="server" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">الرف</td>
                <td>
                    <asp:TextBox ID="txt_subplace" runat="server" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">الكمية</td>
                <td>
                    <asp:TextBox ID="txt_quan" runat="server" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style3">
                    <asp:Label ID="lbl_message" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <hr />
                    <strong>
                    <asp:Button ID="Button1" runat="server" CssClass="btn" Text="عودة" OnClick="Button1_Click" />
                    </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>
                    <asp:Button ID="Button2" runat="server" CssClass="btn" Text="تعديل" OnClick="Button2_Click" />
                    </strong></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
