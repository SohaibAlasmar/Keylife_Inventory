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
        }
        .btn{
            color:white;
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
            #header{
      margin-top:0px;
      padding:0px;
      height:140px;
      width:100%;
      background-color:rgba(48, 122, 121,0.15);
      border-bottom:3px solid white;
    }
        .auto-style6 {
            height: 23px;
        }
        .auto-style7 {
            height: 23px;
            font-weight: bold;
            text-align: left;
        }
        .auto-style8 {
            font-weight: bold;
            text-align: left;
        }
        .auto-style9 {
            text-align: center;
            height: 29px;
        }
        .auto-style10 {
            font-weight: bold;
            text-align: left;
            height: 29px;
        }
        .auto-style11 {
            text-align: center;
            height: 23px;
        }
        #TextArea1 {
            text-align: center;
        }
        #TextArea2 {
            text-align: left;
        }
        #TextArea3 {
            text-align: left;
        }
        #txt_describe_ar {
            text-align: center;
        }
        #txt_describ_en {
            text-align: center;
        }
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
                <td class="auto-style1">
                    <asp:Label style="background-color:white;text-align:center" Width="150px" ID="lbl_manu" runat="server"></asp:Label>
                </td>
                <td class="auto-style8">Id</td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:Label style="background-color:white;text-align:center" Width="150px" ID="lbl_manu0" runat="server"></asp:Label>
                </td>
                <td class="auto-style7">Data entry</td>
            </tr>
            <tr>
                <td class="auto-style9">
                    <asp:TextBox ID="txt_place" runat="server" Width="150px" style="text-align: center"></asp:TextBox>
                </td>
                <td class="auto-style10">Place</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:TextBox ID="txt_subplace" runat="server" Width="150px" style="text-align: center"></asp:TextBox>
                </td>
                <td class="auto-style8">Sub place</td>
            </tr>
            
           
            <tr>
                <td class="auto-style1">
                    <textarea id="txt_describe_ar" cols="20" name="S2" rows="2" placeholder="Arabic" runat="server"></textarea></td>
                <td class="auto-style8" rowspan="2">Description</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <textarea id="txt_describ_en" cols="20" name="S3" placeholder="English" rows="2" runat="server"></textarea></td>
            </tr>
             <tr>
                <td class="auto-style1">
                    <asp:TextBox ID="txt_catagory" runat="server" Width="150px" style="text-align: center"></asp:TextBox>
                </td>
                <td class="auto-style8">Category</td>
            </tr>
             <tr>
                <td class="auto-style1">
                    <asp:TextBox ID="txt_serial_num" runat="server" Width="150px" style="text-align: center"></asp:TextBox>
                </td>
                <td class="auto-style8">Serial number</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:TextBox ID="txt_brand" runat="server" Width="150px" style="text-align: center"></asp:TextBox>
                </td>
                <td class="auto-style8">Brand</td>
            </tr>
             <tr>
                <td>
                    <asp:TextBox ID="txt_value" runat="server" Width="150px" style="text-align: center"></asp:TextBox>
                </td>
                <td class="auto-style8">Value</td>
            </tr>
           
            <tr>
                <td class="auto-style1">
                    <asp:TextBox ID="txt_unit" runat="server" Width="150px" style="text-align: center"></asp:TextBox>
                </td>
                <td class="auto-style8">Unit</td>
            </tr>
             <tr>
                <td class="auto-style1">
                    <asp:TextBox ID="txt_quan" runat="server" Width="150px" style="text-align: center" TextMode="Number"></asp:TextBox>
                </td>
                <td class="auto-style8">Quantity</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <textarea id="TextArea1" cols="20" name="S1" rows="2" runat="server"></textarea></td>

                <td class="auto-style8">Datasheet</td>
            </tr>
           
           
            <tr>
                <td class="auto-style6">
                    <asp:TextBox ID="txt_least_vlu" runat="server" Width="150px" style="text-align: center" TextMode="Number"></asp:TextBox>
                </td>
                <td id="least0" class="auto-style7">minmum value</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lbl_message" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <hr />
                    &nbsp;<strong><asp:Button ID="Button2" runat="server" CssClass="btn" Text="Update" OnClick="Button2_Click" Height="37px" Width="63px" />
                    </strong>&nbsp;&nbsp;&nbsp;&nbsp;
                    <strong>
                    <asp:Button ID="Button1" runat="server" CssClass="btn" Text="Back"   Height="37px" OnClick="Button1_Click" />
                    </strong></td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
