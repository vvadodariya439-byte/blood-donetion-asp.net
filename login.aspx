<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="BloodBankSystem.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login – LifeFlow Blood Bank</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" href="assets/css/style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="auth-wrapper">
            <!-- Left Panel -->
            <div class="auth-left">
                <div style="position:relative;z-index:2;text-align:center">
                    <div class="auth-logo-big"><i class="fas fa-tint" style="color:#ffd700"></i></div>
                    <h2 class="fw-800 text-white mt-3 mb-2">LifeFlow</h2>
                    <p class="auth-tagline mb-4">Blood Bank Management System</p>
                    <hr style="border-color:rgba(255,255,255,.2)" />
                    <div class="row g-3 mt-3">
                        <div class="col-12">
                            <div class="stat-card">
                                <div class="stat-num">12,450</div>
                                <div class="stat-lbl">Registered Donors</div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="stat-card">
                                <div class="stat-num">8.5K</div>
                                <div class="stat-lbl">Lives Saved</div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="stat-card">
                                <div class="stat-num">575</div>
                                <div class="stat-lbl">Units Available</div>
                            </div>
                        </div>
                    </div>
                    <p class="text-white-50 small mt-4">
                        <i class="fas fa-shield-alt me-1"></i> Secure &bull; Trusted &bull; Life-saving
                    </p>
                </div>
            </div>

            <!-- Right Panel -->
            <div class="auth-right">
                <div class="auth-card">
                    <a href="index.aspx" class="text-muted small mb-4 d-inline-flex align-items-center gap-1">
                        <i class="fas fa-arrow-left"></i> Back to Home
                    </a>
                    <h3 class="fw-800 text-secondary mt-2 mb-1">Welcome Back!</h3>
                    <p class="text-muted mb-4">Sign in to your account to continue</p>

                    <div class="mb-3">
                        <label class="form-label text-muted small fw-600">Select Login Role</label>
                        <asp:DropDownList ID="drprole" runat="server" CssClass="form-select">
                            <asp:ListItem Value="admin">Admin</asp:ListItem>
                            <asp:ListItem Value="donor">Donor</asp:ListItem>
                            <asp:ListItem Value="user">User / Patient</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-floating mb-3">
                        <asp:TextBox ID="txteml" runat="server" CssClass="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>
                        <label for="txteml"><i class="fas fa-envelope me-1 text-muted"></i> Email Address</label>
                    </div>

                    <div class="form-floating mb-3">
                        <asp:TextBox ID="txtpwd" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                        <label for="txtpwd"><i class="fas fa-lock me-1 text-muted"></i> Password</label>
                    </div>

                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <a href="forgot_password.aspx" class="text-blood small fw-600">Forgot Password?</a>
                    </div>

                    <div class="mb-3 text-center">
                        <asp:Label ID="lblmsg" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                    </div>

                    <asp:Button ID="btn" runat="server" Text="Login" CssClass="btn btn-primary-custom w-100 mb-3" OnClick="btn_Click" />

                    <p class="text-center text-muted small">
                        Don't have an account?
                        <a href="register.aspx" class="text-blood fw-700">Register Here</a>
                    </p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
