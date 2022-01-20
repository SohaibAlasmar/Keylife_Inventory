<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add_material.aspx.cs" Inherits="add_materials" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>اضافة مادة</title>
    <style>
        body {
            margin-top: 0px;
            width: 100%;
        }

        html {
            background: url(images/back.jpg) no-repeat center center fixed;
            background-size: cover;
        }

        .center {
            position: center center;
            align-content: center;
        }

        table {
            border-radius: 5%;
            width: 300px;
            margin-top: 90px;
            background-color: rgba(48, 122, 121,0.5);
            border: solid 2px white;
        }

            table td {
                height: 30px;
            }

        .auto-style2 {
            text-align: center;
        }

        .btn {
            color: white;
            width: 50px;
            height: 30px;
            margin: 10px;
            background-color: #307a79;
            border: 2px solid white;
            transition: 0.5s;
            font-weight: bold;
            font-size: 15px;
            border-radius: 10%;
        }

            .btn:hover {
                color: #307a79;
                background-color: white;
                border: 2px solid #307a79;
            }

        hr {
            border: 1px solid white;
        }

        #header {
            margin-top: 0px;
            padding: 0px;
            height: 140px;
            width: 100%;
            background-color: rgba(48, 122, 121,0.15);
            border-bottom: 3px solid white;
        }

        .auto-style3 {
            height: 30px;
            width: 99px;
            text-align: left;
        }

        .auto-style4 {
            width: 206px;
            text-align: left;
        }

        .auto-style5 {
            height: 30px;
            width: 206px;
            text-align: left;
        }

        .auto-style6 {
            width: 99px;
            font-weight: bold;
            text-align: left;
        }

        .auto-style7 {
            text-align: center;
            font-weight: bold;
        }

        .auto-style8 {
            height: 30px;
            width: 99px;
            font-weight: bold;
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="header" class="auto-style2">
            <br />
            <asp:ImageButton CssClass="img-responsive center-block" ID="ImageButton1" Style="outline: none" runat="server" Height="96px" ImageUrl="~/images/logo2.png" Width="493px" OnClick="ImageButton1_Click" />
        </div>
        <div class="center">

            <table align="center" dir="rtl">
                <tr>
                    <td class="auto-style4">
                        <asp:TextBox ID="txt_place" runat="server" Style="text-align: center"></asp:TextBox>
                    </td>
                    <td class="auto-style6">P<strong>lace</strong></td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:TextBox ID="txt_subplace" runat="server" style="text-align: center"></asp:TextBox>
                    </td>
                    <td class="auto-style8">S<strong>ub place</strong></td>
                </tr>
                <tr>

                    <td class="auto-style4">
                        <asp:TextBox ID="txt_describe_ar" runat="server" Style="text-align: center"></asp:TextBox>
                    </td>
                    <td class="auto-style6">D<strong>escribe ar</strong></td>

                </tr>
                <tr>

                    <td class="auto-style4">
                        <asp:TextBox ID="txt_describe_en" runat="server" Style="text-align: center"></asp:TextBox>
                    </td>
                    <td class="auto-style6"><strong>Describe en</strong></td>

                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:TextBox ID="txt_catagory" runat="server" Style="text-align: center"></asp:TextBox>
                    </td>
                    <td class="auto-style6">C<strong>atagory</strong></td>
                </tr>
                <tr>

                    <td class="auto-style4">
                        <asp:TextBox ID="txt_serial" runat="server" Style="text-align: center"></asp:TextBox>
                    </td>
                    <td class="auto-style6"><strong style="direction: ltr">Serial num</strong></td>

                </tr>
                <tr>

                    <td class="auto-style4">
                        <asp:TextBox ID="txt_brand" runat="server" Style="text-align: center"></asp:TextBox>
                    </td>
                    <td class="auto-style6">Brand</td>

                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:TextBox ID="txt_value" runat="server" Style="text-align: center"></asp:TextBox>
                    </td>
                    <td class="auto-style6">V<strong>alue</strong></td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:TextBox ID="txt_unit" runat="server" Style="text-align: center"></asp:TextBox>
                    </td>
                    <td class="auto-style8"><strong>Unit</strong></td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:TextBox ID="txt_quan" runat="server" TextMode="Number" Style="text-align: center"></asp:TextBox>
                    </td>
                    <td class="auto-style6">Q<strong>uantity</strong></td>
                </tr>

                <tr>
                    <td class="auto-style5">
                        <asp:TextBox ID="txt_data_sh" runat="server" Style="text-align: center"></asp:TextBox>
                    </td>
                    <td class="auto-style8">D<strong>ata sheet</strong></td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:TextBox ID="txt_lst_vlu" runat="server" TextMode="Number" Style="text-align: center"></asp:TextBox>
                    </td>
                    <td class="auto-style3"><strong>Minimum value</strong></td>
                </tr>

                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="lbl_message" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style6">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7" colspan="2">
                        <hr class="hr" />
                        <b>&nbsp;&nbsp;<strong><asp:Button ID="Button2" runat="server" CssClass="btn" Height="31px" Text="Add" Width="62px" OnClick="Button2_Click" />
                        </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b>
                        <strong>
                            <asp:Button ID="Button1" runat="server" CssClass="btn" Height="31px" Text="Back" Width="62px" OnClick="Button1_Click" />
                        </strong></td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
