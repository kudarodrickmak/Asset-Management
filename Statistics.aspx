<%--<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Statistics.aspx.cs" Inherits="AssetManagement.Statistics" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div>
            <br />
            <br />
            <h2>Frequency of Device Bookings</h2>
            <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource3">
                <Series>
                    <asp:Series Name="Series1" XValueMember="Device" YValueMembers="B_ID" ChartType="Pie"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
            <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:AMT_DBConnectionString %>' SelectCommand="SELECT [B_ID], [Device], [ReqType] FROM [DeviceBookings] ORDER BY [Device], [ReqType], [Status]"></asp:SqlDataSource>
        </div>
  </asp:Content>--%>