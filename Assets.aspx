<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Assets.aspx.cs" Inherits="AssetManagement.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Computing Sciences Devices Request Form</h2>

    <h2>&nbsp;</h2>

    <h4></h4>
    <h3>Please Complete the Form to Request For a Device.</h3>
    <p>
        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Complete all Required Fields" style="font-size: large"></asp:Label>
        <span style="font-size: large">&nbsp;(*)</span></p>
    <h6></h6>
    <table class="modal-content" style="width: 1100px; height: 668px;">
                   

                    <tr class="form-group">
                       <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 492px;">
                           Module:
                              
                        </td> 
                        <td>
                            <asp:DropDownList ID="drop1" runat="server" AutoPostBack="true" CssClass="form-control col-sm-10" placeholder="--Select Module--" RepeatDirection="Horizontal" DataSourceID="SqlDataSource1" DataTextField="Mod_Code" DataValueField="Mod_Code">
                                <asp:ListItem value ="-1">--Select--</asp:ListItem>
                            </asp:DropDownList>
                            *<asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:AMT_DBConnectionString %>' SelectCommand="SELECT [Mod_Code] FROM [Modules]"></asp:SqlDataSource>
                        </td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="-1" ControlToValidate="drop1" ErrorMessage="Select Module" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                       </tr>
        <tr class="form-group">
                        <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 492px;">
                            Request Type:
                           </td>
                         <td>
                             <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control col-sm-10" placeholder="-Request Type-">
                        <asp:ListItem value="-1">--Select--</asp:ListItem>
                        <asp:ListItem >Lecture</asp:ListItem>
                        <asp:ListItem>Tutorial</asp:ListItem>
                        <asp:ListItem >Practical</asp:ListItem>
                        <asp:ListItem >Meeting</asp:ListItem>
                        <asp:ListItem>Test</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                             </asp:DropDownList> 
                             <%--<asp:RequiredFieldValidator ID="RequiredFieldValidatorDeath" runat="server" ErrorMessage="Please Select Mortality" InitialValue="-1"  ForeColor ="Red" ControlToValidate="drop2"></asp:RequiredFieldValidator>--%>
                             *</td>
             <td style="padding-left: 7px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" InitialValue="-1" ControlToValidate="DropDownList2" ErrorMessage="Request Type Required" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            </td> 
                          
                    </tr>
                        <tr class="form-group">
                          <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 492px;">
                            
                             Start Date:
                            
                             </td>
                        <td>
                             <asp:TextBox ID="startddate" runat="server"  TextMode="Date" CssClass="form-control col-sm-10" placeholder="Start Date"></asp:TextBox>
                             *</td>
                         <td style="padding-left: 7px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  ControlToValidate="startddate" ErrorMessage="Select Valid Date" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            <br />
                             <asp:CustomValidator runat="server" ID="CustDateValidator" OnServerValidate="CustDateValidator_ServerValidate" CssClass="alert-danger" ControlToValidate="startddate"
                    ErrorMessage="Date selected is in the past. Please enter valid date" />
                         </td> 
                        
                    </tr>

                      <tr class="form-group">
                        <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 492px;">
                            Return Date:                             
                        </td>
                          <td>
                            <asp:TextBox ID="Enddate" runat="server" TextMode="Date" CssClass="form-control col-sm-10" placeholder="Return Date"></asp:TextBox>

                              *</td>
                         <td style="padding-left: 7px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  ControlToValidate="Enddate" ErrorMessage="Select Valid Date" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            <br />
                             <asp:CustomValidator runat="server" ID="CustomValidator1" OnServerValidate="CustDateValidator_ServerValidate" CssClass="alert-danger" ControlToValidate="Enddate"
                    ErrorMessage="Enter valid date" />
                         </td> 
                          
                    </tr>

       <tr class="form-group">
                        <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 492px;">
                            Time:
                        </td>
                          <td>
                                  <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control col-sm-10" placeholder="Start Time">
                                  <asp:ListItem Value="-1">--Select Start Time--</asp:ListItem>
                                  <asp:ListItem>7:45 AM</asp:ListItem>
                                  <asp:ListItem>8:15 AM</asp:ListItem>
                                  <asp:ListItem>8:45 AM</asp:ListItem>
                                  <asp:ListItem>8:55 AM</asp:ListItem>
                                  <asp:ListItem>9:25 AM</asp:ListItem>
                                  <asp:ListItem>9:55 AM</asp:ListItem>
                                  <asp:ListItem>10:05 AM</asp:ListItem>
                                  <asp:ListItem>10:35 AM</asp:ListItem>
                                  <asp:ListItem>11:05 AM</asp:ListItem>
                                  <asp:ListItem>11:15 AM</asp:ListItem>
                                  <asp:ListItem>11:45 AM</asp:ListItem>
                                  <asp:ListItem>12:15 PM</asp:ListItem>
                                  <asp:ListItem>1:15 PM</asp:ListItem>
                                  <asp:ListItem>1:45 PM</asp:ListItem>
                                  <asp:ListItem>2:15 PM</asp:ListItem>
                                  <asp:ListItem>2:25 PM</asp:ListItem>
                                  <asp:ListItem>2:55 PM</asp:ListItem>
                                  <asp:ListItem>3:25 PM</asp:ListItem>
                                  <asp:ListItem>3:35 PM</asp:ListItem>
                                  <asp:ListItem>4:05 PM</asp:ListItem>
                                  <asp:ListItem>4:35 PM</asp:ListItem>
                                  <asp:ListItem>4:45 PM</asp:ListItem>
                                  <asp:ListItem>5:15 PM</asp:ListItem>
                                  <asp:ListItem>5:45 PM</asp:ListItem>

                              </asp:DropDownList>
                              <asp:DropDownList ID="DropDownList4" runat="server" CssClass="form-control col-sm-10" placeholder="End Time">
                                  <asp:ListItem Value="-1">--Select End Time--</asp:ListItem>
                                  <asp:ListItem>8:15 AM</asp:ListItem>
                                  <asp:ListItem>8:45 AM</asp:ListItem>
                                  <asp:ListItem>8:55 AM</asp:ListItem>
                                  <asp:ListItem>9:25 AM</asp:ListItem>
                                  <asp:ListItem>9:55 AM</asp:ListItem>
                                  <asp:ListItem>10:05 AM</asp:ListItem>
                                  <asp:ListItem>10:35 AM</asp:ListItem>
                                  <asp:ListItem>11:05 AM</asp:ListItem>
                                  <asp:ListItem>11:15 AM</asp:ListItem>
                                  <asp:ListItem>11:45 AM</asp:ListItem>
                                  <asp:ListItem>12:15 PM</asp:ListItem>
                                  <asp:ListItem>1:15 PM</asp:ListItem>
                                  <asp:ListItem>1:45 PM</asp:ListItem>
                                  <asp:ListItem>2:15 PM</asp:ListItem>
                                  <asp:ListItem>2:25 PM</asp:ListItem>
                                  <asp:ListItem>2:55 PM</asp:ListItem>
                                  <asp:ListItem>3:25 PM</asp:ListItem>
                                  <asp:ListItem>3:35 PM</asp:ListItem>
                                  <asp:ListItem>4:05 PM</asp:ListItem>
                                  <asp:ListItem>4:35 PM</asp:ListItem>
                                  <asp:ListItem>4:45 PM</asp:ListItem>
                                  <asp:ListItem>5:15 PM</asp:ListItem>
                                  <asp:ListItem>5:45 PM</asp:ListItem>

                              </asp:DropDownList>
                              *</td>
                         <td style="padding-left: 7px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" InitialValue="-1" ControlToValidate="DropDownList3" ErrorMessage="Select Start Time" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            <br />
                              
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" InitialValue="-1" ControlToValidate="DropDownList4" ErrorMessage="Select End Time" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                          </td> 
                         
                    </tr>

 <tr class="form-group">
                        <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 492px;">
                            Devices:
                           </td>
                         <td>
                             <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control col-sm-10" placeholder="Device">
                        <asp:ListItem value ="-1">--Select--</asp:ListItem>
                        <asp:ListItem >Phone</asp:ListItem>
                        <asp:ListItem>Tablet</asp:ListItem>
                        <asp:ListItem >Camera</asp:ListItem>
                        <asp:ListItem >Laptop</asp:ListItem>
                        <asp:ListItem >Other</asp:ListItem>

                                            </asp:DropDownList> 
                             
                             *</td>
      <td style="padding-left: 7px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" InitialValue="-1" ControlToValidate="DropDownList1" ErrorMessage="Select Required Device" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            </td> 
                           
                    </tr>
         <tr class="form-group">
            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 492px;">
                          Confirmation Email Address:   </td>

                         <td style="width: 417px; height: 108px;" class="text-justify">
           
                <asp:TextBox ID="bEmail" runat="server" CssClass="form-control col-sm-10" placeholder="e.g. example@gmail.com"></asp:TextBox>
            *</td>
              <td style="padding-left: 7px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="bEmail" ErrorMessage="Enter Valid Email Address" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="bEmail" CssClass="alert-danger" ErrorMessage="Enter a valid Email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="AllValidationGroup"></asp:RegularExpressionValidator>
              
              </td> 
        </tr>
        <tr class="form-group">
                         <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 492px;">

                         </td>
                   <td colspan="2" style="height: 24px; width: 200px;">
                        
                       
                       <asp:Button ID="btnClear" runat="server" CssClass="btn btn-default" Text="Cancel" OnClick="btnClear_Click" BackColor="White" ForeColor="Blue" Height="36px" Width="77px" />
                       
                       &nbsp;
                       
                       <asp:Button ID="btnSend" runat="server" CssClass="btn btn-default" Text="OK" OnClick="btnSend_Click" BackColor="White" ForeColor="Blue" Height="35px" Width="76px" />

                    </td>

                    </tr>

         <tr class="form-group">
            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 492px;">
                <strong>
                <asp:Label ID="lblStatus" runat="server" style="font-size: x-large"></asp:Label></strong></td>
        </tr>

        </table>
   
</asp:Content>
