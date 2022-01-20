<%@ Page Language="C#" AutoEventWireup="true" CodeFile="edit_quan.aspx.cs" Inherits="edit_quan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>تعديل كمية</title>

    <style>
        body{
            margin-top:0px;
            width:100%
        }
          #header{
      margin-top:0px;
      padding:0px;
      height:140px;
      width:100%;
      background-color:rgba(48, 122, 121,0.15);
      border-bottom:3px solid white;
      
  }
     html{
             background:url(images/back.jpg) no-repeat center center fixed;
          background-size:cover;
              
        }
       
        #grid_quan{
           margin-top:50px;
            background-color:rgba(48, 122, 121,0.5);

        }
        .auto-style1 {
            text-align: center;
        }
             .btn{
            color:white;
            width:50px;
            height:30px;
            margin:10px;
            background-color:#307a79;
            border:2px solid black;
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
    
                 <div class="auto-style1">
    
                 <div id="header" class="auto-style1">
              <br />
              <asp:ImageButton CssClass="img-responsive center-block" ID="ImageButton1" style="outline:none" runat="server" Height="96px" ImageUrl="~/images/logo2.png" Width="493px" OnClick="ImageButton1_Click" />
              </div>
    <br />
            <asp:TextBox ID="TextBox1" style="text-align:center" runat="server" Width="150px" placeholder="بحث" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>

       <table align="center" class="table">
            <tr>
                <td>
                    <asp:GridView ID="grid_quan" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="grid_quan_SelectedIndexChanged" Width="642px" AllowPaging="True" OnPageIndexChanging="grid_quan_PageIndexChanging" PageSize="15" OnRowDeleting="grid_quan_RowDeleting">
                        <Columns>
                            <asp:ButtonField ButtonType="Button" CommandName="delete" Text="تعديل" />
                            <asp:BoundField DataField="Quantity" HeaderText="الكمية" />
                            <asp:BoundField DataField="sub_place" HeaderText="المكان تحديدا" />
                            <asp:BoundField DataField="place" HeaderText="المكان" />
                            <asp:BoundField DataField="name" HeaderText="صاحب الاضافة" />
                            <asp:BoundField DataField="material" HeaderText="اسم المادة" />
                            <asp:BoundField DataField="mat_id" HeaderText="رقم المادة" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    
            <asp:Button ID="Button1" runat="server" CssClass="btn" Height="35px" Text="عودة" Width="60px" OnClick="Button1_Click1" />
        </div>
    
                 </div>
    
    </form>
</body>
</html>
