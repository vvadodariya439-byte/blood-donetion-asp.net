<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="BloodBankSystem.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Register – LifeFlow Blood Bank</title>
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
                    <h2 class="fw-800 text-white mt-3 mb-2">Join LifeFlow</h2>
                    <p class="auth-tagline mb-4">Be a hero. Donate blood. Save lives.</p>
                    <hr style="border-color:rgba(255,255,255,.2)" />
                    <div class="mt-4 text-start">
                        <div class="d-flex align-items-center gap-3 mb-3">
                            <div class="feature-icon red" style="flex-shrink:0"><i class="fas fa-check"></i></div>
                            <p class="text-white mb-0 small">Free registration with instant access</p>
                        </div>
                        <div class="d-flex align-items-center gap-3 mb-3">
                            <div class="feature-icon red" style="flex-shrink:0"><i class="fas fa-check"></i></div>
                            <p class="text-white mb-0 small">Track your donations and earn certificates</p>
                        </div>
                        <div class="d-flex align-items-center gap-3 mb-3">
                            <div class="feature-icon red" style="flex-shrink:0"><i class="fas fa-check"></i></div>
                            <p class="text-white mb-0 small">Get notified when you're eligible to donate</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Panel -->
            <div class="auth-right" style="overflow-y:auto">
                <div class="auth-card">
                    <a href="index.aspx" class="text-muted small mb-4 d-inline-flex align-items-center gap-1">
                        <i class="fas fa-arrow-left"></i> Back to Home
                    </a>
                    <h3 class="fw-800 text-secondary mt-2 mb-1">Create Account</h3>
                    <p class="text-muted mb-4">Fill in your details to register</p>

                    <div class="row g-3">
                        <div class="col-12">
                            <label class="form-label text-muted small fw-600">Register As</label>
                            <asp:DropDownList ID="drprole" runat="server" CssClass="form-select">
                                <asp:ListItem Value="donor">Donor</asp:ListItem>
                                <asp:ListItem Value="user">User / Patient</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <asp:TextBox ID="txtnm" runat="server" CssClass="form-control" placeholder="Full Name"></asp:TextBox>
                                <label for="txtnm">Full Name</label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-floating">
                                <asp:TextBox ID="txteml" runat="server" CssClass="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>
                                <label for="txteml">Email Address</label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-floating">
                                <asp:TextBox ID="txtmbl" runat="server" CssClass="form-control" placeholder="Mobile"></asp:TextBox>
                                <label for="txtmbl">Mobile Number</label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label text-muted small fw-600">Gender</label>
                            <asp:RadioButtonList ID="rdbgen" runat="server" RepeatDirection="Horizontal" CssClass="w-100">
                                <asp:ListItem Value="Male" Selected="True">Male &nbsp;&nbsp;</asp:ListItem>
                                <asp:ListItem Value="Female">Female</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>

                        <div class="col-md-6">
                            <div class="form-floating">
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
                                <label for="drpbg">Blood Group</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <asp:TextBox ID="txtadd" runat="server" CssClass="form-control" placeholder="Address"></asp:TextBox>
                                <label for="txtadd">Address</label>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-floating">
                                <asp:TextBox ID="txtct" runat="server" CssClass="form-control" placeholder="City"></asp:TextBox>
                                <label for="txtct">City</label>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-floating">
                                <asp:TextBox ID="txtst" runat="server" CssClass="form-control" placeholder="State"></asp:TextBox>
                                <label for="txtst">State</label>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-floating">
                                <asp:TextBox ID="txtpin" runat="server" CssClass="form-control" placeholder="PIN Code"></asp:TextBox>
                                <label for="txtpin">PIN Code</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <asp:TextBox ID="txtpwd" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                <label for="txtpwd">Password</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <label class="form-label text-muted small fw-600">Profile Photo</label>
                            <asp:FileUpload ID="flpimg" runat="server" CssClass="form-control" />
                        </div>

                        <div class="col-12 text-center">
                            <asp:Label ID="lblmsg" runat="server" ForeColor="Green" Font-Bold="true"></asp:Label>
                        </div>

                        <div class="col-12">
                            <asp:Button ID="btn" runat="server" Text="Create Account" CssClass="btn btn-primary-custom w-100" OnClick="btn_Click" />
                        </div>

                        <div class="col-12 text-center">
                            <p class="text-muted small">
                                Already have an account? <a href="login.aspx" class="text-blood fw-700">Sign In</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
