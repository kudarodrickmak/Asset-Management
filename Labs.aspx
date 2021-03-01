<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Labs.aspx.cs" Inherits="AssetManagement.Labs" %>

<asp:content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div>
            <div>

            </div>
            <br />
            <br />
            <br />
            <h3 class="text-center">Laboratories available in the Computing Sciences Department.</h3>
            <h4>Note: All Laboratories are equipped with projectors and audio facilities.</h4>
            <br />
            
            
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="Lab_No" DataSourceID="SqlDataSource1" Width="337px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="NotSet"></AlternatingRowStyle>
                <Columns>
                    <asp:CommandField ShowSelectButton="False"></asp:CommandField>
                    <asp:BoundField DataField="Lab_No" HeaderText="Lab_No" SortExpression="Lab_No" ReadOnly="True"></asp:BoundField>


                    <asp:BoundField DataField="Seats" HeaderText="Seats" SortExpression="Seats"></asp:BoundField>
                </Columns>
                <EditRowStyle BackColor="#999999"></EditRowStyle>

                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

                <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

                <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
            </asp:GridView>



            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:AMT_DBConnectionString %>' SelectCommand="SELECT * FROM [Labs]"></asp:SqlDataSource>
            <br />
</div>
          
     
     <table class="modal-content" style="width: 1200px; height: 400px;">
        

    
        <tr class="form-group">
            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 443px;">
                Select date:
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control col-sm-10" placeholder="--Date--" TextMode="Date"></asp:TextBox>
            </td>
            <td style="padding-left: 7px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter Valid Date" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                <br />
                
                <asp:CustomValidator runat="server" ID="CustDateValidator" OnServerValidate="CustDateValidator_ServerValidate" CssClass="alert-danger" ControlToValidate="TextBox1"
                    ErrorMessage="enter valid date in the future" /> 
                                                                           
                </td>
        </tr>
        <tr class="form-group">
            <td class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 443px; left: 1px; top: 68px; height: 43px;">
                Select Lab:
            </td>
            <td >
                <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control col-sm-10" placeholder="Select Lab">
                                   <asp:ListItem Value="-1">--Select Lab--</asp:ListItem>
                                  <asp:ListItem>1</asp:ListItem>
                                  <asp:ListItem>2</asp:ListItem>
                                  <asp:ListItem>3</asp:ListItem>
                                  <asp:ListItem>4</asp:ListItem>
                                  <asp:ListItem>5</asp:ListItem>
                                   <asp:ListItem>6</asp:ListItem>
                                  <asp:ListItem>Amazon</asp:ListItem>
                                <asp:ListItem>Seminar Room</asp:ListItem>
                    </asp:DropDownList>
            </td>
            <td style="padding-left: 7px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" InitialValue="-1" ControlToValidate="DropDownList3" ErrorMessage="Select Lab Number" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
        </td>
                </tr>

        <tr class="form-group">
            <td  class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 443px;">
                Select Time:

            </td>
            <td >
                
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control col-sm-10" placeholder="Select Start Time">
                    <asp:ListItem Value ="-1">--Select Start Time--</asp:ListItem>
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
                    
                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control col-sm-10" placeholder="Select End Time">
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
&nbsp;</td>
            <td style="padding-left: 7px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" InitialValue="-1" ControlToValidate="DropDownList1" ErrorMessage="Enter Valid Date" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" InitialValue="-1" ControlToValidate="DropDownList2" ErrorMessage="Enter Valid Date" CssClass="alert-danger" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            </td>
        </tr>
         <tr class="form-group">
             <td></td>
         <td>
                <asp:Button ID="Button1" runat="server" CssClass="btn btn-default" Text="Check Availability" OnClick="Button1_Click" Font-Bold="True" ForeColor="Blue" />
            </td>
         </tr>
        
        <tr class="form-group">
            <td  class="control-label col-sm-2" style="font-size: large; font-weight: bold; width: 443px;">
                </td>
            <td style="width: 362px; height: 161px;">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#009900" Text="Available Labs for the selected date and time:" Visible="False"></asp:Label>
                <br />
                <asp:Label ID="Label1" runat="server" BackColor="#FFCC00" Font-Bold="True" Font-Size="Medium"></asp:Label>

            </td>

        </tr>
    </table>

     <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Request.aspx" Height="16px" Width="323px" ForeColor="Blue">Request for Lab Booking Lab</asp:HyperLink>
   </asp:content>
