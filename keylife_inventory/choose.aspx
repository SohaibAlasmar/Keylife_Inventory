<%@ Page Language="C#" AutoEventWireup="true" CodeFile="choose.aspx.cs" EnableEventValidation="false" Inherits="choose" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>الرئيسية</title>
     <meta charset="UTF-8"/>
    <style>
        * {
            width: 100%;
            margin-top: 0px;
        }

        html {
            background: url(images/back.jpg) no-repeat center center fixed;
            background-size: cover;
        }

        .auto-style1 {
            text-align: center;
        }

        .auto-style2 {
            width: 100px;
            margin-top: 20px;
        }

        .btn {
            width: 200px;
            height: 50px;
            margin: 10px;
            background-color: #002448;
            border: 2px solid white;
            transition: 0.5s;
            font-weight: bold;
            font-size: 20px;
            color: white;
        }

            .btn:hover {
                border-radius: 5%;
                color: #002448;
                background-color: white;
                border: 2px solid #002448;
            }

        #header {
            margin-top: 0px;
            padding: 0px;
            height: 140px;
            width: 100%;
            background-color: rgba(0,0,0,0.2);
            border-bottom: 3px solid #002448;
        }

        .auto-style3 {
            width: 100px;
        }

        #grid_quan {
            margin-top: 30px;
            background-color: rgba(0, 36, 72,0.5);
        
            text-align: center;
            color: black;
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
            font-size: 80%;
        }

        .GridPager a {
            background-color: #002448;
            color: #969696;
            border: 1px solid #dddddd;
            height: 20px;
            font-size: 80%;
        }

        .GridPager span {
            background-color: #ccdef4;
            color: #000;
            border: 1px solid #969696;
            height: 20px;
        }
        .GridPager th
{
    background-color: rgb(217, 231, 255);
    border: none;
    text-align: left;
    font-weight: bold;
    font-size: 15px;
    padding: 4px;
    color:white;
}
        .cssbut{
            font-weight:bold
        }
        hgroup{
            background-color:white
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="header" class="auto-style1">
            <br />
            <asp:ImageButton CssClass="img-responsive center-block" ID="ImageButton1" Style="outline: none" runat="server" Height="96px" ImageUrl="~/images/logo1.png" Width="493px" OnClick="ImageButton1_Click" />
        </div>
        <div class="auto-style1">
            <table align="center" class="auto-style2" dir="ltr">
                <tr>
                    <td>
                        <asp:Button ID="Button4" class="btn" runat="server" Text="Edit" OnClick="Button4_Click" />
                    </td>
                    <td>
                        <asp:Button ID="Button2" class="btn" runat="server" Text="Add matirial" OnClick="Button2_Click" />
                    </td>
                    <td>
                        <asp:Button ID="Button1" class="btn" runat="server" Text="Add user" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>
        </div>

        <p class="auto-style1">
            &nbsp;<asp:TextBox ID="TextBox1" Style="text-align: center" runat="server" Width="150px" placeholder="Search" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
        </p>
        <p class="auto-style1">

            <asp:DropDownList ID="drop1" runat="server" AutoPostBack="True" Height="24px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="152px">
                <asp:ListItem hidden Selected="True" Value="mat_id">sort by</asp:ListItem>
                <asp:ListItem Value="quantity">quantity</asp:ListItem>
                <asp:ListItem Value="date_time">date</asp:ListItem>
                <asp:ListItem Value="sireal_num">serial number</asp:ListItem>
                <asp:ListItem Value="brand">brand</asp:ListItem>
                <asp:ListItem Value="category">category</asp:ListItem>
                <asp:ListItem Value="unit">unit</asp:ListItem>
                <asp:ListItem>value</asp:ListItem>
                <asp:ListItem Value="sub_place">Sub address</asp:ListItem>
            </asp:DropDownList>
        </p>
        <p style="text-align: center">
            <asp:Button ID="Button3" Style="text-align: center; border: none; border-radius: 2px; height: 20px; color: white; cursor: pointer; outline: none" runat="server" Text="Under limit" Width="110px" OnClick="Button3_Click1" />
        </p>
        <p style="text-align: center">
            <asp:Label ID="lbl_error" runat="server" ForeColor="Red"></asp:Label>
        </p>
        <p style="text-align: center">
            <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Excel copy" Width="139px" />
        </p>
        <table align="center" class="auto-style3">
            <tr>
                <td class="auto-style1">
                    <asp:GridView RowStyle-BackColor=""  ID="grid_quan" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="grid_quan_SelectedIndexChanged" Width="606px" AllowPaging="True" OnPageIndexChanging="grid_quan_PageIndexChanging" PageSize="80" OnRowDeleting="grid_quan_RowDeleting" DataKeyNames="mat_id" OnRowEditing="grid_quan_RowEditing" OnRowCancelingEdit="grid_quan_RowCancelingEdit" OnRowUpdating="grid_quan_RowUpdating" OnRowCommand="grid_quan_RowCommand" OnRowDataBound="grid_quan_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="mat_id"  HeaderText="Id" ReadOnly="True" >
                            <ControlStyle ForeColor="White" />
                            <HeaderStyle ForeColor="white" BackColor="#002448" />
                            </asp:BoundField>
                            <asp:BoundField DataField="name" HeaderText="User name" ReadOnly="True" >
                            <HeaderStyle ForeColor="white" BackColor="#002448" />
                            </asp:BoundField>
                            <asp:BoundField DataField="place" HeaderText="Main address" ReadOnly="True" >
                            <HeaderStyle ForeColor="white" BackColor="#002448" />
                            </asp:BoundField>
                            <asp:BoundField DataField="sub_place" HeaderText="Sub adress" ReadOnly="True" >
                            <HeaderStyle ForeColor="white" BackColor="#002448" />
                            </asp:BoundField>
                            <asp:BoundField DataField="brand" HeaderText="Brand" ReadOnly="True" >
                            <HeaderStyle ForeColor="white" BackColor="#002448" />
                            </asp:BoundField>
                            <asp:BoundField DataField="category" HeaderText="Category" ReadOnly="True" >
                            <HeaderStyle ForeColor="white" BackColor="#002448" />
                            </asp:BoundField>
                            <asp:BoundField DataField="sireal_num" HeaderText="Serial number" ReadOnly="True" >
                            <HeaderStyle ForeColor="white" BackColor="#002448" />
                            </asp:BoundField>
                            <asp:BoundField DataField="value" HeaderText="Value" ReadOnly="True" >
                            <HeaderStyle ForeColor="white" BackColor="#002448" />
                            </asp:BoundField>
                            <asp:BoundField DataField="unit" HeaderText="Unit" ReadOnly="True" >
                            <HeaderStyle ForeColor="white" BackColor="#002448" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" >
                            <HeaderStyle ForeColor="white" BackColor="#002448" />
                            </asp:BoundField>
                            <asp:BoundField DataField="title_en" HeaderText="Describtion" ReadOnly="True" >
                            <HeaderStyle  ForeColor="white" BackColor="#002448" />
                            </asp:BoundField>
                            <asp:BoundField DataField="title_ar" ReadOnly="True" >
                            <HeaderStyle ForeColor="white" BackColor="#002448" />
                            </asp:BoundField>
                            <asp:ButtonField CommandName="gtds" Text="Datasheet" ControlStyle-CssClass="cssbut">
                            <ControlStyle  Font-Bold="False" Font-Underline="False" />
                            <HeaderStyle ForeColor="white" BackColor="#002448" />
                            </asp:ButtonField>
                            <asp:CommandField ButtonType="Button" ShowEditButton="True" >
                            <ControlStyle  BackColor="#3366FF" />
                            <HeaderStyle ForeColor="white" BackColor="#002448" />
                            </asp:CommandField>
                        </Columns>
                        <PagerStyle Wrap="False" CssClass="GridPager" VerticalAlign="Middle" />
                    </asp:GridView>
                </td>
            </tr>
        </table>

        <p class="auto-style1">
            <asp:GridView ID="grid_print" runat="server" AutoGenerateColumns="False" Visible="False" Width="552px">
                <Columns>
                    <asp:BoundField DataField="mat_id" HeaderText="id" />
                    <asp:BoundField DataField="place" HeaderText="place" />
                    <asp:BoundField DataField="sub_place" HeaderText="sub place" />
                    <asp:BoundField DataField="Quantity" HeaderText="quan" />
                    <asp:BoundField DataField="date_time" HeaderText="date time" />
                    <asp:BoundField DataField="sireal_num" HeaderText="sireal number" />
                    <asp:BoundField DataField="brand" HeaderText="brand" />
                    <asp:BoundField DataField="title_en" HeaderText="title en" />
                    <asp:BoundField DataField="category" HeaderText="category" />
                    <asp:BoundField DataField="title_ar" HeaderText="title_ar" />
                    <asp:BoundField DataField="unit" HeaderText="unit" />
                    <asp:BoundField DataField="datasheet" HeaderText="datasheet" />
                    <asp:BoundField DataField="value" HeaderText="value" />
                    <asp:BoundField DataField="least_vlu" HeaderText="least_vlu" />
                </Columns>
            </asp:GridView>
        </p>

    </form>
</body>
</html>
