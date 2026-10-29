<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="BloodBankSystem.donor.dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Donor Dashboard – LifeFlow</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" href="../assets/css/style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- Top Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-danger sticky-top">
            <div class="container">
                <a class="navbar-brand d-flex align-items-center gap-2" href="dashboard.aspx">
                    <i class="fas fa-tint fa-lg" style="color:#ffd700"></i>
                    <div>
                        <div class="brand-text text-white font-weight-bold">LifeFlow Donor</div>
                    </div>
                </a>
                <div class="ms-auto d-flex align-items-center gap-3">
                    <span class="text-white fw-bold">Welcome, <asp:Label ID="lblusername" runat="server" Text="Donor"></asp:Label></span>
                    <asp:LinkButton ID="btnLogout" runat="server" CssClass="btn btn-outline-light btn-sm rounded-pill" OnClick="btnLogout_Click"><i class="fas fa-sign-out-alt me-1"></i>Logout</asp:LinkButton>
                </div>
            </div>
        </nav>

        <div class="container py-4">
            <div class="row g-4 mb-4">
                <!-- Donor Info Card -->
                <div class="col-md-4">
                    <div class="card shadow-sm border-0 text-center p-4">
                        <asp:Image ID="imgphoto" runat="server" ImageUrl="~/uploads/default.jpg" CssClass="rounded-circle mx-auto mb-3 shadow" Width="120" Height="120" />
                        <h4 class="fw-bold mb-1"><asp:Label ID="lblname" runat="server" Text="Donor Name"></asp:Label></h4>
                        <p class="text-muted mb-2"><asp:Label ID="lblemail" runat="server" Text="email@domain.com"></asp:Label></p>
                        <span class="badge bg-danger p-2 fs-6 mb-3"><i class="fas fa-droplet me-1"></i>Blood Group: <asp:Label ID="lblbg" runat="server" Text="A+"></asp:Label></span>
                        <hr />
                        <p class="mb-1 text-start"><strong>Mobile:</strong> <asp:Label ID="lblmobile" runat="server" Text="-"></asp:Label></p>
                        <p class="mb-1 text-start"><strong>City:</strong> <asp:Label ID="lblcity" runat="server" Text="-"></asp:Label></p>
                        <p class="mb-1 text-start"><strong>Address:</strong> <asp:Label ID="lbladdress" runat="server" Text="-"></asp:Label></p>
                    </div>
                </div>

                <!-- Book Appointment Form -->
                <div class="col-md-8">
                    <div class="card shadow-sm border-0 p-4 mb-4">
                        <h4 class="fw-bold mb-3 text-danger"><i class="fas fa-calendar-plus me-2"></i>Schedule Donation Appointment</h4>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label fw-bold">Select Blood Camp</label>
                                <asp:DropDownList ID="drpcamps" runat="server" CssClass="form-select"></asp:DropDownList>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold">Appointment Date</label>
                                <asp:TextBox ID="txtdt" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold">Preferred Time Slot</label>
                                <asp:DropDownList ID="drpslot" runat="server" CssClass="form-select">
                                    <asp:ListItem>09:00 AM - 11:00 AM</asp:ListItem>
                                    <asp:ListItem>11:00 AM - 01:00 PM</asp:ListItem>
                                    <asp:ListItem>02:00 PM - 04:00 PM</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-6 d-flex align-items-end">
                                <asp:Button ID="btnbook" runat="server" Text="Book Appointment" CssClass="btn btn-danger w-100 fw-bold" OnClick="btnbook_Click" />
                            </div>
                            <div class="col-12 text-center mt-2">
                                <asp:Label ID="lblmsg" runat="server" Font-Bold="true"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <!-- My Appointments History Grid -->
                    <div class="card shadow-sm border-0 p-4">
                        <h4 class="fw-bold mb-3"><i class="fas fa-history text-secondary me-2"></i>My Donation Appointments</h4>
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover text-center">
                                <HeaderStyle CssClass="table-danger" />
                                <Columns>
                                    <asp:BoundField DataField="CampName" HeaderText="Camp Name" />
                                    <asp:BoundField DataField="AppointmentDate" HeaderText="Date" />
                                    <asp:BoundField DataField="TimeSlot" HeaderText="Time Slot" />
                                    <asp:BoundField DataField="Status" HeaderText="Status" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
