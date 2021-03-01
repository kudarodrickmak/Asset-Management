<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AssetManagement._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1 style="font-size: xx-large; color: #FFFF00; background-color: #000080;">Nelson Mandela Computing Sciences Department</h1>
        <h1 style="font-size: xx-large;">Asset Management Tool</h1>
        <h1 style="font-size: x-large">Welcome <asp:Label ID="CurFirstName" runat="server"></asp:Label>.</h1>
        <p>&nbsp;</p>
        
    </div>
    <div class="row">
       
        <div class="col-md-4">
            <h2  class="display-2">Laboratories</h2>
            <p style="font-size:large;">
              
                To make lab requests more efficient, the tool allows you to view the laboratories in the department and the seats in each Lab!.
                <br />
                The tool allows you to check lab availability!
                <br />
                Click on the link below to View Labs!
                <br />
                  <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Labs.aspx" ForeColor="#0000CC" BackColor="White" Height="16px" Width="188px">View Labs</asp:HyperLink> 
              
            </p>
        </div>
        <div class="col-md-4">
             <h2  class="display-2">Request Process</h2>
            <p style="font-size: large;">
                To make your experience seamless, the Asset Management Tool allows you to send requests for devices and laboratories by completing the following simple steps:
                <br />
                </p>
            <p style="font-weight: bold; list-style-type: disc; font-size: large">
                Complete the Request Form.
                <br />
               Ensure to Fill-in all required detail.
                <br />
                Click 'OK' and your request will be Sent!
              </p>
            <br />
           
                <p style="font-size: large; color: #FF0000;">
                               NB: The administrator will confirm your request. You will be notified after your request has been confirmed.
               </p>
            <p style="font-size: large;">
               <br />
                Ready to request? Click on the link below!
                <br />
                 <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Request.aspx" ForeColor="#0000CC" BackColor="White" Height="16px" Width="262px">Request Lab Booking</asp:HyperLink>
        
                <br />
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Assets.aspx" ForeColor="#0000CC" BackColor="White" Height="16px" Width="262px">Request Device Booking</asp:HyperLink>
        
            
            </p>

        </div>
            <div class="col-md-4">
            <h2  class="display-2">Booking Process</h2>
            <p style="font-size:large;">
               Your request will be handled by our professional staff in the department!.</p>
                
                <p style="font-size: large; color: #FF0000;">
                DISCLAIMER: The department receives a large amount of requests. Therefore, sending a request does not guarantee a booking will be made. 
                Click on the link below to View Labs!</p>

                <p style="font-size:large;">You will receive an email once your lab booking has been confirmed and it will be added to the Current Bookings</p>
                <br />
                  <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/ViewBookings.aspx" ForeColor="#0000CC" BackColor="White" Height="16px" Width="188px">View Lab Bookings</asp:HyperLink> 
              
            
        
                
            
        </div>
    </div>

    
            
            
           
            
          
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           
            
       
        
        
       
             
            
      
    

   

</asp:Content>
<%--SelectionMode="Day" OnSelectionChanged="DateChanged" ondayrender="DateRange"--%>