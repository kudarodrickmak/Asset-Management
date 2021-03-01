<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DeviceBookings.aspx.cs" Inherits="AssetManagement.DeviceBookings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  
     <br />
    <br />

    
<h2 class="text-left">Confirm Device Booking Requests.</h2>
    <p class="text-left">
        <asp:Button ID="Button4" runat="server" CssClass="btn btn-default" Text="View Device Requests" OnClick="Button4_Click" ForeColor="Blue" Height="36px" /> 
        
    </p>
       <p id="show">
           <h5> 
               <asp:Label ID="Label3" runat="server" Text="Please select a request from the list below to make a device booking. " Visible="False" style="font-size: x-large"></asp:Label>
    </h5>

       </p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1287px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Height="210px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

        <Columns>
            <asp:CommandField ShowSelectButton="True" SelectText="View"></asp:CommandField>
            <asp:BoundField DataField="Request_ID" HeaderText="Request_ID" ReadOnly="True" InsertVisible="False" SortExpression="Request_ID"></asp:BoundField>

            <asp:BoundField DataField="Mod_Code" HeaderText="Mod_Code" SortExpression="Mod_Code"></asp:BoundField>

            <asp:BoundField DataField="Request_Type" HeaderText="Type" SortExpression="Request_Type"></asp:BoundField>
            <asp:BoundField DataField="Start_Date" HeaderText="Date" SortExpression="Start_Date"></asp:BoundField>
            <asp:BoundField DataField="End_Date" HeaderText="Return_Date" SortExpression="End_Date"></asp:BoundField>
            <asp:BoundField DataField="Start_Time" HeaderText="Start-Time" SortExpression="Start_Time"></asp:BoundField>
            <asp:BoundField DataField="End_Time" HeaderText="End-Time" SortExpression="End_Time"></asp:BoundField>
            <asp:BoundField DataField="MoveableAsset" HeaderText="Device" SortExpression="MoveableAsset"></asp:BoundField>
           
            <asp:BoundField DataField="BookingEmail" HeaderText="Booking Email" SortExpression="BookingEmail"></asp:BoundField>
            <asp:BoundField DataField="Confirmed" HeaderText="Status" SortExpression="Confirmed"></asp:BoundField>
            
            <asp:TemplateField>
                         <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lnkView" CommandArgument='<%#Eval("Request_ID") %>' OnClick="lnk_OnClick" ForeColor="#000066">Proceed to book</asp:LinkButton> 
                         </ItemTemplate>

                     </asp:TemplateField> 
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

    </asp:GridView>
    <table class="modal-content" style="width: 1100px; height: 668px;">
         
        <tr class="form-group">
            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 320px;">
                Request_ID:
            </td>
            <td>
                <asp:TextBox ID="ReqID" runat="server" CssClass="form-control col-sm-10" placeholder="ID"></asp:TextBox>
            </td>
        </tr>

                       
        <tr class="form-group">
            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 320px;">
                Module:
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control col-sm-10" placeholder="Module"></asp:TextBox>
            </td>
            <td style="padding-left: 7px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  ControlToValidate="TextBox1" ErrorMessage="Module Required" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            </td> 
        </tr>

         <tr class="form-group">
            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 320px;">
                Request Type:
             </td>
            <td>
                <asp:TextBox ID="ReqType" runat="server" CssClass="form-control col-sm-10" placeholder="Request Type"></asp:TextBox>
            </td>
             <td style="padding-left: 7px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ControlToValidate="ReqType" ErrorMessage="Request Type Required" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            </td> 
        </tr>

        <tr class="form-group">
            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 320px;">
                Date:
            
            </td>
            <td >

                <asp:TextBox ID="Date" runat="server" CssClass="form-control col-sm-10" placeholder="Date"></asp:TextBox>
            </td>
            <td style="padding-left: 7px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  ControlToValidate="Date" ErrorMessage= " Valid Date Required" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            <br />
                <asp:CustomValidator runat="server" ID="CustDateValidator" OnServerValidate="CustDateValidator_ServerValidate" CssClass="alert-danger" ControlToValidate="Date"
                    ErrorMessage="Date selected is in the past. Please enter valid date" />
            
            </td> 
        </tr>
        

        <tr class="form-group">
            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 320px;">
                Return Date:</td>
            <td>

                <asp:TextBox ID="RDate" runat="server" CssClass="form-control col-sm-10" placeholder="Return Date"></asp:TextBox>
            </td>
            <td style="padding-left: 7px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"  ControlToValidate="RDate" ErrorMessage="Valid Date Required" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            
            </td> 
        </tr>
        <tr class="form-group">
            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 320px;">
                Time:</td>
            <td> 
                <asp:TextBox ID="ST" runat="server" TextMode="DateTime" Width="150px" CssClass="form-control col-sm-10" placeholder="Start Time"></asp:TextBox>
               <br />
                <asp:TextBox ID="ET" runat="server" TextMode="DateTime" Width="150px" CssClass="form-control col-sm-10" placeholder="End Time"></asp:TextBox>
                
               
            </td>
             <td style="padding-left: 7px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"  ControlToValidate="ST" ErrorMessage="Start Time Required" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            <br />
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"  ControlToValidate="ET" ErrorMessage="Return Time Required" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
             </td> 

        </tr>
        <tr class="form-group">
            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 320px;">
                Device:
            </td>
            <td>
                <br />
                <asp:TextBox ID="Device" runat="server" CssClass="form-control col-sm-10" placeholder="Device"></asp:TextBox>
                <br />
            </td>
            <td style="padding-left: 7px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"  ControlToValidate="Device" ErrorMessage="Device Type Required" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            </td> 

        </tr>

         

        <tr class="form-group">
            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 320px;">
                Confirmation Email:
            </td>
            <td>
                <asp:TextBox ID="Email" runat="server" CssClass="form-control col-sm-10" placeholder="Email Address"></asp:TextBox>
            </td>
            <td style="padding-left: 7px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="Email" ErrorMessage="Valid Email Address Required" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email" CssClass="alert-danger" ErrorMessage="Valid Email address required" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="AllValidationGroup"></asp:RegularExpressionValidator>
              
              </td> 
        </tr>

         

        <tr class="form-group">
            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 320px;">&nbsp;</td>
            <td>
                 <asp:Button ID="btnClear" runat="server" CssClass="btn btn-default" Text="Cancel" OnClick="btnClear_Click" Font-Names="Arial" Width="76px" BackColor="White" ForeColor="Blue" Height="36px" />
                &nbsp;
                <asp:Button ID="Button2" runat="server" CssClass="btn btn-default" Text="OK" Width="77px" OnClick="Button2_Click" BackColor="White" ForeColor="Blue" Height="36px" />
            </td>
        </tr>
        <tr class="form-group">
                    <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 320px;">
                        
                    </td>
                    <td style="width: 201px">
                        <asp:Label ID="lblsuccess" runat="server" Text="Label" ForeColor="Green"></asp:Label>
                    </td>

                </tr>

                <tr class="form-group">
                    <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 320px;">
                       
                    </td>
                    <td style="width: 201px">
                       <asp:Label ID="lblerror" runat="server" Text="Label" ForeColor="Red"></asp:Label>
                    </td>

                </tr>
    </table>
    <asp:Label ID="Label2" runat="server"></asp:Label>




</asp:Content>
