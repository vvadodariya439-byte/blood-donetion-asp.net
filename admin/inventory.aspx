<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inventory.aspx.cs" Inherits="BloodBankSystem.admin.inventory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Blood Inventory – LifeFlow Admin</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" href="../assets/css/style.css" />
    <style type="text/css">
        .auto-style1 {
            width: 150px;
            font-weight: bold;
        }
    </style>
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
                <a href="inventory.aspx" class="nav-item-link active d-block p-2 text-decoration-none text-danger fw-bold"><i class="fas fa-warehouse me-2"></i>Blood Inventory</a>
                <a href="requests.aspx" class="nav-item-link d-block p-2 text-decoration-none"><i class="fas fa-hand-holding-medical me-2"></i>Blood Requests</a>
                <a href="camps.aspx" class="nav-item-link d-block p-2 text-decoration-none"><i class="fas fa-campground me-2"></i>Blood Camps</a>
                <a href="appointments.aspx" class="nav-item-link d-block p-2 text-decoration-none"><i class="fas fa-calendar-check me-2"></i>Appointments</a>
                <a href="hospitals.aspx" class="nav-item-link d-block p-2 text-decoration-none"><i class="fas fa-hospital me-2"></i>Hospitals</a>
                <a href="reports.aspx" class="nav-item-link d-block p-2 text-decoration-none"><i class="fas fa-file-chart-bar me-2"></i>Reports</a>
                <a href="../logout.aspx" class="nav-item-link d-block p-2 text-decoration-none text-danger mt-4"><i class="fas fa-sign-out-alt me-2"></i>Logout</a>
            </nav>
        </aside>

        <div class="main-wrapper p-4">
            <header class="top-header mb-4 border-bottom pb-2">
                <h2 class="fw-bold">Blood Inventory & Stock Management</h2>
            </header>

            <div>
                <center>
                    <h1>Manage Stock</h1>
                    <asp:HiddenField ID="hfId" runat="server" />
                    <table border="3" class="table table-bordered bg-white shadow-sm" style="max-width: 550px;">
                        <tr>
                            <td class="auto-style1">Blood Group:</td>
                            <td>
                                <asp:DropDownList ID="drpbg" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="A+">A+</asp:ListItem>
                                    <asp:ListItem Value="A-">A-</asp:ListItem>
                                    <asp:ListItem Value="B+">B+</asp:ListItem>
                                    <asp:ListItem Value="B-">B-</asp:ListItem>
                                    <asp:ListItem Value="AB+">AB+</asp:ListItem>
                                    <asp:ListItem Value="AB-">AB-</asp:ListItem>
                                    <asp:ListItem Value="O+">O+</asp:ListItem>
                                    <asp:ListItem Value="O-">O-</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Units Available:</td>
                            <td>
                                <asp:TextBox ID="txtunits" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="text-center">
                                <asp:Label ID="lblmsg" runat="server" ForeColor="Green" Font-Bold="true"></asp:Label><br />
                                <asp:Button ID="btn" runat="server" Text="Update / Add Stock" CssClass="btn btn-danger fw-bold px-4 mt-2" OnClick="btn_Click" />
                            </td>
                        </tr>
                    </table>

                    <br />
                    <h3>Current Inventory Stock</h3>
                    <div class="table-responsive">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped bg-white shadow-sm" Style="max-width: 700px;" OnRowCommand="GridView1_RowCommand">
                            <HeaderStyle CssClass="table-danger text-center" />
                            <Columns>
                                <asp:TemplateField HeaderText="Id">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Blood Group">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("BloodGroup") %>' Font-Bold="true"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Units">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Units") %>' CssClass="badge bg-success" Font-Size="Medium"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Last Updated">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("LastUpdated", "{0:dd-MMM-yyyy hh:mm tt}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Edit">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="EditData" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-primary">Edit</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="DeleteData" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-danger" OnClientClick="return confirm('Are you sure you want to delete this stock entry?');">Delete</asp:LinkButton>
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
