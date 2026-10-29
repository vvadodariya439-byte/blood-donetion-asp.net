<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reports.aspx.cs" Inherits="BloodBankSystem.admin.reports" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Reports – LifeFlow Admin</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" href="../assets/css/style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <aside class="sidebar" id="sidebar">
            <div class="sidebar-header">
                <div class="d-flex align-items-center gap-2">
                    <i class="fas fa-tint fa-lg sidebar-logo" style="color:#e74c3c;"></i>
                    <div>
                        <p class="sidebar-title font-weight-bold mb-0">LifeFlow Admin</p>
                        <p class="sidebar-sub small mb-0">Blood Bank System</p>
                    </div>
                </div>
            </div>

            <nav class="sidebar-nav p-2">
                <a href="dashboard.aspx" class="nav-item-link d-block p-2 text-decoration-none"><i class="fas fa-th-large me-2"></i>Dashboard</a>
                <a href="donors.aspx" class="nav-item-link d-block p-2 text-decoration-none"><i class="fas fa-users me-2"></i>Donors Management</a>
                <a href="users.aspx" class="nav-item-link d-block p-2 text-decoration-none"><i class="fas fa-user-friends me-2"></i>Users Management</a>
                <a href="inventory.aspx" class="nav-item-link d-block p-2 text-decoration-none"><i class="fas fa-warehouse me-2"></i>Blood Inventory</a>
                <a href="requests.aspx" class="nav-item-link d-block p-2 text-decoration-none"><i class="fas fa-hand-holding-medical me-2"></i>Blood Requests</a>
                <a href="camps.aspx" class="nav-item-link d-block p-2 text-decoration-none"><i class="fas fa-campground me-2"></i>Blood Camps</a>
                <a href="appointments.aspx" class="nav-item-link d-block p-2 text-decoration-none"><i class="fas fa-calendar-check me-2"></i>Appointments</a>
                <a href="hospitals.aspx" class="nav-item-link d-block p-2 text-decoration-none"><i class="fas fa-hospital me-2"></i>Hospitals</a>
                <a href="reports.aspx" class="nav-item-link active d-block p-2 text-decoration-none text-danger fw-bold"><i class="fas fa-file-chart-bar me-2"></i>Reports</a>
                <a href="../logout.aspx" class="nav-item-link d-block p-2 text-decoration-none text-danger mt-4"><i class="fas fa-sign-out-alt me-2"></i>Logout</a>
            </nav>
        </aside>

        <div class="main-wrapper p-4">
            <header class="top-header mb-4 border-bottom pb-2">
                <h2 class="fw-bold">Reports & Summary Analytics</h2>
            </header>

            <div>
                <center>
                    <div class="card shadow-sm p-4 text-start mb-4" style="max-width: 800px;">
                        <h4 class="fw-bold mb-3"><i class="fas fa-filter text-danger me-2"></i>Generate Donors Report by Blood Group & City</h4>
                        <div class="row g-3 align-items-center">
                            <div class="col-md-5">
                                <label class="form-label fw-bold">Blood Group</label>
                                <asp:DropDownList ID="drpbg" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="">All Blood Groups</asp:ListItem>
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
                            <div class="col-md-5">
                                <label class="form-label fw-bold">City</label>
                                <asp:DropDownList ID="drpct" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="">All Cities</asp:ListItem>
                                    <asp:ListItem Value="Rajkot">Rajkot</asp:ListItem>
                                    <asp:ListItem Value="Morbi">Morbi</asp:ListItem>
                                    <asp:ListItem Value="Ahmedabad">Ahmedabad</asp:ListItem>
                                    <asp:ListItem Value="Surat">Surat</asp:ListItem>
                                    <asp:ListItem Value="Pune">Pune</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-2 mt-4">
                                <asp:Button ID="btnsearch" runat="server" Text="Filter" CssClass="btn btn-danger w-100 fw-bold" OnClick="btnsearch_Click" />
                            </div>
                        </div>
                    </div>

                    <h3>Report Results</h3>
                    <div class="table-responsive">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped bg-white shadow-sm" Style="max-width: 850px;">
                            <HeaderStyle CssClass="table-danger text-center" />
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Donor Id" />
                                <asp:BoundField DataField="Name" HeaderText="Name" />
                                <asp:BoundField DataField="Gender" HeaderText="Gender" />
                                <asp:BoundField DataField="Email" HeaderText="Email" />
                                <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                                <asp:BoundField DataField="BloodGroup" HeaderText="Blood Group" />
                                <asp:BoundField DataField="City" HeaderText="City" />
                                <asp:BoundField DataField="Status" HeaderText="Status" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </center>
            </div>
        </div>
    </form>
</body>
</html>
