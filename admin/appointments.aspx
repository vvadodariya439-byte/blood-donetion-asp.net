<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="appointments.aspx.cs" Inherits="BloodBankSystem.admin.appointments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Appointments – LifeFlow Admin</title>
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
                <a href="appointments.aspx" class="nav-item-link active d-block p-2 text-decoration-none text-danger fw-bold"><i class="fas fa-calendar-check me-2"></i>Appointments</a>
                <a href="hospitals.aspx" class="nav-item-link d-block p-2 text-decoration-none"><i class="fas fa-hospital me-2"></i>Hospitals</a>
                <a href="reports.aspx" class="nav-item-link d-block p-2 text-decoration-none"><i class="fas fa-file-chart-bar me-2"></i>Reports</a>
                <a href="../logout.aspx" class="nav-item-link d-block p-2 text-decoration-none text-danger mt-4"><i class="fas fa-sign-out-alt me-2"></i>Logout</a>
            </nav>
        </aside>

        <div class="main-wrapper p-4">
            <header class="top-header mb-4 border-bottom pb-2">
                <h2 class="fw-bold">Donation Appointments</h2>
            </header>

            <div>
                <center>
                    <h3>Scheduled Appointments</h3>
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
                                <asp:TemplateField HeaderText="Donor Name">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("DonorName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Camp Name">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("CampName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Appointment Date">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("AppointmentDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Time Slot">
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("TimeSlot") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("Status") %>' Font-Bold="true"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Complete">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButtonComp" runat="server" CommandName="CompleteData" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-success">Complete</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cancel">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButtonCancel" runat="server" CommandName="CancelData" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-danger">Cancel</asp:LinkButton>
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
