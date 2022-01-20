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
            text-align: center;
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
          tr.GridPager td {
    height: 26px;
    margin: 0;
    padding: 0;
    border: 0;
}

.GridPager a, .GridPager span {
    display: block;
    width: 20px;
    font-weight: bold;
    text-align: center;
    text-decoration: none;
    margin: 0;
    padding: 0;
    font-size:80%;
}

.GridPager a {
    background-color: #307a79;
    color: black;
    border: 1px solid white;
    height: 20px;
    font-size:80%;
    margin:5px 0;
    border-radius:3px;
}

.GridPager span {
    background-color: white;
    color: #000;
    border: 1px solid #307a79;
    height: 20px;
    border-radius:3px;

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
            <asp:TextBox ID="TextBox1" style="text-align:center" runat="server" Width="150px" placeholder="Search" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                    
                     <p><a href="colors.aspx">Edit colors</a></p>
                    
       <table align="center" class="table">
            <tr>
                <td>
                    <asp:GridView ID="grid_quan" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="grid_quan_SelectedIndexChanged" Width="642px" AllowPaging="True" OnPageIndexChanging="grid_quan_PageIndexChanging" PageSize="80" OnRowDeleting="grid_quan_RowDeleting" OnRowEditing="grid_quan_RowEditing" OnRowUpdating="grid_quan_RowUpdating" OnRowCommand="grid_quan_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="mat_id" HeaderText="Id" ReadOnly="True" />
                            <asp:BoundField DataField="name" HeaderText="User name" ReadOnly="True" />
                            <asp:BoundField DataField="place" HeaderText="Main address" />
                            <asp:BoundField DataField="sub_place" HeaderText="Sub address" />
                            <asp:BoundField DataField="category" HeaderText="Category" />
                            <asp:BoundField DataField="brand" HeaderText="Brand" />
                            <asp:BoundField DataField="sireal_num" HeaderText="Serial number" />
                            <asp:BoundField DataField="value" HeaderText="Value" />
                            <asp:BoundField DataField="unit" HeaderText="Unit" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                            <asp:BoundField DataField="title_en" HeaderText="Describtion" />
                            <asp:BoundField DataField="datasheet" HeaderText="Data sheet" />
                            <asp:BoundField DataField="least_vlu" HeaderText="Minmum quantity" />
                            <asp:ButtonField ButtonType="Button" CommandName="edit" Text="Edit" />
                            <asp:ButtonField ButtonType="Button" CommandName="delete" Text="Delete" />
                        </Columns>
<PagerStyle Wrap="False" CssClass="GridPager" HorizontalAlign="Center" VerticalAlign="Middle" />  

                    </asp:GridView>
                </td>
            </tr>
        </table>
    
            <asp:Button ID="Button1" runat="server" CssClass="btn" Height="35px" Text="Back" Width="60px" OnClick="Button1_Click1" />
        </div>
    
    
    </form>
</body>
</html>
