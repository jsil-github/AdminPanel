<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IVRTransfer.aspx.cs" Async="true" Inherits="IVR_Default"%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>JS Investments | Insights | Review</title>
    <link rel="icon" href="../favicons/5955--favicon.ico">
    <link href="../css/css-app.29328741.css" rel="stylesheet" />
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
    <!-- IonIcons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/adminlte.css">
    <link rel="stylesheet" href="dist/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="dist/css/fixedHeader.dataTables.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
    <SCRIPT language=Javascript>
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }
    </SCRIPT>
    <style>
        select{
            padding: 4px !important;
            background: none !important;
        }
        .sidebar {
            width: 250px;
        }
        
        [class*="sidebar-dark-"] {
            background-color: #3c1559;
        }
        #main-menuIcon{
            position: relative;
            top: 28px;
        }
        .main-menuDiv{
            margin-left: 10%;
        }
        p{
            font-size: 1.2rem;
        }
        .nav-sidebar .nav-link p {
            display: inline-flex;
        }
    </style>
    <style>
        .customer-info img {
            border-radius: 8px;
            min-width: 90%;
        }

        .customer-info ul li .seprator-section ul li label {
            text-transform: none;
            margin-bottom: 7px;
        }

        .customer-info ul li .seprator-section label {
            text-transform: none;
            margin-bottom: 7px;
            font-size: 13px !important;
            color: rgba(0, 0, 0, 0.5);
        }

        customer-info .customer-profile {
            width: 100%;
            border-radius: 8px;
            background-size: cover;
        }

        img {
            max-width: 100%;
            display: block;
        }

        label:not(.form-check-label):not(.custom-file-label) {
            font-weight: 600;
        }

        .customer-info ul {
            list-style-type: none;
            padding-left: 10px;
            margin-bottom: 10px;
        }

        .card {
            border: 1px solid transparent;
            background: #fff;
            border-radius: 16px;
            padding: 20px 32px;
            margin: 0 auto;
            -webkit-box-shadow: 0 0.5px 0 rgb(50 50 93 / 20%);
            box-shadow: 0 0.5px 0 rgb(50 50 93 / 20%);
        }

        .card {
            position: relative;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
            -ms-flex-direction: column;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 1px solid rgba(0,0,0,.125);
            border-radius: 8px;
        }

        .customer-info .pending.status-view {
            margin-right: 8px;
        }

        .customer-info .pending {
            margin: 24px auto;
            position: static;
            width: 110px;
        }

        .newcolor{
            background-color:#00FF00 !important;
            border-color:#00FF00 !important;
        }

        .status-view.medium-risk, .status-view.pending {
            background-color: #f4c200;
        }

        .status-view {
            color: #fff;
            border-radius: 16px;
            height: auto;
            text-align: center;
            font-size: .835rem;
            padding: 9px 10px;
            min-width: 120px;
            display: inline-block;
            top: 7px;
            margin: auto;
            max-width: 130px;
            font-family: ProximanovaLight;
        }

        .status-type-icon, .status-view {
            position: absolute;
            left: 0;
            right: 0;
        }

        .status-view span {
            position: relative;
            top: 0;
            margin-left: 8px;
            display: inline-block;
            vertical-align: bottom;
            text-align: center;
        }
        #BtnEdit,#BtnBack{
            min-width:22%;
        }
        #BtnEdit:hover,#btndownloadPDF:hover{
            color: #fff;
            background-color: #5a6268;
            border-color: #545b62;
        }
        body {
            font-family: ProximanovaRegular;
            font-size: .875rem !important;
        }
    </style>
</head>
<body class="hold-transition sidebar-mini">
    <form id="form1" runat="server">
        <div class="wrapper">
            <!-- Navbar -->
            <uc1:headermenu ID="headermenu1" />
            <!-- /.navbar -->

            <!-- Main Sidebar Container -->
            <aside class="main-sidebar sidebar-dark-primary elevation-4">
                <!-- Brand Logo -->
                <div class="sidebar">

                    <!-- Sidebar Menu -->
                    <uc1:sidebarmenu ID="sidebarmenu1" />
                    <!-- /.sidebar-menu -->
                </div>
            </aside>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <div class="content-header">
                    <div class="container-fluid">
                        <nav class="navbar navbar-expand navbar-white navbar-light left">
    <!-- Left navbar links -->
    <ul class="navbar-nav left">
      
      <li class="nav-item d-none d-sm-inline-block">
        <a  style='color:white' href="#" class="nav-link active">Transfer</a>
      </li>
      
         <li class="nav-item d-none d-sm-inline-block">
          <a  style='color:white' href="https://sma.jsil.com/signup/IVR/IVRRedemption.aspx" class="nav-link">Redemption</a>
      </li>
        <li class="nav-item d-none d-sm-inline-block">
     
            
      </li>
    </ul>
    </nav>
                        <!-- /.row -->
                    </div>
                    <!-- /.container-fluid -->
                </div>
                <!-- /.content-header -->

                <!-- Main content -->
                <div class="content" id="pdf" style="background-color:white;">
                    <div class="container-fluid">

                        <div class="col-sm-12 grid-margin stretch-card">
                            <div class="card customer-info">
                                <div class="customers-info-section">
                                    <div class="row">
                                        <div class="col-md-3 col-sm-12 text-center profile-image-section">
                                            <div class="customer-profile">
                                                <img src="data:image/png;base64,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">
                                            </div>
                                            <div ><span class="status-view pending"><i class="fa fa-spinner" style="top:0"></i><span>Pending</span></span></div>
                                            <%--<asp:Button ID="approved" OnClick="approved_Click" CssClass="btn btn-light"/>--%>
                                            <asp:Label ID="resp"></asp:Label>
                                        </div>
                                        <div class="col-md-8 col-sm-12">
                                            <ul>
                                                <li>
                                                    <div class="seprator-section">
                                                        <div class="row">
                                                            <div class="col-md-12 mb-3">
                                                                <h3>Conversion request Form</h3>
                                                            </div>

                                                            <div class="col-md-3">
                                                                <ul class="row">
                                                                    <li class="col-md-12">
                                                                        <label>Folio No:</label></li>
                                                                    
                                                                </ul>
                                                            </div>
                                                          
                                                           <div class="col-md-8">
                                                                <ul class="row">
                                                                    <li class="col-md-8">
                                                                         <asp:TextBox ID="txtFolio" CssClass="form-control txtFont" runat="server" AutoPostBack="True" OnTextChanged="txtFolio_TextChanged"></asp:TextBox>
                                                                    
                                                                </ul>
                                                            </div>

                                                             <div class="col-md-3">
                                                                <ul class="row">
                                                                    <li class="col-md-12">
                                                                        <label>Transfer From Fund:</label></li>
                                                                    
                                                                </ul>
                                                            </div>
                                                          
                                                           <div class="col-md-8">
                                                                <ul class="row">
                                                                    <li class="col-md-8">
                                                                         <asp:DropDownList ID="dropDownFund" OnTextChanged="dropDownFundChangeEvent" AutoPostBack="true" runat="server"  CssClass="form-control">
                                                                            </asp:DropDownList>
                                                                        </li>
                                                                    
                                                                </ul>
                                                            </div>

                                                          
                                                             <div class="col-md-3">
                                                                <ul class="row">
                                                                    <li class="col-md-12">
                                                                        <label>FTF Transfer Type:</label></li>
                                                                    
                                                                </ul>
                                                            </div>
                                                          
                                                           <div class="col-md-8">
                                                                <ul class="row">
                                                                    <li class="col-md-8">
                                                                         <asp:DropDownList ID="dropDownTransferType"  onTextChanged="tranferTypeChange" AutoPostBack="true" runat="server"  CssClass="form-control">

                                                                         

                                                                            <asp:ListItem Text= "Units" Value="1"></asp:ListItem>

                                                                            <asp:ListItem Text= "Percentage" Value="2"></asp:ListItem>

                                                                             <asp:ListItem Text= "All Units" Value="3"></asp:ListItem>

                                                                             
                                                                            </asp:DropDownList>
                                                                        </li>
                                                                    
                                                                </ul>
                                                            </div>

                                                              
                                                             <div class="col-md-3">
                                                                <ul class="row">
                                                                    <li class="col-md-12">
                                                                        <label>Closing Balance as of last nav:</label></li>
                                                                    
                                                                </ul>
                                                            </div>
                                                          
                                                           <div class="col-md-8">
                                                                <ul class="row">
                                                                    <li class="col-md-8">
                                                                         <asp:TextBox  ID="txtBalance" CssClass="form-control txtFont" runat="server" onkeydown="return false" onpaste ="return false"></asp:TextBox>
                                                                    
                                                                </ul>
                                                            </div>


                                                             <div class="col-md-3">
                                                                <ul class="row">
                                                                    <li class="col-md-12">
                                                                        <label id="lblUnits" runat="server">Approximate Units:</label></li>
                                                                    
                                                                </ul>
                                                            </div>
                                                          
                                                           <div class="col-md-8">
                                                                <ul class="row">
                                                                    <li class="col-md-8">
                                                                         <asp:TextBox ID="txtUnits" CssClass="form-control txtFont" runat="server"></asp:TextBox>
                                                                        <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer"  ControlToValidate="txtUnits" ErrorMessage="Error" />
                                                                    
                                                                </ul>
                                                            </div>

                                                             <div class="col-md-3">
                                                                <ul class="row">
                                                                    <li class="col-md-12">
                                                                        <label>Transfer To Fund:</label></li>
                                                                    
                                                                </ul>
                                                            </div>
                                                          
                                                           <div class="col-md-8">
                                                                <ul class="row">
                                                                    <li class="col-md-8">
                                                                         <asp:DropDownList ID="dropDownToFund" AutoPostBack="true" runat="server"  CssClass="form-control">
                                                                            </asp:DropDownList>
                                                                        </li>
                                                                    
                                                                </ul>
                                                            </div>

                                                             
                                                          
                                                          
                                                          

                                                           
                                                              <div runat="server"  id="div1" class="col-md-8">
                                                                <ul class="row">
                                                                    <li class="col-md-8">
                                                                     <asp:Button ID="btnPreview" OnClick="btnPreviewClick" class="btn btn-success" runat="server" Text="Preview" BorderStyle="Solid" ToolTip="Preview Transaction"/>  
                                                                  <asp:Button ID="btnReset" onClick="btnResetClick" class="btn btn-warning" runat="server" Text="Reset" BorderStyle="Solid" ToolTip="Reset Form"/>  

                                                                </ul>
                                                            </div>
                                                         </div>
                                                           
                                                    
                                                    </div>
                                                </li>
                                            </ul>
                                           
                                           <div class="container">
                                               <div class="modal fad" id="myModal" role="dialog">
                                                   <div class="modal-dialog modal-dialog-centered">
                                                       <div class="modal-content">
                                                       <div class="modal-header">
                                                           <h4 class="modal-title">Transfer Detail</h4>
                                                           
                                                       </div>
                                                       <div class="modal-body">
                                                             <div  runat="server" class="container-fluid">
                                                                <div class="row">
                                                                    <div class="col-md-12 d-flex">
                                                                         <asp:Label CssClass="col-md-6" runat="server" id="folioLabel">Folio Number: </asp:Label>
                                                                         <b><asp:Label CssClass="col-md-6" runat="server" id="folioText"></asp:Label></b>
                                                                    </div>
                                                                    <div class="col-md-12 d-flex">
                                                                         <asp:Label CssClass="col-md-6" runat="server" id="fromFundLabel">Transfer from Fund: </asp:Label>
                                                                         <b><asp:Label CssClass="col-md-6" runat="server" id="fromFundText"></asp:Label></b>
                                                                    </div>
                                                                       <div class="col-md-12 d-flex">
                                                                         <asp:Label CssClass="col-md-6" runat="server" id="Label1">Transfer to Fund: </asp:Label>
                                                                         <b><asp:Label CssClass="col-md-6" runat="server" id="toFundText"></asp:Label></b>
                                                                    </div>
                                                                  <%--  <div class="col-md-12 d-flex">
                                                                         <asp:Label CssClass="col-md-6" runat="server" id="redemptionTypeLabel">Conversion Type: </asp:Label>
                                                                         <b><asp:Label CssClass="col-md-6" runat="server" id="redemptionTypeText">47253</asp:Label></b>
                                                                    </div>--%>
                                                                    <%--<div class="col-md-12 d-flex">
                                                                         <asp:Label CssClass="col-md-6" runat="server">Closing Balance: </asp:Label>
                                                                         <b><asp:Label CssClass="col-md-6" runat="server" id="closingBalanceText"></asp:Label></b>
                                                                    </div>--%>
                                                                    <div class="col-md-12 d-flex">
                                                                         <asp:Label CssClass="col-md-6" runat="server" >Amount/Units: </asp:Label>
                                                                         <asp:Label CssClass="col-md-6" runat="server" id="approximateUnitsText">47253</asp:Label>
                                                                    </div>
                                                                    <%--<div class="col-md-12 d-flex">
                                                                         <asp:Label CssClass="col-md-6" runat="server" >Payment Instruction Mode: </asp:Label>
                                                                         <asp:Label CssClass="col-md-6" runat="server" id="paymentInstructionText"></asp:Label>
                                                                    </div>
                                                                    <div class="col-md-12 d-flex">--%>
                                                                     <%--    <asp:Label CssClass="col-md-6" runat="server" >Bank Account No: </asp:Label>
                                                                         <asp:Label CssClass="col-md-6" runat="server" id="bankAccountNoText"></asp:Label>
                                                                    </div>
                                                                    <div class="col-md-12 d-flex">
                                                                         <asp:Label CssClass="col-md-6" runat="server">Bank Account Title: </asp:Label>
                                                                         <asp:Label CssClass="col-md-6" runat="server" id="bankAccountTitleText"></asp:Label>
                                                                    </div>
                                                                    <div class="col-md-12 d-flex">
                                                                         <asp:Label CssClass="col-md-6" runat="server" >Bank Name: </asp:Label>
                                                                         <asp:Label CssClass="col-md-6" runat="server" id="bankNameText"></asp:Label>
                                                                    </div>
                                                                    <div class="col-md-12 d-flex">
                                                                        <asp:Label CssClass="col-md-6" runat="server">Branch Code: </asp:Label>
                                                                        <asp:Label CssClass="col-md-6" runat="server" id="branchCodeText"></asp:Label>
                                                                    </div>--%>
                                                                    <div class="col-md-8 d-flex">
                                                                        <asp:Button CssClass="btn btn-success" Text="Confirm" id="btnTransfer" OnClick="btnTransferClick"  runat="server" />
                                                                        <asp:Button CssClass="btn btn-danger" Text="Back" id="btnCancel" runat="server" />

                                                                    </div>
                                                                </div>
                                                            </div>
                                                          
                                                       </div>

                                                           </div>
                                                   </div>
                                               </div>
                                           </div>
                                        </div>
                                        <!--end of div-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </div>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Control sidebar content goes here -->
            </aside>
            <!-- /.control-sidebar -->

            <!-- Main Footer -->
            <footer class="main-footer">
                <strong>Copyright &copy; 2022 <a href="#"></a></strong>
                All rights reserved.
    
            </footer>
        </div>
    </form>
    <script src="plugins/jquery/jquery.min.js"></script>
    <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="dist/js/adminlte.js"></script>
    <script src="dist/js/jquery.dataTables.min.js"></script>

    <script src="dist/js/dataTables.responsive.min.js"></script>
    <script src="dist/js/dataTables.fixedHeader.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>
    <script>
        $("#btndownloadPDF").on("click", function () {
            $('#BtnEdit').css('display', 'none');
            $('#BtnBack').css('display', 'none');
            $('#btndownloadPDF').css('display', 'none');
            try {
                let doc = new jsPDF('p', 'pt', [1500.32, 1104.09]);
                var options = {
                    pagesplit: true
                };
                doc.addHTML($("#pdf").first(), options, function () {
                    doc.save('Account Detail.pdf');
                });
            }
            catch (err) {
                console.log(err);
            }
            
            
        });
    </script>
    
    <script type="text/javascript">

        $('#btnPush').on('click', function () {
            $('.sidebar').removeClass('sidebar');
        })

    </script>
   
</body>
</html>
