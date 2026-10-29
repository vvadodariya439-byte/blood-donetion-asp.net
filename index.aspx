<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="BloodBankSystem.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Blood Bank Management System – LifeFlow</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" href="assets/css/style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-danger sticky-top">
            <div class="container">
                <a class="navbar-brand d-flex align-items-center gap-2" href="index.aspx">
                    <i class="fas fa-droplet fa-lg" style="color:#ffd700"></i>
                    <div>
                        <div class="brand-text text-white font-weight-bold">LifeFlow</div>
                        <div class="brand-sub text-white-50 small">Blood Bank System</div>
                    </div>
                </a>
                <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="mainNav">
                    <ul class="navbar-nav ms-auto align-items-lg-center gap-2">
                        <li class="nav-item"><a class="nav-link text-white" href="#availability">Blood Stock</a></li>
                        <li class="nav-item"><a class="nav-link text-white" href="#camps">Upcoming Camps</a></li>
                        <li class="nav-item"><a class="nav-link text-white" href="#request">Blood Request</a></li>
                        <li class="nav-item ms-lg-3">
                            <asp:LinkButton ID="btnLogout" runat="server" CssClass="btn btn-outline-light btn-sm rounded-pill px-3" OnClick="btnLogout_Click">Logout</asp:LinkButton>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Hero Section -->
        <section class="hero-section text-white bg-dark py-5" style="background: linear-gradient(135deg, #c0392b, #8e44ad);">
            <div class="container py-4">
                <div class="row align-items-center">
                    <div class="col-lg-6">
                        <span class="badge bg-warning text-dark mb-3"><i class="fas fa-heart me-1"></i>Saving Lives Every Day</span>
                        <h1 class="display-4 fw-bold">Donate Blood,<br /><span>Save Lives</span></h1>
                        <p class="lead mt-3">Connecting donors, patients, and hospitals instantly. Find blood availability near you or register as a donor.</p>
                        <div class="d-flex gap-3 mt-4">
                            <a href="register.aspx" class="btn btn-warning btn-lg rounded-pill px-4 fw-bold"><i class="fas fa-user-plus me-2"></i>Become a Donor</a>
                            <a href="#request" class="btn btn-outline-light btn-lg rounded-pill px-4"><i class="fas fa-hand-holding-medical me-2"></i>Request Blood</a>
                        </div>
                    </div>
                    <div class="col-lg-6 text-center mt-4 mt-lg-0">
                        <div class="p-4 bg-white text-dark rounded shadow-lg">
                            <h4 class="fw-bold mb-3 text-danger"><i class="fas fa-search me-2"></i>Find Blood Availability</h4>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Select Blood Group</label>
                                <asp:DropDownList ID="drpbg" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="">-- All Blood Groups --</asp:ListItem>
                                    <asp:ListItem Value="A+">A+</asp:ListItem>
                                    <asp:ListItem Value="A-">A-</asp:ListItem>
                                    <asp:ListItem Value="B+">B+</asp:ListItem>
                                    <asp:ListItem Value="B-">B-</asp:ListItem>
                                    <asp:ListItem Value="AB+">AB+</asp:ListItem>
                                    <asp:ListItem Value="AB-">AB-</asp:ListItem>
                                    <asp:ListItem Value="O+">O+</asp:ListItem>
                                    <asp:ListItem Value="O-">O-</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <asp:Button ID="btnsearch" runat="server" Text="Search Stock" CssClass="btn btn-danger w-100 fw-bold" OnClick="btnsearch_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Blood Stock Availability Grid -->
        <section id="availability" class="py-5 bg-light">
            <div class="container">
                <h2 class="text-center fw-bold mb-4"><i class="fas fa-warehouse text-danger me-2"></i>Current Blood Inventory Stock</h2>
                <div class="table-responsive">
                    <center>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped text-center bg-white shadow-sm" Style="max-width: 800px;">
                            <HeaderStyle CssClass="table-danger" />
                            <Columns>
                                <asp:TemplateField HeaderText="Blood Group">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("BloodGroup") %>' Font-Bold="true" Font-Size="Medium"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Available Units">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Units") %>' CssClass="badge bg-success font-size-14" Font-Size="Medium"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Last Updated">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("LastUpdated", "{0:dd-MMM-yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </center>
                </div>
            </div>
        </section>

        <!-- Upcoming Camps -->
        <section id="camps" class="py-5">
            <div class="container">
                <h2 class="text-center fw-bold mb-4"><i class="fas fa-campground text-danger me-2"></i>Upcoming Blood Camps</h2>
                <div class="table-responsive">
                    <center>
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered bg-white shadow-sm" Style="max-width: 900px;">
                            <HeaderStyle CssClass="table-dark" />
                            <Columns>
                                <asp:TemplateField HeaderText="Camp Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblcname" runat="server" Text='<%# Eval("CampName") %>' Font-Bold="true"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Organizer">
                                    <ItemTemplate>
                                        <asp:Label ID="lblorg" runat="server" Text='<%# Eval("Organizer") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Location">
                                    <ItemTemplate>
                                        <asp:Label ID="lblloc" runat="server" Text='<%# Eval("Location") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date & Time">
                                    <ItemTemplate>
                                        <asp:Label ID="lbldt" runat="server" Text='<%# Eval("CampDate") + " (" + Eval("CampTime") + ")" %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </center>
                </div>
            </div>
        </section>

        <!-- Blood Request Form -->
        <section id="request" class="py-5 bg-light">
            <div class="container">
                <div class="card shadow border-0 mx-auto" style="max-width: 650px;">
                    <div class="card-header bg-danger text-white text-center py-3">
                        <h4 class="mb-0 fw-bold"><i class="fas fa-hand-holding-medical me-2"></i>Emergency Blood Request</h4>
                    </div>
                    <div class="card-body p-4">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label fw-bold">Patient Name</label>
                                <asp:TextBox ID="txtnm" runat="server" CssClass="form-control" placeholder="Patient Full Name"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold">Blood Group Needed</label>
                                <asp:DropDownList ID="drpreqbg" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="A+">A+</asp:ListItem>
                                    <asp:ListItem Value="A-">A-</asp:ListItem>
                                    <asp:ListItem Value="B+">B+</asp:ListItem>
                                    <asp:ListItem Value="B-">B-</asp:ListItem>
                                    <asp:ListItem Value="AB+">AB+</asp:ListItem>
                                    <asp:ListItem Value="AB-">AB-</asp:ListItem>
                                    <asp:ListItem Value="O+">O+</asp:ListItem>
                                    <asp:ListItem Value="O-">O-</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold">Units Needed</label>
                                <asp:TextBox ID="txtunits" runat="server" CssClass="form-control" placeholder="e.g. 2" TextMode="Number"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold">Contact Mobile</label>
                                <asp:TextBox ID="txtmbl" runat="server" CssClass="form-control" placeholder="Mobile Number"></asp:TextBox>
                            </div>
                            <div class="col-12">
                                <label class="form-label fw-bold">Hospital Name & City</label>
                                <asp:TextBox ID="txthosp" runat="server" CssClass="form-control" placeholder="Hospital Name & Location"></asp:TextBox>
                            </div>
                            <div class="col-12">
                                <label class="form-label fw-bold">Required Date</label>
                                <asp:TextBox ID="txtdt" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            </div>
                            <div class="col-12 text-center">
                                <asp:Label ID="lblreqmsg" runat="server" Font-Bold="true"></asp:Label>
                            </div>
                            <div class="col-12">
                                <asp:Button ID="btnreq" runat="server" Text="Submit Blood Request" CssClass="btn btn-danger w-100 fw-bold py-2" OnClick="btnreq_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer class="bg-dark text-white py-4 text-center">
            <p class="mb-0">&copy; 2024 LifeFlow Blood Bank Management System. All Rights Reserved.</p>
        </footer>
    </form>
</body>
</html>
