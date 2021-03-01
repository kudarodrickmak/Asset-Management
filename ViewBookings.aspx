<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewBookings.aspx.cs" Inherits="AssetManagement.ViewBookings" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
   <script type="text/javascript">

    function Print() {
        window.print();
    }

</script> 
    <div>
        <asp:SqlDataSource ID ="VBook" runat ="server"
            connectionstring="Data Source = postgrad.nmmu.ac.za; Initial Catalog = AMT_DB; Persist Security Info=True; User ID = AMT_DB_user; Password=Maina25896;"
           providerName ="System.Data.SqlClient"
           
            SelectCommand ="SELECT [Lab], [Mod_Code], [RType], [dtstart], [dtend] FROM [BookingDetails] WHERE Lab LIKE 1 OR lab LIKE 2 OR Lab LIKE 3 OR Lab LIKE 4 OR Lab LIKE 5 OR Lab LIKE 6 ORDER BY Lab">

            <SelectParameters> 

                
                <asp:ControlParameter Name ="SelectedLab"
                    controlID ="KLab" PropertyName ="SelectedValue" DefaultValue="%" />

            </SelectParameters>

        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsLab" runat="server"
            connectionstring="Data Source = postgrad.nmmu.ac.za; Initial Catalog = AMT_DB; Persist Security Info=True; User ID = AMT_DB_user; Password=Maina25896;"
            providerName="System.Data.SqlClient"
            SelectCommand ="SELECT DISTINCT [Lab] FROM [BookingDetails]">
        </asp:SqlDataSource>


        <asp:DropDownList runat="server" ID="KLab" AutoPostBack ="true" DatasourceID="dsLab" DataTextField="Lab" DataValueField="Lab" AppendDataBoundItems="true">
   
            <asp:ListItem Selected="True" Value="%">Filter by:</asp:ListItem>
                
                </asp:DropDownList>

        <br />

        <asp:ListView ID="LABLIST" runat="server" DataSourceID="VBook">
            <LayoutTemplate>
                <table>
                    <tr>
                        <td>Lab</td>
                        <td>Module</td>
                        <td>Event</td>
                        <td>Start Time</td>
                        <td>End Time</td>

                    </tr>
                    <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                </table>
                </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td><%#Eval("Lab") %></td>
                    <td><%#Eval("Mod_Code") %></td>
                    <td><%#Eval("RType") %></td>
                    <td><%#Eval("dtstart") %></td>
                    <td><%#Eval("dtend") %></td>
                </tr>


            </ItemTemplate>



        </asp:ListView>

        <asp:Button ID="btnPrint" runat="server" Text="Print Schedule" OnClientClick="Print()" />
                </div>


</asp:Content>
