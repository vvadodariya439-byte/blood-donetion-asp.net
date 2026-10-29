<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="requests.aspx.cs" Inherits="BloodBankSystem.admin.requests" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Blood Requests – LifeFlow Admin</title>
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
                <a href="requests.aspx" class="nav-item-link active d-block p-2 text-decoration-none text-danger fw-bold"><i class="fas fa-hand-holding-medical me-2"></i>Blood Requests</a>
                <a href="camps.aspx" class="nav-item-link d-block p-2 text-decoration-none"><i class="fas fa-campground me-2"></i>Blood Camps</a>
                <a href="appointments.aspx" class="nav-item-link d-block p-2 text-decoration-none"><i class="fas fa-calendar-check me-2"></i>Appointments</a>
                <a href="hospitals.aspx" class="nav-item-link d-block p-2 text-decoration-none"><i class="fas fa-hospital me-2"></i>Hospitals</a>
                <a href="reports.aspx" class="nav-item-link d-block p-2 text-decoration-none"><i class="fas fa-file-chart-bar me-2"></i>Reports</a>
                <a href="../logout.aspx" class="nav-item-link d-block p-2 text-decoration-none text-danger mt-4"><i class="fas fa-sign-out-alt me-2"></i>Logout</a>
            </nav>
        </aside>

        <div class="main-wrapper p-4">
            <header class="top-header mb-4 border-bottom pb-2">
                <h2 class="fw-bold">Blood Requests Management</h2>
            </header>

            <div>
                <center>
                    <h3>Patient Blood Requests List</h3>
                    <asp:Label ID="lblmsg" runat="server" ForeColor="Green" Font-Bold="true"></asp:Label><br /><br />
                    <div class="table-responsive">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped bg-white shadow-sm" OnRowCommand="GridView1_RowCommand">
                            <HeaderStyle CssClass="table-danger text-center" />
                            <Columns>
                                <asp:TemplateField HeaderText="Id">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Patient Name">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("PatientName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Blood Group">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("BloodGroup") %>' Font-Bold="true"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Units Needed">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("UnitsNeeded") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Hospital">
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("HospitalName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Contact Mobile">
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("ContactMobile") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Requirement Date">
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("RequirementDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("Status") %>' Font-Bold="true"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Approve">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButtonApprove" runat="server" CommandName="ApproveData" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-success">Approve</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Reject">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButtonReject" runat="server" CommandName="RejectData" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-danger">Reject</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </center>
            </div>
        </div>
    </form>
</body>
</html>
