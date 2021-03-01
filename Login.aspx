<%@ Page Title="" Language="C#" MasterPageFile="~/SecondMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AssetManagement.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Register.css" rel="stylesheet" />
   
    <style type="text/css">
        .auto-style2 {
            width: 400px;
        }
    </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">--%>
          <%--  <ContentTemplate>--%>
                <%--<form >--%>
                    <table class="modal-content">
                        <tr>
                            <td class="modal-header" colspan="5"><strong style="font-size: x-large; font-weight: bold">Login</strong></td>
                        </tr>
                        <tr class="form-group">
                            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 400px;">User name:</td>
                            <td>
                                <asp:TextBox ID="TextBoxUN" runat="server" CssClass="form-control col-sm-10" placeholder="Username" ></asp:TextBox>
                            </td>
                            <td style="padding-left: 7px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxUN" ErrorMessage="Username is requried" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="form-group">
                            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 400px;">Password:</td>
                            <td>
                                <asp:TextBox ID="TextBoxPass" runat="server" TextMode="Password" CssClass="form-control col-sm-10" placeholder="Password"></asp:TextBox>
                            </td>
                            <td style="padding-left: 7px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPass" ErrorMessage="Password is requried" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            </td>
                        </tr>

                        <tr class="form-group">
                            <td style="  padding-left: 10px" class="auto-style2"><a href="Registration.aspx" style="color: #000000">Create a new account</a></td>
                            <td style="padding: 10px">
                                <asp:Button ID="ButtonLogin" runat="server" Text="Login" OnClientClick="loadingIconVisible();" OnClick="ButtonLogin_Click" CssClass="btn btn-default" ForeColor="Blue" />
                                
                            </td>
                            <td class="control-label col-sm-2">
                                <asp:CheckBox ID="RememberMeCheckBox" runat="server" Text="Remember Me" CssClass="checkbox" Font-Size="Medium" /></td>
                        </tr>
                        <tr class="form-group">
                            <td class="auto-style2">
                            </td>
                            <td class="auto-style11">
                                <asp:Label ID="InfoLabel" runat="server"></asp:Label>
                            </td>
                            <td class="auto-style12"></td>
                        </tr>
                    </table>

    <div>
        <div>

        </div>
    </div>
                

</asp:Content>
