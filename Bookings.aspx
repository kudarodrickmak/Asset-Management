<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Bookings.aspx.cs" Inherits="AssetManagement.Bookings" %>

<asp:content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:HiddenField ID="HiddenField1" runat="server" />
    <br />
    <br />

    
<h2 class="text-left">Confirm Lab Booking Requests.</h2>
    <p class="text-left">
        <asp:Button ID="Button4" runat="server" CssClass="btn btn-default" Text="View Lab Requests" OnClick="Button4_Click" ForeColor="#0066FF" /> 
        
    &nbsp;</p>
       <%--<p id="show">--%>
           &nbsp;<h5 style="font-size: large"> 
               <asp:Label ID="Label3" runat="server" Text="Please select a request from the list below to make a lab booking. " Visible="False"></asp:Label>
    </h5>

      <%-- </p>--%>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1351px" Height="240px" >
        <AlternatingRowStyle BackColor="White" />

        <Columns>
            <asp:CommandField ShowSelectButton="True" Visible="True" SelectText="View"></asp:CommandField>
            <asp:BoundField DataField="Request_ID" HeaderText="Request_ID" ReadOnly="True" InsertVisible="False" SortExpression="Request_ID"></asp:BoundField>

            <asp:BoundField DataField="Mod_Code" HeaderText="Mod_Code" SortExpression="Mod_Code"></asp:BoundField>

            <asp:BoundField DataField="Request_Type" HeaderText="Type" SortExpression="Request_Type"></asp:BoundField>
            <asp:BoundField DataField="Start_Date" HeaderText="Date" SortExpression="Start_Date"></asp:BoundField>
            <asp:BoundField DataField="Start_Time" HeaderText="Start-Time" SortExpression="Start_Time"></asp:BoundField>
            <asp:BoundField DataField="End_Time" HeaderText="End-Time" SortExpression="End_Time"></asp:BoundField>
            <asp:BoundField DataField="Lab_Num" HeaderText="Lab No" SortExpression="Lab_Num"></asp:BoundField>
            <asp:BoundField DataField="Confirmed" HeaderText="Status" SortExpression="Confirmed"></asp:BoundField>
           <asp:BoundField DataField="AdditionalInfo" HeaderText="Additional Info" SortExpression="AdditionalInfo"></asp:BoundField>
            <asp:BoundField DataField="BookingEmail" HeaderText="Booking Email" SortExpression="BookingEmail"></asp:BoundField>
            
            <asp:TemplateField>
                         <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lnkView" CommandArgument='<%#Eval("Request_ID") %>' OnClick="lnk_OnClick" Enabled="True">Proceed to book</asp:LinkButton> 
                         </ItemTemplate>

                     </asp:TemplateField> 
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />

    </asp:GridView>


   
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:AMT_DBConnectionString %>' SelectCommand="SELECT [Request_ID], [Mod_Code], [Request_Type], [Start_Date], [Start_Time], [End_Time], [Lab_Num], [BookingEmail], [AdditionalInfo] FROM [Request]"></asp:SqlDataSource>
    <div>

        <h5 style="font-size: large">For external clients, please enter the requierd details in the form below.</h5>
        <p style="color: #FF0000; font-size: large;">Note: Please check availability before confirming a request.</p>
        <p style="color: #FF0000; font-size: large;">&nbsp;</p>
        
    <table class="modal-content" style="width: 1000px; height: 668px;">
         
        <tr class="form-group">
            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 232px;">
                Request_ID:
            </td>
            <td>
                <asp:TextBox ID="ReqID" runat="server" CssClass="form-control col-sm-10" placeholder="RequestID"></asp:TextBox>
            </td>
        </tr>

                       
        <tr class="form-group">
            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 232px;">
                Module:
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control col-sm-10" placeholder="Module"></asp:TextBox>
            </td>
            <td style="padding-left: 7px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Textbox1" ErrorMessage="Module Required" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            </td>
        </tr>

         <tr class="form-group">
            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 232px;">
                Request Type:
             </td>
            <td>
                <asp:TextBox ID="ReqType" runat="server" CssClass="form-control col-sm-10" placeholder="Request Type"></asp:TextBox>
            </td>
             <td style="padding-left: 7px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ReqType" ErrorMessage="Request Type Required" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            </td>
        </tr>

        <tr class="form-group">
            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 232px;">
                Date:
            </td>
            <td>
                <asp:TextBox ID="Date" runat="server" CssClass="form-control col-sm-10" placeholder="Date" ></asp:TextBox>
            </td>
            <td style="padding-left: 7px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Date" ErrorMessage="Valid Date Required" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            <br />
                <asp:CustomValidator runat="server" ID="CustDateValidator" OnServerValidate="CustDateValidator_ServerValidate" CssClass="alert-danger" ControlToValidate="Date"
                    ErrorMessage="The date entered has passed. Booking cannot be confirmed" />
            </td>
        </tr>
       
        <tr class="form-group">
            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 232px;">
                Time:
                </td>
                
            <td>
                <asp:TextBox ID="ST" runat="server" TextMode="DateTime" CssClass="form-control col-sm-10" placeholder="Start Time"></asp:TextBox>
                
        <asp:TextBox ID="ET" runat="server" TextMode="DateTime" CssClass="form-control col-sm-10" placeholder="End Time"></asp:TextBox>
              
            </td>
            <td style="padding-left: 7px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ST" ErrorMessage="Start Time Required" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
            <br />
               
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ET" ErrorMessage="End Time Required" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                          
            
            </td>
        </tr>
        <tr>
            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 232px;">
                Lab:
            </td>
            <td>
            
                <asp:TextBox ID="Lab" runat="server" CssClass="form-control col-sm-10" placeholder="Lab"></asp:TextBox>
                                           </td>
            <td style="padding-left: 7px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Lab" ErrorMessage="Lab Required" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            </td>
        </tr>

         <tr>
            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold">
                
             </td>
            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 232px;">
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Check Availability" Font-Bold="True" ForeColor="#0066FF" CssClass="btn btn-default" />
                <br />
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Medium" Text="Available Venues:" Visible="False" ForeColor="Green" ></asp:Label>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium"></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 232px;">
                Confirmation Email:
            </td>
            <td >
                <asp:TextBox ID="Email" runat="server" CssClass="form-control col-sm-10" placeholder="Confirmation email"></asp:TextBox>
            </td>
            <td style="padding-left: 7px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Email" ErrorMessage="Valid Email" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                           <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email" CssClass="alert-danger" ErrorMessage="Enter a valid Email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="AllValidationGroup"></asp:RegularExpressionValidator>  
            </td>
        </tr>

         <tr>
            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 232px;">
                Cost (external clients):
            </td>
            <td >
                <asp:TextBox ID="Cost" runat="server" CssClass="form-control col-sm-10" placeholder="Cost (If applicable)"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td style="width: 232px; font-size: large;" class="modal-sm">&nbsp;</td>
            <td colspan="2" style="height: 24px; width: 409px;">
                 <asp:Button ID="btnClear" runat="server" Text="Cancel" OnClick="btnClear_Click" Font-Names="Arial" Width="74px" BackColor="White" ForeColor="Blue" Height="38px" CssClass="btn btn-default" />
                &nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="OK" Width="77px" OnClick="Button2_Click" BackColor="White" ForeColor="Blue" Height="38px" CssClass="btn btn-default"/>
            </td>
        </tr>
        <tr>
                    <td style="width: 232px" class="modal-sm">
                        
                    </td>
                    <td colspan="2" style="width: 409px">
                        <asp:Label ID="lblsuccess" runat="server" Text="Label" ForeColor="Green"></asp:Label>
                    </td>

                </tr>

                <tr>
                    <td style="width: 232px" class="modal-sm">
                       
                        <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Blue" Height="16px" NavigateUrl="~/DeviceBookings.aspx" style="margin-right: 0px" Width="317px">Approve Requests for Devices</asp:HyperLink>
                       
                    </td>
                    <td colspan="2" style="width: 409px">
                       <asp:Label ID="lblerror" runat="server" Text="Label" ForeColor="Red"></asp:Label>
                        <br />
                        <br />
                    </td>

                </tr>
    </table>
    <asp:Label ID="Label2" runat="server"></asp:Label>
    
</div>

    </asp:content>