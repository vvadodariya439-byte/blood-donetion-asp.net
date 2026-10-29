<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="BloodBankSystem.admin.dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Dashboard – LifeFlow</title>
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
                <a href="dashboard.aspx" class="nav-item-link active d-block p-2 text-decoration-none text-danger fw-bold"><i class="fas fa-th-large me-2"></i>Dashboard</a>
                <a href="donors.aspx" class="nav-item-link d-block p-2 text-decoration-none"><i class="fas fa-users me-2"></i>Donors Management</a>
                <a href="users.aspx" class="nav-item-link d-block p-2 text-decoration-none"><i class="fas fa-user-friends me-2"></i>Users Management</a>
                <a href="inventory.aspx" class="nav-item-link d-block p-2 text-decoration-none"><i class="fas fa-warehouse me-2"></i>Blood Inventory</a>
                <a href="requests.aspx" class="nav-item-link d-block p-2 text-decoration-none"><i class="fas fa-hand-holding-medical me-2"></i>Blood Requests</a>
                <a href="camps.aspx" class="nav-item-link d-block p-2 text-decoration-none"><i class="fas fa-campground me-2"></i>Blood Camps</a>
                <a href="appointments.aspx" class="nav-item-link d-block p-2 text-decoration-none"><i class="fas fa-calendar-check me-2"></i>Appointments</a>
                <a href="hospitals.aspx" class="nav-item-link d-block p-2 text-decoration-none"><i class="fas fa-hospital me-2"></i>Hospitals</a>
                <a href="reports.aspx" class="nav-item-link d-block p-2 text-decoration-none"><i class="fas fa-file-chart-bar me-2"></i>Reports</a>
                <a href="../logout.aspx" class="nav-item-link d-block p-2 text-decoration-none text-danger mt-4"><i class="fas fa-sign-out-alt me-2"></i>Logout</a>
            </nav>
        </aside>

        <div class="main-wrapper p-4">
            <header class="top-header mb-4 d-flex justify-content-between align-items-center pb-2 border-bottom">
                <h2 class="fw-bold mb-0">Admin Dashboard</h2>
                <div class="user-info">
                    <span class="fw-bold">Welcome, Admin</span>
                </div>
            </header>

            <div class="row g-4 mb-4">
                <div class="col-md-3">
                    <div class="card bg-danger text-white shadow-sm p-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h3 class="fw-bold"><asp:Label ID="lbldonors" runat="server" Text="0"></asp:Label></h3>
                                <p class="mb-0">Total Registered Donors</p>
                            </div>
                            <i class="fas fa-users fa-2x"></i>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card bg-warning text-dark shadow-sm p-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h3 class="fw-bold"><asp:Label ID="lblrequests" runat="server" Text="0"></asp:Label></h3>
                                <p class="mb-0">Pending Blood Requests</p>
                            </div>
                            <i class="fas fa-hand-holding-medical fa-2x"></i>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card bg-success text-white shadow-sm p-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h3 class="fw-bold"><asp:Label ID="lblinventory" runat="server" Text="0"></asp:Label></h3>
                                <p class="mb-0">Total Blood Units Stock</p>
                            </div>
                            <i class="fas fa-warehouse fa-2x"></i>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card bg-primary text-white shadow-sm p-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h3 class="fw-bold"><asp:Label ID="lblcamps" runat="server" Text="0"></asp:Label></h3>
                                <p class="mb-0">Active Blood Camps</p>
                            </div>
                            <i class="fas fa-campground fa-2x"></i>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row g-4">
                <div class="col-md-6">
                    <div class="card shadow-sm p-3">
                        <h5 class="fw-bold mb-3"><i class="fas fa-users text-danger me-2"></i>Recent Donors</h5>
                        <asp:GridView ID="GridViewRecentDonors" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-sm text-center">
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="Name" />
                                <asp:BoundField DataField="BloodGroup" HeaderText="Blood Group" />
                                <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                                <asp:BoundField DataField="City" HeaderText="City" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card shadow-sm p-3">
                        <h5 class="fw-bold mb-3"><i class="fas fa-hand-holding-medical text-warning me-2"></i>Recent Blood Requests</h5>
                        <asp:GridView ID="GridViewRecentRequests" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-sm text-center">
                            <Columns>
                                <asp:BoundField DataField="PatientName" HeaderText="Patient" />
                                <asp:BoundField DataField="BloodGroup" HeaderText="Group" />
                                <asp:BoundField DataField="UnitsNeeded" HeaderText="Units" />
                                <asp:BoundField DataField="Status" HeaderText="Status" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
