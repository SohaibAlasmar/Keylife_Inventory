<%@ Page Language="C#" AutoEventWireup="true" CodeFile="colors.aspx.cs" Inherits="colors" %>


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
        .auto-style2 {
            direction: ltr;
        }
        .auto-style3 {
            width: 100px;
        }
        .auto-style4 {
            width: 197px;
        }
        </style>
    <script>
    function  change() {
        let colorinput = document.getElementById("color").value;
        document.getElementById('theColor').value = colorinput;
        }
       
      

    </script>
</head>

<body>
    <form id="form1" runat="server">
    
                 <div class="auto-style1">
    
                 <div id="header" class="auto-style1">
              <br />
              <asp:ImageButton CssClass="img-responsive center-block" ID="ImageButton1" style="outline:none" runat="server" Height="96px" ImageUrl="~/images/logo2.png" Width="493px" OnClick="ImageButton1_Click" />
              </div>
    <br />
                    
                                   
       <table align="center" class="table">
            <tr>
                <td>
                    <asp:GridView ID="grid_quan" runat="server" AutoGenerateColumns="False"  Width="642px" AllowPaging="True" OnPageIndexChanging="grid_quan_PageIndexChanging" PageSize="80" OnRowDeleting="grid_quan_RowDeleting" OnRowEditing="grid_quan_RowEditing" OnRowUpdating="grid_quan_RowUpdating" OnRowCommand="grid_quan_RowCommand" OnRowCancelingEdit="grid_quan_RowCancelingEdit" OnRowDataBound="grid_quan_RowDataBound" OnSelectedIndexChanged="grid_quan_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="category" HeaderText="category" ReadOnly="True" />
                            <asp:BoundField  DataField="color" HeaderText="color" ReadOnly="True" />

                            <asp:BoundField HeaderText="clr" ReadOnly="True" />

                            <asp:ButtonField ButtonType="Button" CommandName="edit" Text="Edit" />

                        </Columns>
<PagerStyle Wrap="False" CssClass="GridPager" HorizontalAlign="Center" VerticalAlign="Middle" />  

                    </asp:GridView>
                </td>
            </tr>
        </table>
                     
                    
                    
        </div>
    
    
    
    
                 <div class="auto-style2">
                     <table align="center" class="auto-style3">
                         <tr>
                             <td class="auto-style4">
                                 <asp:Label ID="lbl_category" runat="server" ></asp:Label>
                             </td>
                             <td>
                                 <input type="color" id="color"  onchange="change()"/></td>
                             <td>
                                 <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Set color" />
                             </td>
                         </tr>
                         <tr>
                             <td colspan="3" class="auto-style1">
                                 <asp:HiddenField ID="theColor" runat="server"></asp:HiddenField> <%--<asp:Label ID="theColor" runat="server" ></asp:Label>--%>
                             </td>
                         </tr>
                     </table>
                 </div>
    
    
    
    
                 <p class="auto-style1">
    
            <asp:Button ID="Button2" runat="server" CssClass="btn" Height="35px" Text="Back" Width="60px" OnClick="Button1_Click1" />
                 </p>
    
    
    
    
    </form>
</body>
</html>
