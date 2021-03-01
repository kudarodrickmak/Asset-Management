<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/SecondMaster.Master" CodeBehind="Registration.aspx.cs" Inherits="AssetManagement.Registration" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="Register.css" rel="stylesheet" />
   
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id ="box">
    <asp:updatepanel id="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server">
                <div>
                    <table class="modal-content">
                        <tr>
                            <td class="modal-header" colspan="3"><strong style="color: #000000; font-weight: bold; font-size: x-large">Registration Form<br />
                              
                               
                        </tr>
                        <tr>
                            <td class="modal-header" colspan="3"><strong style="color: #FF0000; font-weight: normal; font-size: large">Required Field (*)
                               
                                </strong></td>
                        </tr>
                        <tr class="form-group">
                            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold">Username:</td>
                            <td>
                                <asp:TextBox ID="TextBoxUN" runat="server" CssClass="form-control col-sm-10" placeholder="Username"></asp:TextBox>
                            </td>
                            <td>
                               <%--<div> <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"  CssClass="alert-danger" ErrorMessage="Username is invalid. A-Z , 0-9 , Underscore &amp; hyphen allowed" ControlToValidate="TextBoxUN" ValidationGroup="AllValidationGroup" ></asp:RegularExpressionValidator></div>--%>
                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxUN" CssClass="alert-danger" ErrorMessage="Username is requried" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="form-group">
                            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold">First Name:</td>
                            <td>
                                <asp:TextBox ID="fname" runat="server" CssClass="form-control col-sm-10" placeholder="First Name"></asp:TextBox>
                            </td>
                            <td>
                               <%--<div> <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"  CssClass="alert-danger" ErrorMessage="Username is invalid. A-Z , 0-9 , Underscore &amp; hyphen allowed" ControlToValidate="TextBoxUN" ValidationExpression="^[a-z0-9_-]+$" ValidationGroup="AllValidationGroup" ></asp:RegularExpressionValidator></div>--%>
                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="fname" CssClass="alert-danger" ErrorMessage="First name is requried" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="form-group">
                            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold">Surname:</td>
                            <td>
                                <asp:TextBox ID="Surname" runat="server" CssClass="form-control col-sm-10" placeholder="Surname"></asp:TextBox>
                            </td>
                            <td>
                               <%--<div> <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"  CssClass="alert-danger" ErrorMessage="Username is invalid. A-Z , 0-9 , Underscore &amp; hyphen allowed" ControlToValidate="TextBoxUN" ValidationExpression="^[a-z0-9_-]+$" ValidationGroup="AllValidationGroup" ></asp:RegularExpressionValidator></div>--%>
                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Surname" CssClass="alert-danger" ErrorMessage="Surname is requried" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="form-group">
                            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold">E-mail:</td>
                            <td class="auto-style9">
                                <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control col-sm-10" placeholder="Email Address"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxEmail" CssClass="alert-danger" ErrorMessage="Email is requried" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEmail" CssClass="alert-danger" ErrorMessage="Enter a valid Email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="AllValidationGroup"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr class="form-group">
                            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold">Password:</td>
                            <td class="auto-style9">
                                <asp:TextBox ID="TextBoxPass" runat="server" CssClass="form-control col-sm-10" TextMode="Password" placeholder="New Password"></asp:TextBox>
                            </td>
                            <td class="auto-style7">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxPass" CssClass="alert-danger" ErrorMessage="Password is requried" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="form-group">
                            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold">Confirm Password:</td>
                            <td class="auto-style9">
                                <asp:TextBox ID="TextBoxRPass" runat="server" CssClass="form-control col-sm-10" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
                            </td>
                            <td class="auto-style7">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxRPass" CssClass="alert-danger" ErrorMessage="Confirm Password is required" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                                <br />
                                <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="alert-danger" ErrorMessage="Both password should be same" ControlToCompare="TextBoxPass" ControlToValidate="TextBoxRPass" ValidationGroup="AllValidationGroup"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr class="form-group">
                            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold">NMU No:</td>
                            <td>
                                <asp:TextBox ID="NMUNo" runat="server" CssClass="form-control col-sm-10" TextMode="SingleLine" placeholder="Student/Staff Number"></asp:TextBox>
                                &nbsp;</td>
                            <td class="auto-style7">

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="NMUNo" CssClass="alert-danger" ErrorMessage="Student/Staff Number is required" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="form-group">
                            <td class="auto-style3">
                            </td>
                            <td class="auto-style13" style="padding:7px">
                                <asp:Button ID="submit" runat="server" OnClick="submit_Click" Text="Submit" CssClass="btn btn-default"  OnClientClick="loadingIconVisible()" ForeColor="Blue"/>
                                <span style="margin-left:20px"><asp:Image ID="LoadingImage" runat="server" ImageUrl="~/icon/loadingIcon.gif" /></span>
                            </td>
                            <td style="color: #000066"><a href="Login.aspx" style="color: #000066">Already have a account?</a></td>
                        </tr>
                        <tr class="form-group">
                            <td class="auto-style4"></td>
                            <td class="auto-style12">
                                <asp:Label ID="InfoLabel" runat="server"></asp:Label>
                            </td>
                            <td class="auto-style5"></td>
                        </tr>
                    </table>

                </div>
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server" Visible="false">
                <div class="alert alert-success">
                    <asp:Label ID="ConfirmationLevel" runat="server" Text="<p style='text-align: center'>Registration Successfully Done...!!! <br /><a href='Login.aspx'>Login from here</a></p>" Visible="true" Font-Size="X-Large" Font-Bold="True"></asp:Label>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:updatepanel>
</div>

</asp:Content>
