<%
    response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
    String name = "", guid = "", email = "";
    if (session.getAttribute("guid") == null) {
        response.sendRedirect("../index.html");
    } else {
        name = session.getAttribute("name").toString();
        guid = session.getAttribute("guid").toString();
        email = session.getAttribute("email").toString();
    }
%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" type="image/png" sizes="16x16" href="../plugins/images/favicon.png">
        <title>Ample Admin </title>
        <!-- Bootstrap Core CSS -->
        <link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Menu CSS -->
        <link href="../plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
        <!-- chartist CSS -->
        <link href="../plugins/bower_components/chartist-js/dist/chartist.min.css" rel="stylesheet">
        <link href="../plugins/bower_components/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.css" rel="stylesheet">
        <!-- animation CSS -->
        <link href="css/animate.css" rel="stylesheet">
        <!-- morris CSS -->
        <link href="../plugins/bower_components/morrisjs/morris.css" rel="stylesheet">
        <!--Gauge chart CSS -->
        <link href="../plugins/bower_components/Minimal-Gauge-chart/css/cmGauge.css" rel="stylesheet" type="text/css" />
        <!-- Custom CSS -->
        <link href="css/style.css" rel="stylesheet">
        <!-- color CSS -->
        <link href="css/colors/megna-dark.css" id="theme" rel="stylesheet">
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    </head>    

    <body class="fix-header">
        <!-- ============================================================== -->
        <!-- Preloader -->
        <!-- ============================================================== -->
        <div class="preloader">
            <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10"/>
            </svg>
        </div>
        <!-- ============================================================== -->
        <!-- Wrapper -->
        <!-- ============================================================== -->
        <div id="wrapper">
            <!-- ============================================================== -->
            <!-- Topbar header - style you can find in pages.scss -->
            <!-- ============================================================== -->
            <nav class="navbar navbar-default navbar-static-top m-b-0">
                <div class="navbar-header">
                    <div class="top-left-part">
                        <!-- Logo -->
                        <a class="logo" href="index.html">
                            <!-- Logo icon image, you can use font-icon also --><b>
                                <!--This is dark logo icon--><img src="../plugins/images/admin-logo.png" alt="home" class="dark-logo" /><!--This is light logo icon--><img src="../plugins/images/admin-logo-dark.png" alt="home" class="light-logo" />
                            </b>
                            <!-- Logo text image you can use text also --><span class="hidden-xs">
                                <!--This is dark logo text--><img src="../plugins/images/admin-text.png" alt="home" class="dark-logo" /><!--This is light logo text--><img src="../plugins/images/admin-text-dark.png" alt="home" class="light-logo" />
                            </span> </a>
                    </div>
                    <!-- /Logo -->
                    <!-- Search input and Toggle icon -->
                    <ul class="nav navbar-top-links navbar-left">
                        <li><a href="javascript:void(0)" class="open-close waves-effect waves-light visible-xs"><i class="ti-close ti-menu"></i></a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle waves-effect waves-light" data-toggle="dropdown" href="javascript:void(0)"> <i class="mdi mdi-gmail"></i>
                                <div class="notify"> <span class="heartbit"></span> <span class="point"></span> </div>
                            </a>
                            <ul class="dropdown-menu mailbox animated bounceInDown">
                                <li>
                                    <div class="drop-title">You have 4 new messages</div>
                                </li>
                                <li>
                                    <div class="message-center">
                                        <a href="javascript:void(0)">
                                            <div class="user-img"> <img src="../plugins/images/users/pawandeep.jpg" alt="user" class="img-circle"> <span class="profile-status online pull-right"></span> </div>
                                            <div class="mail-contnet">
                                                <h5>Pavan kumar</h5> <span class="mail-desc">Just see the my admin!</span> <span class="time">9:30 AM</span> </div>
                                        </a>
                                        <a href="javascript:void(0)">
                                            <div class="user-img"> <img src="../plugins/images/users/sonu.jpg" alt="user" class="img-circle"> <span class="profile-status busy pull-right"></span> </div>
                                            <div class="mail-contnet">
                                                <h5>Sonu Nigam</h5> <span class="mail-desc">I've sung a song! See you at</span> <span class="time">9:10 AM</span> </div>
                                        </a>
                                        <a href="javascript:void(0)">
                                            <div class="user-img"> <img src="../plugins/images/users/arijit.jpg" alt="user" class="img-circle"> <span class="profile-status away pull-right"></span> </div>
                                            <div class="mail-contnet">
                                                <h5>Arijit Sinh</h5> <span class="mail-desc">I am a singer!</span> <span class="time">9:08 AM</span> </div>
                                        </a>
                                        <a href="javascript:void(0)">
                                            <div class="user-img"> <img src="../plugins/images/users/pawandeep.jpg" alt="user" class="img-circle"> <span class="profile-status offline pull-right"></span> </div>
                                            <div class="mail-contnet">
                                                <h5>Pavan kumar</h5> <span class="mail-desc">Just see the my admin!</span> <span class="time">9:02 AM</span> </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <a class="text-center" href="javascript:void(0);"> <strong>See all notifications</strong> <i class="fa fa-angle-right"></i> </a>
                                </li>
                            </ul>
                            <!-- /.dropdown-messages -->
                        </li>
                        <!-- .Task dropdown -->
                        <li class="dropdown">
                            <a class="dropdown-toggle waves-effect waves-light" data-toggle="dropdown" href="javascript:void(0)"> <i class="mdi mdi-check-circle"></i>
                                <div class="notify"><span class="heartbit"></span><span class="point"></span></div>
                            </a>
                            <ul class="dropdown-menu dropdown-tasks animated slideInUp">
                                <li>
                                    <a href="javascript:void(0)">
                                        <div>
                                            <p> <strong>Task 1</strong> <span class="pull-right text-muted">40% Complete</span> </p>
                                            <div class="progress progress-striped active">
                                                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%"> <span class="sr-only">40% Complete (success)</span> </div>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="javascript:void(0)">
                                        <div>
                                            <p> <strong>Task 2</strong> <span class="pull-right text-muted">20% Complete</span> </p>
                                            <div class="progress progress-striped active">
                                                <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%"> <span class="sr-only">20% Complete</span> </div>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="javascript:void(0)">
                                        <div>
                                            <p> <strong>Task 3</strong> <span class="pull-right text-muted">60% Complete</span> </p>
                                            <div class="progress progress-striped active">
                                                <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%"> <span class="sr-only">60% Complete (warning)</span> </div>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="javascript:void(0)">
                                        <div>
                                            <p> <strong>Task 4</strong> <span class="pull-right text-muted">80% Complete</span> </p>
                                            <div class="progress progress-striped active">
                                                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%"> <span class="sr-only">80% Complete (danger)</span> </div>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a class="text-center" href="javascript:void(0)"> <strong>See All Tasks</strong> <i class="fa fa-angle-right"></i> </a>
                                </li>
                            </ul>
                        </li>
                        <!-- .Megamenu -->
                        <li class="mega-dropdown"> <a class="dropdown-toggle waves-effect waves-light" data-toggle="dropdown" href="javascript:void(0)"><span class="hidden-xs">Mega</span> <i class="icon-options-vertical"></i></a>
                            <ul class="dropdown-menu mega-dropdown-menu animated bounceInDown">
                                <li class="col-sm-3">
                                    <ul>
                                        <li class="dropdown-header">Forms Elements</li>
                                        <li><a href="form-basic.html">Basic Forms</a></li>
                                        <li><a href="form-layout.html">Form Layout</a></li>
                                        <li><a href="form-advanced.html">Form Addons</a></li>
                                        <li><a href="form-material-elements.html">Form Material</a></li>
                                        <li><a href="form-float-input.html">Form Float Input</a></li>
                                        <li><a href="form-upload.html">File Upload</a></li>
                                        <li><a href="form-mask.html">Form Mask</a></li>
                                        <li><a href="form-img-cropper.html">Image Cropping</a></li>
                                        <li><a href="form-validation.html">Form Validation</a></li>
                                    </ul>
                                </li>
                                <li class="col-sm-3">
                                    <ul>
                                        <li class="dropdown-header">Advance Forms</li>
                                        <li><a href="form-dropzone.html">File Dropzone</a></li>
                                        <li><a href="form-pickers.html">Form-pickers</a></li>
                                        <li><a href="form-wizard.html">Form-wizards</a></li>
                                        <li><a href="form-typehead.html">Typehead</a></li>
                                        <li><a href="form-xeditable.html">X-editable</a></li>
                                        <li><a href="form-summernote.html">Summernote</a></li>
                                        <li><a href="form-bootstrap-wysihtml5.html">Bootstrap wysihtml5</a></li>
                                        <li><a href="form-tinymce-wysihtml5.html">Tinymce wysihtml5</a></li>
                                    </ul>
                                </li>
                                <li class="col-sm-3">
                                    <ul>
                                        <li class="dropdown-header">Table Example</li>
                                        <li><a href="basic-table.html">Basic Tables</a></li>
                                        <li><a href="table-layouts.html">Table Layouts</a></li>
                                        <li><a href="data-table.html">Data Table</a></li>
                                        <li><a href="bootstrap-tables.html">Bootstrap Tables</a></li>
                                        <li><a href="responsive-tables.html">Responsive Tables</a></li>
                                        <li><a href="editable-tables.html">Editable Tables</a></li>
                                        <li><a href="foo-tables.html">FooTables</a></li>
                                        <li><a href="jsgrid.html">JsGrid Tables</a></li>
                                    </ul>
                                </li>
                                <li class="col-sm-3">
                                    <ul>
                                        <li class="dropdown-header">Charts</li>
                                        <li> <a href="flot.html">Flot Charts</a> </li>
                                        <li><a href="morris-chart.html">Morris Chart</a></li>
                                        <li><a href="chart-js.html">Chart-js</a></li>
                                        <li><a href="peity-chart.html">Peity Charts</a></li>
                                        <li><a href="knob-chart.html">Knob Charts</a></li>
                                        <li><a href="sparkline-chart.html">Sparkline charts</a></li>
                                        <li><a href="extra-charts.html">Extra Charts</a></li>
                                    </ul>
                                </li>

                            </ul>
                        </li>
                        <!-- /.Megamenu -->
                    </ul>
                    <ul class="nav navbar-top-links navbar-right pull-right">
                        <li>
                            <form role="search" class="app-search hidden-sm hidden-xs m-r-10">
                                <input type="text" placeholder="Search..." class="form-control"> <a href="#"><i class="fa fa-search"></i></a> </form>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="javascript:void(0)"> <img src="../plugins/images/users/varun.jpg" alt="user-img" width="36" class="img-circle"><b class="hidden-xs"><%out.print(name);%></b><span class="caret"></span> </a>
                            <ul class="dropdown-menu dropdown-user animated flipInY">
                                <li>
                                    <div class="dw-user-box">
                                        <div class="u-img"><img src="../plugins/images/users/varun.jpg" alt="user" /></div>
                                        <div class="u-text"><h4><%out.print(name);%></h4><p class="text-muted"><%out.print(guid);%></p><a href="profile.html" class="btn btn-rounded btn-danger btn-sm">View Profile</a></div>
                                    </div>
                                </li>
                                <li role="separator" class="divider"></li>
                                <li><a href="javascript:void(0)"><i class="ti-user"></i> My Profile</a></li>
                                <li><a href="javascript:void(0)"><i class="ti-wallet"></i> My Balance</a></li>
                                <li><a href="javascript:void(0)"><i class="ti-email"></i> Inbox</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="javascript:void(0)"><i class="ti-settings"></i> Account Setting</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="ClientLogout"><i class="fa fa-power-off"></i> Logout</a></li>
                            </ul>
                            <!-- /.dropdown-user -->
                        </li>

                        <!-- /.dropdown -->
                    </ul>
                </div>
                <!-- /.navbar-header -->
                <!-- /.navbar-top-links -->
                <!-- /.navbar-static-side -->
            </nav>
            <!-- End Top Navigation -->
            <!-- ============================================================== -->
            <!-- Left Sidebar - style you can find in sidebar.scss  -->
            <!-- ============================================================== -->
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav">
                    <div class="sidebar-head">
                        <h3><span class="fa-fw open-close"><i class="ti-menu hidden-xs"></i><i class="ti-close visible-xs"></i></span> <span class="hide-menu">Navigation</span></h3> </div>
                    <ul class="nav" id="side-menu">
                        <li class="user-pro">
                            <a href="javascript:void(0)" class="waves-effect"><img src="../plugins/images/users/varun.jpg" alt="user-img" class="img-circle"> <span class="hide-menu"> Steve Gection<span class="fa arrow"></span></span>
                            </a>
                            <ul class="nav nav-second-level collapse" aria-expanded="false" style="height: 0px;">
                                <li><a href="javascript:void(0)"><i class="ti-user"></i> <span class="hide-menu">My Profile</span></a></li>
                                <li><a href="javascript:void(0)"><i class="ti-wallet"></i> <span class="hide-menu">My Balance</span></a></li>
                                <li><a href="javascript:void(0)"><i class="ti-email"></i> <span class="hide-menu">Inbox</span></a></li>
                                <li><a href="javascript:void(0)"><i class="ti-settings"></i> <span class="hide-menu">Account Setting</span></a></li>
                                <li><a href="javascript:void(0)"><i class="fa fa-power-off"></i> <span class="hide-menu">Logout</span></a></li>
                            </ul>
                        </li>
                        <li> <a href="javascript:void(0)" class="waves-effect active"><i class="mdi mdi-av-timer fa-fw" data-icon="v"></i> <span class="hide-menu"> Home <span class="fa arrow"></span> <span class="label label-rouded label-inverse pull-right">4</span></span></a>

                        </li>
                        <li> <a href="javascript:void(0)" class="waves-effect "><i class="mdi mdi-content-copy fa-fw"></i> <span class="hide-menu">Pages<span class="fa arrow"></span><span class="label label-rouded label-warning pull-right">30</span></span></a>
                        </li>
                        <li class="mega-nav"> <a href="javascript:void(0)" class="waves-effect"><i class="mdi mdi-format-color-fill fa-fw"></i> <span class="hide-menu">UI<span class="fa arrow"></span> <span class="label label-rouded label-info pull-right">20</span> </span></a>

                        </li>
                        <li class="devider"></li>
                        <li> <a href="javascript:void(0)" class="waves-effect"><i class="mdi mdi-clipboard-text fa-fw"></i> <span class="hide-menu">Forms<span class="fa arrow"></span></span></a>

                        </li>
                        <li> <a href="javascript:void(0)" class="waves-effect"><i class="mdi mdi-table fa-fw"></i> <span class="hide-menu">Tables<span class="fa arrow"></span><span class="label label-rouded label-danger pull-right">9</span></span></a>

                        </li>
                        <li class="last-nav"><a href="javascript:void(0)" class="waves-effect"><i class="mdi mdi-apps fa-fw"></i> <span class="hide-menu">Apps<span class="fa arrow"></span></span></a>
                        </li>

                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Left Sidebar -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Page Content -->
            <!-- ============================================================== -->
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row bg-title">
                        <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                            <h4 class="page-title">Welcome on board.</h4> </div>     
                        <div class="col-lg-2 col-sm-2 col-md-2 col-xs-12" id="otp"></div>
                        <div class="col-lg-7 col-sm-6 col-md-6 col-xs-12"> 
                            <button class="right-side-toggle waves-effect waves-light btn-info btn-circle pull-right m-l-20"><i class="ti-settings text-white"></i></button>
                            <a href="CryptexEntry" target="_blank" class="btn btn-danger pull-right m-l-20 hidden-xs hidden-sm waves-effect waves-light">&nbsp;&nbsp;&nbsp;Cryptex&nbsp;&nbsp;&nbsp;</a>

                        </div>
                        <!-- /.col-lg-12 -->
                    </div>



                    <!-- ============================================================== -->
                    <!-- Sales, finance & Expance widgets -->
                    <!-- ============================================================== -->
                    <!-- .row -->
                    <div class="row">
                        <div class="col-md-12 col-lg-6">
                            <div class="white-box bg-theme-alt m-b-0">
                                <h3 class="box-title text-white">Expence</h3>
                                <div class="demo-container" style="height:140px;">
                                    <div id="placeholder" class="demo-placeholder"></div>
                                </div>
                            </div>
                            <div class="white-box p-b-0">
                                <div class="row">
                                    <div class="col-xs-8">
                                        <h2 class="font-medium m-t-0">$458.50</h2>
                                        <h5 class="text-muted m-t-0">Expence for December 1 to 10</h5></div>
                                    <div class="col-xs-4">
                                        <div class="circle-md pull-right circle bg-info"><i class="ti-plus"></i></div>
                                    </div>
                                </div>
                                <div class="row m-t-30 minus-margin">
                                    <div class="col-sm-12 col-sm-6 b-t b-r">
                                        <ul class="expense-box">
                                            <li><i class="ti-headphone-alt text-info"></i><span><h2>$250</h2><h4>Entertainment</h4></span></li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-12 col-sm-6  b-t">
                                        <ul class="expense-box">
                                            <li><i class="ti-home text-info"></i><span><h2>$60.50</h2><h4>House Rent</h4></span></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="row minus-margin">
                                    <div class="col-sm-12 col-sm-6  b-t b-r">
                                        <ul class="expense-box">
                                            <li><i class="fa fa-paper-plane-o text-info"></i><span><h2>$28</h2><h4>Travel</h4></span></li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-12 col-sm-6  b-t">
                                        <ul class="expense-box">
                                            <li><i class="ti-shopping-cart text-info"></i><span><h2>$70</h2><h4>Shopping</h4></span></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- col-md-3 -->
                        <div class="col-md-6 col-lg-3">
                            <div class="white-box">
                                <h3 class="box-title">Sales</h3>
                                <div id="morris-donut-chart" style="height:318px; padding-top: 50px;"></div>
                                <div class="row p-t-30">
                                    <div class="col-xs-8 p-t-30">
                                        <h3 class="font-medium">TOTAL SALES</h3>
                                        <h5 class="text-muted m-t-0">160 sales monthly</h5></div>
                                    <div class="col-xs-4 p-t-30">
                                        <div class="circle-md pull-right circle bg-info"><i class="ti-shopping-cart"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- col-md-3 -->
                        <div class="col-md-6 col-lg-3">
                            <div class="white-box">
                                <h3 class="box-title">Finance</h3>
                                <div id="diagram"></div>
                                <div class="get">
                                    <div class="arc"> <span class="text">Aug</span>
                                        <input type="hidden" class="percent" value="95" />
                                        <input type="hidden" class="color" value="#53e69d" /> </div>
                                    <div class="arc"> <span class="text">Sep</span>
                                        <input type="hidden" class="percent" value="90" />
                                        <input type="hidden" class="color" value="#ff7676" /> </div>
                                    <div class="arc"> <span class="text">Oct</span>
                                        <input type="hidden" class="percent" value="80" />
                                        <input type="hidden" class="color" value="#88B8E6" /> </div>
                                    <div class="arc"> <span class="text">Nov</span>
                                        <input type="hidden" class="percent" value="53" />
                                        <input type="hidden" class="color" value="#BEDBE9" /> </div>
                                    <div class="arc"> <span class="text">Dec</span>
                                        <input type="hidden" class="percent" value="45" />
                                        <input type="hidden" class="color" value="#EDEBEE" /> </div>
                                </div>
                                <div class="row p-t-30">
                                    <div class="col-xs-8">
                                        <h1 class="font-medium m-t-0">56%</h1>
                                        <h5 class="text-muted m-t-0">increase in Nov</h5></div>
                                    <div class="col-xs-4">
                                        <div class="circle-md pull-right circle bg-success"><i class="ti-stats-up"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- col-md-3 -->

                    </div>
                    <!-- /.row -->
                    <!-- ============================================================== -->
                    <!-- Sales different chart widgets -->
                    <!-- ============================================================== -->
                    <!-- .row -->
                    <div class="row">
                        <div class="col-md-12 col-lg-6 col-sm-12">
                            <div class="white-box">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <h2 class="m-b-0 font-medium">4567</h2>
                                        <h5 class="text-muted m-t-0">Yearly Sales</h5></div>
                                    <div class="col-sm-8">
                                        <div id="ct-main-bal" style="height: 70px"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-lg-3">
                            <div class="white-box">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <h2 class="m-b-0 font-medium">$354.50</h2>
                                        <h5 class="text-muted m-t-0">Total Income</h5></div>
                                    <div class="col-sm-6">
                                        <div id="ct-bar-chart" class="pull-right"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-lg-3">
                            <div class="white-box">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <h2 class="m-b-0 font-medium">356</h2>
                                        <h5 class="text-muted m-t-0">Monthly Sales</h5></div>
                                    <div class="col-sm-6">
                                        <div id="ct-extra" style="height: 70px" class="pull-right"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /.row -->
                    <!-- ============================================================== -->
                    <!-- Sales, weather & calander widgets -->
                    <!-- ============================================================== -->
                    <!-- .row -->
                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-lg-3">
                            <div class="white-box">
                                <h3 class="box-title m-b-0">WEEKLY USAGE</h3>
                                <h1 class="m-b-30 m-t-0 font-medium">$58.50</h1>
                                <div class="m-t-20 m-b-20  p-t-10"></div>
                                <ul class="dp-table m-t-30">
                                    <li>
                                        <div class="progress progress-md progress-vertical-bottom m-0">
                                            <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="88" aria-valuemin="0" aria-valuemax="100" style="height:30%;"> <span class="sr-only">88% Complete</span> </div>
                                        </div>
                                        <br/> <b>S</b> </li>
                                    <li>
                                        <div class="progress progress-md progress-vertical-bottom m-0">
                                            <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="88" aria-valuemin="0" aria-valuemax="100" style="height:60%;"> <span class="sr-only">88% Complete</span> </div>
                                        </div>
                                        <br/> <b>M</b> </li>
                                    <li>
                                        <div class="progress progress-md progress-vertical-bottom m-0">
                                            <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="88" aria-valuemin="0" aria-valuemax="100" style="height:80%;"> <span class="sr-only">88% Complete</span> </div>
                                        </div>
                                        <br/> <b>T</b> </li>
                                    <li>
                                        <div class="progress progress-md progress-vertical-bottom m-0">
                                            <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="88" aria-valuemin="0" aria-valuemax="100" style="height:30%;"> <span class="sr-only">88% Complete</span> </div>
                                        </div>
                                        <br/> <b>W</b> </li>
                                    <li>
                                        <div class="progress progress-md progress-vertical-bottom m-0">
                                            <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="88" aria-valuemin="0" aria-valuemax="100" style="height:40%;"> <span class="sr-only">88% Complete</span> </div>
                                        </div>
                                        <br/> <b>T</b> </li>
                                    <li>
                                        <div class="progress progress-md progress-vertical-bottom m-0">
                                            <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="88" aria-valuemin="0" aria-valuemax="100" style="height:20%;"> <span class="sr-only">88% Complete</span> </div>
                                        </div>
                                        <br/> <b>F</b> </li>
                                    <li>
                                        <div class="progress progress-md progress-vertical-bottom m-0">
                                            <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="88" aria-valuemin="0" aria-valuemax="100" style="height:50%;"> <span class="sr-only">88% Complete</span> </div>
                                        </div>
                                        <br/> <b>S</b> </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-lg-3">
                            <div class="mt-gauge text-center p-t-30">
                                <div id="gaugeDemo" class="gauge gauge-big gauge-red">
                                    <div class="gauge-arrow" data-percentage="40" style="transform: rotate(0deg);"> </div>
                                </div>
                            </div>
                            <div class="panel p-t-30">
                                <div class="panel-footer p-t-30">
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <h1 class="m-b-0 m-t-0 font-medium">26.30</h1>
                                            <h4 class="m-t-0">AMps Used</h4> </div>
                                        <div class="col-xs-6">
                                            <button type="button" class="btn mtbutton btn-info btn-circle btn-xl pull-right"><i class="icon-speedometer"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-6 col-sm-12">
                            <div class="calendar-widget m-b-30">
                                <div class="cal-left">
                                    <h1>23</h1>
                                    <h4>Thursday</h4> <span></span>
                                    <h5>March 2017</h5>
                                    <div class="cal-btm-text"> <a href="#">3 TASKS</a>
                                        <h5>Prepare project</h5> </div>
                                </div>
                                <div class="cal-right bg-theme">
                                    <table class="cal-table">
                                        <tbody>
                                            <tr>
                                                <td colspan="5">
                                                    <h1>March</h1></td>
                                                <td></td>
                                                <td><a href="#" class="cal-add"><i class="ti-plus"></i></a></td>
                                            </tr>
                                            <tr>
                                                <td>SUN</td>
                                                <td>MON</td>
                                                <td>TUE</td>
                                                <td>WED</td>
                                                <td>THU</td>
                                                <td>FRI</td>
                                                <td>SAT</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>1</td>
                                                <td>2</td>
                                                <td>3</td>
                                                <td>4</td>
                                                <td>5</td>
                                                <td>6</td>
                                            </tr>
                                            <tr>
                                                <td>7</td>
                                                <td>8</td>
                                                <td>9</td>
                                                <td>10</td>
                                                <td>11</td>
                                                <td>12</td>
                                                <td>13</td>
                                            </tr>
                                            <tr>
                                                <td>14</td>
                                                <td>15</td>
                                                <td>16</td>
                                                <td>17</td>
                                                <td>18</td>
                                                <td>19</td>
                                                <td>20</td>
                                            </tr>
                                            <tr>
                                                <td>21</td>
                                                <td>22</td>
                                                <td class="cal-active">23</td>
                                                <td>24</td>
                                                <td>25</td>
                                                <td>26</td>
                                                <td>27</td>
                                            </tr>
                                            <tr>
                                                <td>28</td>
                                                <td>29</td>
                                                <td>30</td>
                                                <td>31</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td colspan="7"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.row -->
                    <!-- ============================================================== -->
                    <!-- Recent comment, table & feed widgets -->
                    <!-- ============================================================== -->
                    <div class="row">

                        <div class="col-md-12 col-lg-6 col-sm-12">
                            <div class="white-box">
                                <h3 class="box-title">Recent Comments</h3>
                                <div class="comment-center p-t-10">
                                    <div class="comment-body">
                                        <div class="user-img"> <img src="../plugins/images/users/pawandeep.jpg" alt="user" class="img-circle"></div>
                                        <div class="mail-contnet">
                                            <h5>Pavan kumar</h5><span class="time">10:20 AM   20  may 2016</span> <span class="label label-rouded label-info">PENDING</span>
                                            <br/><span class="mail-desc">Donec ac condimentum massa. Etiam pellentesque pretium lacus. Phasellus ultricies dictum suscipit. Aenean commodo dui pellentesque molestie feugiat. Aenean commodo dui pellentesque molestie feugiat</span> <a href="javacript:void(0)" class="btn btn btn-rounded btn-default btn-outline m-r-5"><i class="ti-check text-success m-r-5"></i>Approve</a><a href="javacript:void(0)" class="btn-rounded btn btn-default btn-outline"><i class="ti-close text-danger m-r-5"></i> Reject</a> </div>
                                    </div>
                                    <div class="comment-body">
                                        <div class="user-img"> <img src="../plugins/images/users/sonu.jpg" alt="user" class="img-circle"> </div>
                                        <div class="mail-contnet">
                                            <h5>Sonu Nigam</h5><span class="time">10:20 AM   20  may 2016</span> <span class="label label-rouded label-success">APPROVED</span>
                                            <br/><span class="mail-desc">Donec ac condimentum massa. Etiam pellentesque pretium lacus. Phasellus ultricies dictum suscipit. Aenean commodo dui pellentesque molestie feugiat. Aenean commodo dui pellentesque molestie feugiat</span> </div>
                                    </div>
                                    <div class="comment-body b-none">
                                        <div class="user-img"> <img src="../plugins/images/users/arijit.jpg" alt="user" class="img-circle"> </div>
                                        <div class="mail-contnet">
                                            <h5>Arijit singh</h5><span class="time">10:20 AM   20  may 2016</span> <span class="label label-rouded label-danger">REJECTED</span>
                                            <br/><span class="mail-desc">Donec ac condimentum massa. Etiam pellentesque pretium lacus. Phasellus ultricies dictum suscipit. Aenean commodo dui pellentesque molestie feugiat. Aenean commodo dui pellentesque molestie feugiat</span> </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 col-lg-6 col-sm-12">
                            <div class="white-box">
                                <h3 class="box-title">Recent sales
                                    <div class="col-md-3 col-sm-4 col-xs-6 pull-right">
                                        <select class="form-control pull-right row b-none">
                                            <option>March 2017</option>
                                            <option>April 2017</option>
                                            <option>May 2017</option>
                                            <option>June 2017</option>
                                            <option>July 2017</option>
                                        </select>
                                    </div>
                                </h3>
                                <div class="row sales-report">
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <h2>March 2017</h2>
                                        <p>SALES REPORT</p>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-6 ">
                                        <h1 class="text-right text-info m-t-20">$3,690</h1> </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>NAME</th>
                                                <th>STATUS</th>
                                                <th>DATE</th>
                                                <th>PRICE</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td class="txt-oflo">Elite admin</td>
                                                <td><span class="label label-success label-rouded">SALE</span> </td>
                                                <td class="txt-oflo">April 18, 2017</td>
                                                <td><span class="text-success">$24</span></td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td class="txt-oflo">Real Homes WP Theme</td>
                                                <td><span class="label label-info label-rouded">EXTENDED</span></td>
                                                <td class="txt-oflo">April 19, 2017</td>
                                                <td><span class="text-info">$1250</span></td>
                                            </tr>

                                            <tr>
                                                <td>3</td>
                                                <td class="txt-oflo">Ample Admin</td>
                                                <td><span class="label label-info label-rouded">EXTENDED</span></td>
                                                <td class="txt-oflo">April 19, 2017</td>
                                                <td><span class="text-info">$1250</span></td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td class="txt-oflo">Medical Pro WP Theme</td>
                                                <td><span class="label label-danger label-rouded">TAX</span></td>
                                                <td class="txt-oflo">April 20, 2017</td>
                                                <td><span class="text-danger">-$24</span></td>
                                            </tr>
                                            <tr>
                                                <td>5</td>
                                                <td class="txt-oflo">Hosting press html</td>
                                                <td><span class="label label-warning label-rouded">SALE</span></td>
                                                <td class="txt-oflo">April 21, 2017</td>
                                                <td><span class="text-success">$24</span></td>
                                            </tr>

                                            <tr>
                                                <td>6</td>
                                                <td class="txt-oflo">Digital Agency PSD</td>
                                                <td><span class="label label-success label-rouded">SALE</span> </td>
                                                <td class="txt-oflo">April 23, 2017</td>
                                                <td><span class="text-danger">-$14</span></td>
                                            </tr>
                                            <tr>
                                                <td>7</td>
                                                <td class="txt-oflo">Helping Hands WP Theme</td>
                                                <td><span class="label label-warning label-rouded">member</span></td>
                                                <td class="txt-oflo">April 22, 2017</td>
                                                <td><span class="text-success">$64</span></td>
                                            </tr>
                                        </tbody>
                                    </table>  </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- Profile, & inbox widgets -->
                    <!-- ============================================================== -->
                    <!-- .row -->
                    <div class="row">
                        <div class="col-md-6 col-sm-12 col-lg-4">
                            <div class="panel">
                                <div class="p-30">
                                    <div class="row">
                                        <div class="col-xs-4"><img src="../plugins/images/users/varun.jpg" alt="varun" class="img-circle img-responsive"></div>
                                        <div class="col-xs-8">
                                            <h2 class="m-b-0">Daniel Kristeen</h2>
                                            <h4 class="m-t-0">UIUX Designer</h4><a href="javascript:void(0)" class="btn btn-rounded btn-success"><i class="ti-plus m-r-5"></i> FOLLOW</a></div>
                                    </div>
                                    <div class="row text-center m-t-30">
                                        <div class="col-xs-4 b-r">
                                            <h2>14</h2>
                                            <h4>PHOTOS</h4></div>
                                        <div class="col-xs-4 b-r">
                                            <h2>54</h2>
                                            <h4>VIDEOS</h4></div>
                                        <div class="col-xs-4">
                                            <h2>145</h2>
                                            <h4>TASKS</h4></div>
                                    </div>
                                </div>
                                <hr class="m-t-10" />
                                <div class="p-20 text-center">
                                    <p class="">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore adgadg et dolore </p>
                                    <hr>
                                    <h4 class="m-t-30 font-medium">Followers</h4>
                                    <ul class="dp-table m-t-30">
                                        <li><img src="../plugins/images/users/varun.jpg" alt="varun" width="60" data-toggle="tooltip" title="Varun Dhavan" class="img-circle"></li>
                                        <li><img src="../plugins/images/users/genu.jpg" alt="varun" width="60" data-toggle="tooltip" title="Varun Dhavan" class="img-circle"></li>
                                        <li><img src="../plugins/images/users/pawandeep.jpg" alt="varun" width="60" data-toggle="tooltip" title="Varun Dhavan" class="img-circle"></li>
                                        <li><a href="#" class="circle circle-md bg-info di" data-toggle="tooltip" title="More">5+</a></li>
                                    </ul>
                                </div>
                                <hr>
                                <ul class="dp-table profile-social-icons">
                                    <li><a href="javascript:void(0)"><i class="fa fa-globe"></i></a></li>
                                    <li><a href="javascript:void(0)"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="javascript:void(0)"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="javascript:void(0)"><i class="fa fa-youtube"></i></a></li>
                                    <li><a href="javascript:void(0)"><i class="fa fa-linkedin"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-8 col-sm-12">
                            <div class="white-box bg-theme m-b-0 p-b-0 mailbox-widget">
                                <h2 class="text-white p-b-20">Your Mailbox</h2>
                                <ul class="nav customtab nav-tabs" role="tablist">
                                    <li role="presentation" class="active"><a href="#home1" aria-controls="home" role="tab" data-toggle="tab" aria-expanded="true"><span class="visible-xs"><i class="ti-email"></i></span><span class="hidden-xs"> INBOX</span></a></li>
                                    <li role="presentation" class=""><a href="#profile1" aria-controls="profile" role="tab" data-toggle="tab" aria-expanded="false"><span class="visible-xs"><i class="ti-export"></i></span> <span class="hidden-xs">SENT</span></a></li>
                                    <li role="presentation" class=""><a href="#messages1" aria-controls="messages" role="tab" data-toggle="tab" aria-expanded="false"><span class="visible-xs"><i class="ti-panel"></i></span> <span class="hidden-xs">SPAM</span></a></li>
                                    <li role="presentation" class=""><a href="#settings1" aria-controls="settings" role="tab" data-toggle="tab" aria-expanded="false"><span class="visible-xs"><i class="ti-trash"></i></span> <span class="hidden-xs">DELETED</span></a></li>
                                </ul>
                            </div>
                            <div class="white-box p-0">
                                <div class="tab-content m-t-0">
                                    <div role="tabpanel" class="tab-pane fade active in" id="home1">
                                        <div class="p-30">
                                            <ul class="side-icon-text pull-right">
                                                <li><a href="javascript:void(0)"><span class="circle circle-sm bg-success di"><i class="ti-plus"></i></span><span>Compose</span></a></li>
                                                <li><a href="javascript:void(0)"><span class="circle circle-sm bg-danger di"><i class="ti-trash"></i></span><span>Delete</span></a></li>
                                            </ul>
                                            <h3><i class="ti-email"></i>  350 Unread emails</h3> </div>
                                        <div class="inbox-center table-responsive">
                                            <table class="table table-hover">
                                                <tbody>
                                                    <tr class="unread">
                                                        <td>&nbsp;</td>
                                                        <td width="50">
                                                            <div class="checkbox checkbox-info m-t-0 m-b-0">
                                                                <input type="checkbox">
                                                                <label for="checkbox0"></label>
                                                            </div>
                                                        </td>
                                                        <td class="hidden-xs" width="50"><i class="fa fa-star-o"></i></td>
                                                        <td class="hidden-xs">Hritik Roshan</td>
                                                        <td class="max-texts"> <a href="inbox-detail.html"><span class="label label-info m-r-10">Work</span> Lorem ipsum perspiciatis unde omnis iste</a></td>
                                                        <td class="hidden-xs"><i class="fa fa-paperclip"></i></td>
                                                        <td class="text-right"> May 13 </td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr class="unread">
                                                        <td>&nbsp;</td>
                                                        <td>
                                                            <div class="checkbox checkbox-info m-t-0 m-b-0">
                                                                <input type="checkbox">
                                                                <label for="checkbox0"></label>
                                                            </div>
                                                        </td>
                                                        <td class="hidden-xs"><i class="fa fa-star text-warning"></i></td>
                                                        <td class="hidden-xs">Genelia Roshan</td>
                                                        <td class="max-texts"><a href="inbox-detail.html">Lorem ipsum perspiciatis unde omnis iste</a></td>
                                                        <td class="hidden-xs"><i class="fa fa-paperclip"></i></td>
                                                        <td class="text-right"> May 13 </td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>
                                                            <div class="checkbox checkbox-info m-t-0 m-b-0">
                                                                <input type="checkbox">
                                                                <label for="checkbox0"></label>
                                                            </div>
                                                        </td>
                                                        <td class="hidden-xs"><i class="fa fa-star-o"></i></td>
                                                        <td class="hidden-xs">Akshay Kumar</td>
                                                        <td class="max-texts"><a href="inbox-detail.html"><span class="label label-warning">Work</span> Lorem ipsum perspiciatis unde</a></td>
                                                        <td class="hidden-xs"><i class="fa fa-paperclip"></i></td>
                                                        <td class="text-right"> May 12 </td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>
                                                            <div class="checkbox checkbox-info m-t-0 m-b-0">
                                                                <input type="checkbox">
                                                                <label for="checkbox0"></label>
                                                            </div>
                                                        </td>
                                                        <td class="hidden-xs"><i class="fa fa-star text-warning"></i></td>
                                                        <td class="hidden-xs">Genelia Roshan</td>
                                                        <td class="max-texts"><a href="inbox-detail.html">Lorem ipsum perspiciatis unde omnis iste</a></td>
                                                        <td class="hidden-xs"><i class="fa fa-paperclip"></i></td>
                                                        <td class="text-right"> May 11 </td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>
                                                            <div class="checkbox checkbox-info m-t-0 m-b-0">
                                                                <input type="checkbox">
                                                                <label for="checkbox0"></label>
                                                            </div>
                                                        </td>
                                                        <td class="hidden-xs"><i class="fa fa-star-o"></i></td>
                                                        <td class="hidden-xs">Ritesh Deshmh</td>
                                                        <td class="max-texts"><a href="inbox-detail.html"><span class="label label-success">Elite</span> Lorem ipsum perspiciatis unde omnis</a></td>
                                                        <td class="hidden-xs"></td>
                                                        <td class="text-right"> May 11 </td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>
                                                            <div class="checkbox checkbox-info m-t-0 m-b-0">
                                                                <input type="checkbox">
                                                                <label for="checkbox0"></label>
                                                            </div>
                                                        </td>
                                                        <td class="hidden-xs"><i class="fa fa-star-o"></i></td>
                                                        <td class="hidden-xs">Akshay Kumar</td>
                                                        <td class="max-texts"><a href="inbox-detail.html"><span class="label label-warning">Work</span> Lorem ipsum perspiciatis undeem</a></td>
                                                        <td class="hidden-xs"><i class="fa fa-paperclip"></i></td>
                                                        <td class="text-right"> May 11 </td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>
                                                            <div class="checkbox m-t-0 m-b-0">
                                                                <input type="checkbox">
                                                                <label for="checkbox0"></label>
                                                            </div>
                                                        </td>
                                                        <td class="hidden-xs"><i class="fa fa-star-o"></i></td>
                                                        <td class="hidden-xs">Hritik Roshan</td>
                                                        <td class="max-texts"><a href="inbox-detail.html"><span class="label label-info m-r-10">Work</span> Lorem ipsum perspiciatis undem</a></td>
                                                        <td class="hidden-xs"><i class="fa fa-paperclip"></i></td>
                                                        <td class="text-right"> May 10 </td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="profile1">
                                        <div class="col-md-6">
                                            <h3>Lets check profile</h3>
                                            <h4>you can use it with the small code</h4> </div>
                                        <div class="col-md-5 pull-right">
                                            <p>Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a.</p>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="messages1">
                                        <div class="col-md-6">
                                            <h3>Come on you have a lot message</h3>
                                            <h4>you can use it with the small code</h4> </div>
                                        <div class="col-md-5 pull-right">
                                            <p>Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a.</p>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="settings1">
                                        <div class="col-md-6">
                                            <h3>Just do Settings</h3>
                                            <h4>you can use it with the small code</h4> </div>
                                        <div class="col-md-5 pull-right">
                                            <p>Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a.</p>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.row -->
                    <!-- ============================================================== -->
                    <!-- To do list, & Feed widgets -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <div class="col-lg-6 col-sm-12 col-md-6">
                            <div class="panel">
                                <div class="p-20">
                                    <div class="row">
                                        <div class="col-xs-8">
                                            <h4 class="m-b-0">Total Earnings</h4>
                                            <h2 class="m-t-0 font-medium">$580.50</h2>
                                        </div>
                                        <div class="col-xs-4 p-20">
                                            <select class="form-control">
                                                <option>DEC</option>
                                                <option>JAN</option>
                                                <option>FEB</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-footer bg-extralight">
                                    <ul class="earning-box">
                                        <li>
                                            <div class="er-row">
                                                <div class="er-pic"><img src="../plugins/images/users/genu.jpg" alt="varun" width="60" class="img-circle"></div>
                                                <div class="er-text"><h3>Andrew Simon</h3><span class="text-muted">10-11-2016</span></div>
                                                <div class="er-count ">$<span class="counter">46</span></div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="er-row">
                                                <div class="er-pic"><img src="../plugins/images/users/govinda.jpg" alt="varun" width="60" class="img-circle"></div>
                                                <div class="er-text"><h3>Daniel Kristeen</h3><span class="text-muted">10-11-2016</span></div>
                                                <div class="er-count ">$<span class="counter">55</span></div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="er-row">
                                                <div class="er-pic"><img src="../plugins/images/users/hritik.jpg" alt="varun" width="60" class="img-circle"></div>
                                                <div class="er-text"><h3>Dany John</h3><span class="text-muted">10-11-2016</span></div>
                                                <div class="er-count ">$<span class="counter">72</span></div>
                                            </div>
                                        </li>

                                        <li>
                                            <div class="er-row">
                                                <div class="er-pic"><img src="../plugins/images/users/pawandeep.jpg" alt="varun" width="60" class="img-circle"></div>
                                                <div class="er-text"><h3>Chris gyle</h3><span class="text-muted">10-11-2016</span></div>
                                                <div class="er-count ">$<span class="counter">66</span></div>
                                            </div>
                                        </li>

                                        <li class="center">
                                            <a class="btn btn-rounded btn-danger btn-block p-10">Withdrow money</a>
                                        </li>
                                    </ul>
                                </div>    
                            </div> 
                        </div>
                        <div class="col-lg-6 col-sm-12 col-md-6">
                            <div class="white-box">
                                <h3 class="box-title">Feeds</h3>
                                <ul class="feeds">
                                    <li>
                                        <div class="bg-info"><i class="fa fa-bell-o text-white"></i></div> You have 4 pending tasks. <span class="text-muted">Just Now</span></li>
                                    <li>
                                        <div class="bg-success"><i class="ti-server text-white"></i></div> Server #1 overloaded.<span class="text-muted">2 Hours ago</span></li>
                                    <li>
                                        <div class="bg-warning"><i class="ti-shopping-cart text-white"></i></div> New order received.<span class="text-muted">31 May</span></li>
                                    <li>
                                        <div class="bg-danger"><i class="ti-user text-white"></i></div> New user registered.<span class="text-muted">30 May</span></li>
                                    <li>
                                        <div class="bg-inverse"><i class="fa fa-bell-o text-white"></i></div> New Version just arrived. <span class="text-muted">27 May</span></li>
                                    <li>
                                        <div class="bg-info"><i class="fa fa-bell-o text-white"></i></div> You have 4 pending tasks. <span class="text-muted">Just Now</span></li>

                                    <li>
                                        <div class="bg-danger"><i class="ti-user text-white"></i></div> New user registered.<span class="text-muted">30 May</span></li>
                                    <li>
                                        <div class="bg-inverse"><i class="fa fa-bell-o text-white"></i></div> New Version just arrived. <span class="text-muted">27 May</span></li>

                                    <li>
                                        <div class="bg-purple"><i class="ti-settings text-white"></i></div> You have 4 pending tasks. <span class="text-muted">27 May</span></li>
                                </ul>
                            </div>

                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- Right sidebar -->
                    <!-- ============================================================== -->
                    <!-- .right-sidebar -->
                    <div class="right-sidebar">
                        <div class="slimscrollright">
                            <div class="rpanel-title"> Service Panel <span><i class="ti-close right-side-toggle"></i></span> </div>
                            <div class="r-panel-body">
                                <ul id="themecolors" class="m-t-20">
                                    <li><b>With Light sidebar</b></li>
                                    <li><a href="javascript:void(0)" theme="default" class="default-theme">1</a></li>
                                    <li><a href="javascript:void(0)" theme="green" class="green-theme">2</a></li>
                                    <li><a href="javascript:void(0)" theme="gray" class="yellow-theme">3</a></li>
                                    <li><a href="javascript:void(0)" theme="blue" class="blue-theme">4</a></li>
                                    <li><a href="javascript:void(0)" theme="purple" class="purple-theme">5</a></li>
                                    <li><a href="javascript:void(0)" theme="megna" class="megna-theme">6</a></li>
                                    <li><b>With Dark sidebar</b></li>
                                    <br/>
                                    <li><a href="javascript:void(0)" theme="default-dark" class="default-dark-theme">7</a></li>
                                    <li><a href="javascript:void(0)" theme="green-dark" class="green-dark-theme">8</a></li>
                                    <li><a href="javascript:void(0)" theme="gray-dark" class="yellow-dark-theme">9</a></li>
                                    <li><a href="javascript:void(0)" theme="blue-dark" class="blue-dark-theme">10</a></li>
                                    <li><a href="javascript:void(0)" theme="purple-dark" class="purple-dark-theme">11</a></li>
                                    <li><a href="javascript:void(0)" theme="megna-dark" class="megna-dark-theme working">12</a></li>
                                </ul>
                                <ul class="m-t-20 all-demos">
                                    <li><b>Choose other demos</b></li>
                                </ul>
                                <ul class="m-t-20 chatonline">
                                    <li><b>Chat option</b></li>
                                    <li>
                                        <a href="javascript:void(0)"><img src="../plugins/images/users/varun.jpg" alt="user-img" class="img-circle"> <span>Varun Dhavan <small class="text-success">online</small></span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)"><img src="../plugins/images/users/genu.jpg" alt="user-img" class="img-circle"> <span>Genelia Deshmukh <small class="text-warning">Away</small></span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)"><img src="../plugins/images/users/ritesh.jpg" alt="user-img" class="img-circle"> <span>Ritesh Deshmukh <small class="text-danger">Busy</small></span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)"><img src="../plugins/images/users/arijit.jpg" alt="user-img" class="img-circle"> <span>Arijit Sinh <small class="text-muted">Offline</small></span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)"><img src="../plugins/images/users/govinda.jpg" alt="user-img" class="img-circle"> <span>Govinda Star <small class="text-success">online</small></span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)"><img src="../plugins/images/users/hritik.jpg" alt="user-img" class="img-circle"> <span>John Abraham<small class="text-success">online</small></span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)"><img src="../plugins/images/users/john.jpg" alt="user-img" class="img-circle"> <span>Hritik Roshan<small class="text-success">online</small></span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)"><img src="../plugins/images/users/pawandeep.jpg" alt="user-img" class="img-circle"> <span>Pwandeep rajan <small class="text-success">online</small></span></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- End Right sidebar -->
                    <!-- ============================================================== -->
                </div>
                <!-- /.container-fluid -->
                <footer class="footer text-center"> 2017 &copy; Ample Admin</footer>
            </div>
            <!-- /#page-wrapper -->
        </div>
        <!-- /#wrapper -->
        <!-- jQuery -->
        <script src="../plugins/bower_components/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- Menu Plugin JavaScript -->
        <script src="../plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
        <!--slimscroll JavaScript -->
        <script src="js/jquery.slimscroll.js"></script>

        <!--Wave Effects -->
        <script src="js/waves.js"></script>
        <!--Morris JavaScript -->
        <script src="../plugins/bower_components/raphael/raphael-min.js"></script>
        <script src="../plugins/bower_components/morrisjs/morris.js"></script>
        <!-- Flot Charts JavaScript -->
        <script src="../plugins/bower_components/flot/jquery.flot.js"></script>
        <script src="../plugins/bower_components/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
        <!-- Animated skill bar -->
        <script src="../plugins/bower_components/AnimatedSkillsDiagram/js/animated-bar.js"></script>

        <!-- chartist chart -->
        <script src="../plugins/bower_components/chartist-js/dist/chartist.min.js"></script>
        <script src="../plugins/bower_components/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.min.js"></script>
        <!-- Guage chart -->
        <script src="../plugins/bower_components/Minimal-Gauge-chart/js/cmGauge.js"></script>
        <!-- Custom Theme JavaScript -->
        <script src="js/custom.min.js"></script>
        <script src="js/dashboard2.js"></script>
        <!--Style Switcher -->
        <script src="../plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>
        <script>
            $(window).ready(function(){
                setInterval(function(){
                    $.post("http://localhost:8080/CryptexWebsite/GetOTP",
                    {
                        email: "<%out.print(email);%>",
                        guid: "<%out.print(guid);%>"
                    },
                    function(data, status){
                        if(data.length>0){
                            $("#otp").html("OTP : "+data);
                        }
                        else{
                            $("#otp").html(data);
                        }
                    });
                }, 5000);
            });
        </script>
    </body>

</html>