<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ManageDevices.aspx.cs" Inherits="AssetManagement.View_Request" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
         <div>
            <div>
                <asp:HiddenField ID="HiddenField1" runat="server" />
                <h3 class="text-center">Manage Returns and Overdue Loaned Devices.</h3>
                <p class="text-left"><span style="font-size: large">To confirm device<strong> returns</strong>, click on Returns and select the device being returned from the list. </span> </p>
                <p class="text-left"><span style="font-size: large">To view <strong>overdue returns</strong>, click on Overdue Returns. Select the device that are overdue and click notify to send a reminder to the user.</span></p>
                <p>&nbsp;</p>
                <p>
                    <asp:Button ID="Button4" runat="server" CssClass="btn btn-default" ForeColor="Blue" Text="Returns" Width="138px" OnClick="Button4_Click" />
                    &nbsp;&nbsp;
                    <asp:Button ID="Button3" runat="server" CssClass="btn btn-default" ForeColor="Red" OnClick="Button3_Click" Text="Overdue Returns" />
                </p>

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  Width="956px" CellPadding="4" ForeColor="#333333" GridLines="None" Visible="False">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                       <asp:BoundField DataField="B_ID" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="B_ID"></asp:BoundField>
                        
                        <asp:BoundField DataField="FName" HeaderText="FName" SortExpression="FName"></asp:BoundField>
                        <asp:BoundField DataField="Device" HeaderText="Device" SortExpression="Device"></asp:BoundField>
                        <asp:BoundField DataField="ReturnD" HeaderText="ReturnD" SortExpression="ReturnD"></asp:BoundField>
                        <asp:BoundField DataField="BookingEmail" HeaderText="BookingEmail" SortExpression="BookingEmail"></asp:BoundField>
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status"></asp:BoundField>
                   <asp:TemplateField>
                         <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lnkView" CommandArgument='<%#Eval("B_ID") %>' OnClick="lnk_OnClick" >Proceed to notify</asp:LinkButton> 
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
                <br />
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"  Width="956px" CellPadding="4" ForeColor="#333333" GridLines="None" Visible="False">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                       <asp:BoundField DataField="B_ID" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="B_ID"></asp:BoundField>
                        
                        <asp:BoundField DataField="FName" HeaderText="FName" SortExpression="FName"></asp:BoundField>
                        <asp:BoundField DataField="Device" HeaderText="Device" SortExpression="Device"></asp:BoundField>
                        <asp:BoundField DataField="ReturnD" HeaderText="ReturnD" SortExpression="ReturnD"></asp:BoundField>
                        <asp:BoundField DataField="BookingEmail" HeaderText="BookingEmail" SortExpression="BookingEmail"></asp:BoundField>
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status"></asp:BoundField>
                   <asp:TemplateField>
                         <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lnkView" CommandArgument='<%#Eval("B_ID") %>' OnClick="lnk2_OnClick" >Check-In</asp:LinkButton> 
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

               
            </div>

             <div>
<table class="modal-content" style="width: 1200px; height: 400px;">
                <tr  class="form-group">
                    <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 443px;">
                        ID:
                        </td>
                    <td>
                         <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control col-sm-10" TextMode="Singleline" ></asp:TextBox>
                    </td>
                   
                </tr>
    
    <tr  class="form-group">
                    <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 443px;">
                        Recipient Name:
                    <td style="width: 221px">
                         <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control col-sm-10" TextMode="Singleline" placeholder="e.g Megan"></asp:TextBox>
                    </td>
                   
                </tr>
                <tr  class="form-group">
                <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 443px;">
                    Email Address: 
                    </td>
                    <td>
                        <asp:TextBox ID="Email2" runat="server" CssClass="form-control col-sm-10" TextMode="Email" placeholder ="example@gmail.com" ></asp:TextBox>
                    </td>
                     <td style="padding-left: 7px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Email2" ErrorMessage="Valid Email" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                           <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email2" CssClass="alert-danger" ErrorMessage="Enter a valid Email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="AllValidationGroup"></asp:RegularExpressionValidator>  
            </td>
                </tr>
                
                <tr  class="form-group">
                <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 443px;">
                    Notification Details:
                    </td>
                    <td>
                         <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control col-sm-10" TextMode="Singleline" placeholder="Type message here.."></asp:TextBox>
                    </td>
                </tr>
                 <tr  class="form-group">
                     <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 443px;">

                     </td>
                     <td style="width: 221px">
                         <asp:Button ID="Button2" runat="server" CssClass="btn btn-default" Text="Cancel" BackColor="White" ForeColor="Blue" OnClick="Button2_Click" />
                         &nbsp;&nbsp;
                         <asp:Button ID="Button1" runat="server" CssClass="btn btn-default" Text="OK" OnClick="Button1_Click" BackColor="White" ForeColor="Blue" />
                     </td>
                 </tr>
            </table>


                 
             </div>






             <div>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Bookings.aspx">Schedule Bookings</asp:HyperLink>
               
            </div>
        </div>
   
</asp:Content>
