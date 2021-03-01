<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Request.aspx.cs" Inherits="AssetManagement.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>&nbsp;Lab Request Form</h2>
    <h3 class="text-justify">Please Complete the Form Below to Send your Request.</h3>
    <p style="font-size: large">&nbsp;<strong>Required field (*)</strong></p>
    <p style="color: #FF0000; font-size: large;">Note: Ensure to check availability of the required lab before requesting.</p>
    

    <table class="modal-content" style="width: 1400px; height: 668px;">
                   

                    <tr class="form-group">
                       <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 492px;">
                            Module:
                        </td> 
                        <td >
                            <asp:DropDownList ID="drop1" runat="server" RepeatDirection="Horizontal" Height="31px" Width="220px" DataSourceID="SqlDataSource1" DataTextField="Mod_Code" DataValueField="Mod_Code" CssClass="form-control col-sm-10" placeholder="--Select Module--">
                            </asp:DropDownList>                                
                            *<asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:AMT_DBConnectionString %>' SelectCommand="SELECT [Mod_Code] FROM [Modules]"></asp:SqlDataSource>
                        </td>
                        <td style="padding-left: 7px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="drop1" ErrorMessage="Module is required" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            </td>
                       </tr>

                        <tr class="form-group">
                          <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 492px; left: 1px; top: 74px;">
                            Start Date:
                                                           
                             </td>
                        <td>
                             <asp:TextBox ID="startddate" runat="server" TextMode="Date"  CssClass="form-control col-sm-10" placeholder="Start Date"></asp:TextBox>
                             *</td>
                            <td style="padding-left: 7px">
                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="startddate" ErrorMessage="Enter Valid Start Date" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            <br />
                                 <asp:CustomValidator runat="server" ID="CustDateValidator" OnServerValidate="CustDateValidator_ServerValidate" CssClass="alert-danger" ControlToValidate="startddate"
                    ErrorMessage="Enter valid date" /> 
                            </td>
                                                 
                    </tr>

                      <tr class="form-group">
                        <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 492px;">
                            End Date:
                        </td>
                          <td>
                            <asp:TextBox ID="Enddate" runat="server" TextMode="Date" CssClass="form-control col-sm-10" placeholder="End Date"></asp:TextBox>

                              *</td>
                        <td style="padding-left: 7px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Enddate" ErrorMessage="Enter Valid End Date " CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                           <br />
                             <asp:CustomValidator runat="server" ID="CustomValidator1" OnServerValidate="CustDateValidator_ServerValidate" CssClass="alert-danger" ControlToValidate="Enddate"
                    ErrorMessage="Enter valid date in the future" /> 
                            </td>
                          
                    </tr>

       <tr class="form-group">
                        <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 492px;">
                            Time:
                        </td>
                          <td>
                                                     
                              <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control col-sm-10" placeholder="Select Start Time">
                                 <asp:ListItem Value="-1">--Select_Start_Time--</asp:ListItem>
                                  <asp:ListItem Value="07:45 AM">7:45 AM</asp:ListItem>
                                  <asp:ListItem Value="08:15 AM">8:15 AM</asp:ListItem>
                                  <asp:ListItem Value="08:45 AM">8:45 AM</asp:ListItem>
                                  <asp:ListItem Value="08:55 AM">8:55 AM</asp:ListItem>
                                  <asp:ListItem Value="09:25 AM">9:25 AM</asp:ListItem>
                                  <asp:ListItem Value="09:55 AM">9:55 AM</asp:ListItem>
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
                              <asp:DropDownList ID="DropDownList4" runat="server" CssClass="form-control col-sm-10" placeholder="Select End Time">
                                  <asp:ListItem Value="-1">--Select End Time--</asp:ListItem>
                                  <asp:ListItem Value="08:15 AM">8:15 AM</asp:ListItem>
                                  <asp:ListItem Value="08:45 AM">8:45 AM</asp:ListItem>
                                  <asp:ListItem Value="08:55 AM">8:55 AM</asp:ListItem>
                                  <asp:ListItem Value="09:25 AM">9:25 AM</asp:ListItem>
                                  <asp:ListItem Value="09:55 AM">9:55 AM</asp:ListItem>
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

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" InitialValue="-1" ControlToValidate="DropDownList4" ErrorMessage="Select End Time" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>    
                        </td>

       </tr>
                          
                   

                       <tr class="form-group">
                        <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 492px;">
                            Lab No:
                           </td>
                         <td>
                             <%--<asp:RequiredFieldValidator ID="RequiredFieldValidatorDeath" runat="server" ErrorMessage="Please Select Mortality" InitialValue="-1"  ForeColor ="Red" ControlToValidate="drop2"></asp:RequiredFieldValidator>--%>
                             &nbsp;<asp:DropDownList ID="Labss" runat="server" CssClass="form-control col-sm-10" placeholder="Select Lab">
                                   <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                 <asp:ListItem>1</asp:ListItem>
                                  <asp:ListItem>2</asp:ListItem>
                                  <asp:ListItem>3</asp:ListItem>
                                  <asp:ListItem>4</asp:ListItem>
                                  <asp:ListItem>5</asp:ListItem>
                                 <asp:ListItem>6</asp:ListItem>
                                  <asp:ListItem>Amazon</asp:ListItem>
                                <asp:ListItem>Seminar Room</asp:ListItem>
                    </asp:DropDownList>

                         *</td>
                           <td style="padding-left: 7px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" InitialValue="-1" ControlToValidate="Labss" ErrorMessage="Select Lab" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            </td>

                       </tr>
                                       
        <tr class="form-group">
                        <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 492px;">
                            Request Type:
                           </td>
                         <td>
                             <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="true" CssClass="form-control col-sm-10" placeholder="Select Request Type">
                        <asp:ListItem Value="-1">--Select--</asp:ListItem>
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
                Confirmation Email Address:
                    </td>

                         <td>
           
                <asp:TextBox ID="bEmail" runat="server" Width="219px" Height="31px" CssClass="form-control col-sm-10" placeholder="e.g. example@gmail.com"></asp:TextBox>
            *</td>
            <td style="padding-left: 7px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="bEmail" ErrorMessage="Confirmation Email is required" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
            <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="bEmail" CssClass="alert-danger" ErrorMessage="Enter a valid Email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="AllValidationGroup"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr class="form-group">
                             <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 492px;"></td>
                             
                              <td style="width: 646px; height: 76px;" class="text-justify">
                             <asp:Button ID="Button1" runat="server" CssClass="btn btn-default" OnClick="Button1_Click" Text="Check Availability" Font-Bold="True" ForeColor="#3366FF" Height="36px" />
                             
                                  <br />
                                  <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#009900" Height="30px" Text="The Available Labs are:" Visible="False"></asp:Label>
                             
                                  <br />
                             
                             <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" Height="30px"></asp:Label>
                             </td>
                           
                           
                    </tr>

        <tr class="form-group">
                        <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 492px;">
                            Additional Information:
                        </td>
                         <td>
                             <asp:TextBox ID="Info" runat="server" TextMode="MultiLine" CssClass="form-control col-sm-10" placeholder="e.g. Urgent staff meeting"></asp:TextBox>
                             </td>
                             <td ></td>
                    </tr>

         <tr class="form-group">
                         <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 492px;">

                         </td>
                   <td colspan="2" style="height: 24px; width: 200px;">
                        
                       
                       <asp:Button ID="btnClear" runat="server" CssClass="btn btn-default" Text="Cancel" OnClick="btnClear_Click" BackColor="White" ForeColor="Blue" Height="35px" Width="76px" />
                       
                       &nbsp;&nbsp;
                       
                       <asp:Button ID="btnSend" runat="server" CssClass="btn btn-default" Text="OK" OnClick="btnSend_Click" BackColor="White" ForeColor="Blue" Height="33px" Width="76px" />

                    </td>

                    </tr>

         <tr class="form-group">
            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 492px;">
                <strong>
                <asp:Label ID="lblStatus" runat="server" style="font-size: large"></asp:Label></strong></td>
        </tr>


                </table>
            
                        
            <br />
</asp:Content>
