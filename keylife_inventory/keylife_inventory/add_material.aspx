<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add_material.aspx.cs" Inherits="add_materials" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>اضافة مادة</title>
    <style>
          body{
            margin-top:0px;
            width:100%
        }
           html{
             background:url(images/back.jpg) no-repeat center center fixed;
          background-size:cover;
        }
           .center{
               position:center center;
               align-content:center;

           }
           table{
               border-radius:5%;
               width: 300px;
            margin-top:90px;
            background-color:rgba(48, 122, 121,0.5);
            border:solid 2px white;
           }
            table td{
            height:30px;
        }
       
        .auto-style2 {
            text-align: center;
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
        hr{
            border:1px solid white;
            
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
         <div id="header" class="auto-style2">
              <br />
              <asp:ImageButton CssClass="img-responsive center-block" ID="ImageButton1" style="outline:none" runat="server" Height="96px" ImageUrl="~/images/logo2.png" Width="493px" OnClick="ImageButton1_Click" />
              </div>
    <div class="center">
    
        <table align="center"  dir="rtl">
            <tr>
                <td><strong>اسم المادة</strong></td>

                <td>
                    <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td><strong>المكان</strong></td>
                <td>
                    <asp:TextBox ID="txt_place" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td><strong>الرف</strong></td>
                <td>
                    <asp:TextBox ID="txt_subplace" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td><strong>الكمية</strong></td>
                <td>
                    <asp:TextBox ID="txt_quan"  runat="server" TextMode="Number"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td><strong></strong></td>
                <td>
                    <asp:Label ID="lbl_message" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="2">
                    <hr class="hr"/>
                    <strong>
                    <asp:Button ID="Button1" runat="server" CssClass="btn" Height="31px" Text="عودة" Width="62px" OnClick="Button1_Click" />
                    </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>
                    <asp:Button ID="Button2" runat="server" CssClass="btn" Height="31px" Text="اضافة"  Width="62px" OnClick="Button2_Click" />
                    </strong></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
